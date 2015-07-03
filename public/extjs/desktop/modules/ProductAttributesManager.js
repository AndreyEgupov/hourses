Ext.define('MyDesktop.ProductAttributesManager', {
    extend: 'Ext.ux.desktop.Module',

    id:'product-attributes-manager',
        
    init : function(){
  
        var self = this;
        
        this.launcher = {
            text: 'ProductAttributes',
            iconCls: 'icon-grid',
            handler : this.createWindow,
            scope : this
        };
        
        this.grid = null;
        this.store = null;
        this.urlImage = null;

        Ext.define('Attribute', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                {name: 'attribute_name_id', type: 'int'},
                {name: '_int', type: 'int'},
                {name: '_double', type: 'float'},
                {name: 'boolean_', type: 'bool'},
                {name: 'date_', type: 'date'},
                {name: 'datetime_', type: 'date'},
                {name: 'id_sync', type: 'int'},
                '_text', 'varchar_', 'img_'
            ],
            idProperty: 'id'
        });

        Ext.define('AttributeTypes', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                'title'
            ],
            idProperty: 'id'
        });

        Ext.define('AttributeNames', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                {name: 'id_sync', type: 'int'},
                'title', 'type'
            ],
            idProperty: 'id'
        });

        Ext.define('ProductAttributes', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                {name: 'product_id', type: 'int'},
                {name: 'attribute_id', type: 'int'},
                {name: 'attribute_name_id', type: 'int'}
            ],
            idProperty: 'id'
        });

        this.attributeStore = Ext.create('Ext.data.Store', {
            model: 'Attribute',
            proxy: {
                type: 'ajax',
                url: '/admin/attribute/getList.json',
                reader: {
                    type: 'json',
                    root: 'data',
                    totalProperty: 'totalCount'
                }
            }
        }).load();
        this.attributeNamesStore = Ext.create('Ext.data.Store', {
            model: 'AttributeNames',
            proxy: {
                type: 'ajax',
                url: '/admin/attribute-names/findBy',
                reader: {
                    type: 'json',
                    root: 'data',
                    totalProperty: 'totalCount'
                },
                extraParams : {
                    condition : 'is_visible = 1'
                }
            }
        }).load();

        this.attributeValuesStore = Ext.create('Ext.data.Store', {
            fields : [
                {name: 'id',  type: 'int'},
                {name: 'value',  type: 'string'}
            ],
            proxy: {
                type: 'ajax',
                url: '/admin/attribute-values/find',
                reader: {
                    type: 'json',
                    root: 'data',
                    totalProperty: 'totalCount'
                }
            },
            autoload : true,
            listeners : {
                beforeload : function (store) {
                    var val = Ext.getCmp('attribute-names-combo').getValue();
                    if(!val) return;

                    var model = self.attributeNamesStore.findRecord('id', val);
                    var type = model.get('type');

                    store.getProxy().extraParams = {
                        type: type,
                        attribute_name_id : val
                    };
                }
            }
        });
    },

    createWindow : function(product_id, data){ // открытие списка событий
        
        var desktop = this.app.getDesktop();
        var id = this.id;
        var win = desktop.getWindow(id);

        var self = this;
       
        if(!win) {

            this.store = Ext.create('Ext.data.Store', {

                model: 'ProductAttributes',
                proxy: {
                    type: 'ajax',
                    url: '/admin/product-attributes/findBy',
                    reader: {
                        type: 'json',
                        root: 'data',
                        totalProperty: 'totalCount'
                    },
                    extraParams : {
                        condition : 'product_id = ' + product_id
                    }
                },
                autoLoad: true,
                listeners: {
                    load : function (store, records) {
                        store.each(function () {
                            var attributeModel = self.attributeStore.findRecord('id', this.get('attribute_id'));
                            if(!attributeModel) return;
                            var attributeNameId = attributeModel.get('attribute_name_id');
                            this.set('attribute_name_id', attributeNameId);
                        });
                    }
                }
            });

            var store = this.store;
            
            this.grid = Ext.create('Ext.grid.Panel', {
                
                border: false,
                xtype: 'grid',
                store: store,
                loadMask: true,
                columns:[{
                    text: "Атрибут",
                    dataIndex: 'attribute_id',
                    flex : true,
                    renderer : function (value) {
                        var record = self.attributeNamesStore.findRecord('id', self.attributeStore.findRecord('id', value).get('attribute_name_id'));
                        return record.get('title');
                    }
                },{
                    text: "Значение",
                    dataIndex: 'attribute_id',
                    flex : true,
                    renderer : function (value) {
                        var record = self.attributeStore.findRecord('id', value),
                            val = record.get('text_');
                        val = val || record.get('int_');
                        val = val || record.get('double_');
                        val = val || record.get('boolean_');
                        val = val || record.get('date_');
                        val = val || record.get('datetime_');
                        val = val || record.get('varchar_');
                        val = val || record.get('img_');
                        return val;
                    }
                }]
            });
            
            var grid = this.grid;
        
            win = desktop.createWindow({
                id: id,
                title:'Аттрибуты продукта',
                width: 800,
                height: 600,
                iconCls: 'icon-grid',
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items: [
                    this.grid
                ],
                tbar:[{
                    iconCls: 'icon-add',
                    text: 'Добавить ',
                    scope: this,
                    handler: function() {

                        this.createForm("new", null, product_id);
                    }
                }, '-', {
                    iconCls: 'icon-add',
                    text: 'Редактирование ',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];

                        if (!selection) return;

                        this.createForm(selection.raw.id, selection.raw, product_id);
                    }
                }, '-', {
                    iconCls: 'icon-add',
                    text: 'Удалить',
                    scope: this,
                    handler: function() {
                        var selection = self.grid.getView().getSelectionModel().getSelection()[0];
                        if (!selection) return;
                        self.onDeleteClick(selection.raw.id);
                    }
                }]
            });
            
            store.load();
        }
        
        win.show(null, function() {windowShow(self)});

        
        return win;
    },
    onDeleteClick: function(id){
        var self = this;
        Ext.MessageBox.confirm('Confirm', 'Удалить?', function(btn) {
            if (btn != 'yes') return;
            Ext.Ajax.request({
                url: '/admin/product-attributes/remove/' + id,
                success: function() {
                    self.store.load();
                }
            });
        });
    },
    createForm : function(id, data, product_id){
       
        var desktop = this.app.getDesktop();
        var winId = 'product-attributes-manager-product-attributes-form-' + id;
        var win = desktop.getWindow(winId);
        
        var self = this;
        
        if(!win){

            this.form = Ext.widget('form', {
                arget: true,
                layout: {
                    type: 'anchor',
                    align: 'stretch'
                },
                autoScroll: true,
                border: false,
                bodyPadding: 10,

                fieldDefaults: {
                    labelAlign: 'right',
                    labelWidth: 105,
                    msgTarget: 'side',
                    anchor:'100%'
                },
                
                reader : Ext.create('Ext.data.reader.Json', {
                    model: 'ProductAttributes'
                }),

                items: [{
                    id : 'attribute-names-combo',
                    xtype: 'combo',
                    store: self.attributeNamesStore,
                    displayField: 'title',
                    valueField: 'id',
                    name: 'attribute_name_id',
                    fieldLabel: 'Название аттрибута',
                    autoHeight: true,
                    typeAhead: true,
                    forceSelection: true,
                    triggerAction: 'all',
                    queryMode: 'local',
                    listeners : {
                        change : function (combo, newValue, oldValue) {
                            var oldModel = self.attributeNamesStore.findRecord('id', oldValue);
                            var newModel = self.attributeNamesStore.findRecord('id', newValue);

                            if(oldModel) {
                                Ext.getCmp(oldModel.get('type')).setDisabled(true);
                                Ext.getCmp(oldModel.get('type')).setVisible(false);
                            }

                            if(newModel) {
                                Ext.getCmp(newModel.get('type')).setDisabled(false);
                                Ext.getCmp(newModel.get('type')).setVisible(true);
                            }

                            if(id === 'new' || !newModel) return;
                            var record = self.attributeStore.findRecord('id', data.attribute_id)
                                var val = record.get('text_');
                                val = val || record.get('int_');
                                val = val || record.get('double_');
                                val = val || record.get('boolean_');
                                val = val || record.get('date_');
                                val = val || record.get('datetime_');
                                val = val || record.get('varchar_');
                                val = val || record.get('img_');

                            Ext.getCmp(newModel.get('type')).setValue(val);
                        }
                    }
                },{
                    xtype: 'combobox',
                    displayField: 'value',
                    valueField: 'value',
                    typeAheadDelay: 200,
                    hideTrigger: true,
                    minChars: 1,
                    queryDelay: 250,
                    store : self.attributeValuesStore,
                    queryParam: 'value',

                    id : 'int_',
                    name: 'value',
                    fieldLabel: 'Значение(int)',
                    hidden : true,
                    disabled : true
                },{
                    xtype: 'combobox',
                    displayField: 'value',
                    valueField: 'value',
                    typeAheadDelay: 200,
                    hideTrigger: true,
                    minChars: 1,
                    queryDelay: 250,
                    store : self.attributeValuesStore,
                    queryParam: 'value',

                    id : 'double_',
                    fieldLabel: 'Значение(double)',
                    name: 'value',
                    hidden : true,
                    disabled : true
                },{
                    xtype: 'combobox',
                    displayField: 'value',
                    valueField: 'value',
                    typeAheadDelay: 200,
                    hideTrigger: true,
                    minChars: 1,
                    queryDelay: 250,
                    store : self.attributeValuesStore,
                    queryParam: 'value',

                    id : 'varchar_',
                    fieldLabel: 'Значение(varchar)',
                    name: 'value',
                    hidden : true,
                    disabled : true
                },{
                    id : 'text_',
                    xtype: 'htmleditor',
                    name: 'value',
                    fieldLabel: 'Значение(text)',
                    height: 400,
                    hidden : true,
                    disabled : true
                },{
                    id : 'date_',
                    xtype: 'datefield',
                    fieldLabel: 'Значение(date)',
                    name : 'value',
                    format: 'd.m.Y',
                    submitFormat: 'Y-m-d',
                    hidden : true,
                    disabled : true
                },{
                    id : 'datetime_',
                    xtype: 'datefield',
                    fieldLabel: 'Значение(datetime)',
                    name : 'value',
                    format: 'd.m.Y H:i:s',
                    submitFormat: 'Y-m-d H:i:s',
                    hidden : true,
                    disabled : true
                }
            ],

                buttons: [{
                    text: 'Сохранить',
                    formBind: true,
                    handler: function(){
                        var model = self.attributeNamesStore
                            .findRecord('id', Ext.getCmp('attribute-names-combo').getValue());

                        this.up('form').getForm().submit({
                            params: {
                                product_attribute_id : id,
                                product_id : product_id,
                                type : model.get('type')
                            },
                            url: '/admin/attribute-values/save.json',
                            submitEmptyText: false,
                            waitMsg: 'Сохранение...',
                            success: function(form, action) {
                                win.close();
                                self.store.load();
                            }
                        });
                    }
                }]
            });
            
            var title = 'Редактирование Статьи';
            
            win = desktop.createWindow({
                id: winId,
                title: title,
                width : "70%",
                height : 650,
                iconCls: 'icon-form',
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items: [
                    this.form
                ]
            });
            
            if (id != 'new') {
                this.form.getForm().load({
                    url: '/admin/product-attributes/getOne.json',
                    params : {
                        'id' : id
                    },
                    success : function (form) {
                        self.doSelectAttributeNames(form, self, data);
                    }
                });
            }
        }
        win.show();
    },

    doSelectAttributeNames :  function (form, self, data) {
        var attributeModel = self.attributeStore.findRecord('id', data.attribute_id);
        if(!attributeModel) return;

        var attributeNameId = attributeModel.get('attribute_name_id');
        if(!attributeNameId) return;

        var attributeNamesModel = self.attributeNamesStore.findRecord('id', attributeNameId);

        Ext.getCmp('attribute-names-combo').select(attributeNamesModel);
        Ext.getCmp('attribute-names-combo').fireEvent('change')
    }
});

