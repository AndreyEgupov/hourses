Ext.define('MyDesktop.ServiceManager', {
    extend: 'Ext.ux.desktop.Module',

    id:'service-manager',
        
    init : function(){
  
        var self = this;
        
        this.launcher = {
            text: 'Service',
            iconCls: 'icon-grid',
            handler : this.createWindow,
            scope : this
        };
        
        this.grid = null;
        this.store = null;
        this.urlImage = null;
  
        Ext.define('Service', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                {name: 'parent_id', type: 'int'},
                {name: 'count_products', type: 'int'},
                'title',
                {name: 'is_active', type: 'bool'}
            ],
            idProperty: 'id'
        });

    },

    createWindow : function(){ // открытие списка событий 
        
        var desktop = this.app.getDesktop();
        var id = this.id;
        var win = desktop.getWindow(id);

        var self = this;
       
        if(!win) {
        
            // create the Data Store
            this.store = Ext.create('Ext.data.Store', {
                model : "Service",
                proxy: {
                    type: 'ajax',
                    url: '/admin/service/getList.json',
                    reader: {
                        type: 'json',
                        root: 'data',
                        totalProperty: 'totalCount'
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
                    text: "Id",
                    dataIndex: 'id',
                    width: 30,
                    sortable: true
                },{
                    text: "Title",
                    dataIndex: 'title',
                    sortable: true,
                    flex: true
                },{
                    text: "Родитель",
                    dataIndex: 'parent_id',
                    flex : true,
                    sortable: true,
                    renderer : function (val) {
                        var title = null;
                        Ext.Array.each(self.store.getRange(), function (r) {
                            if (val == r.data.id) {
                                title = r.data.title;
                            }
                        });
                        return title;
                    },
                    width: 170
                },{
                    text: "Кол-во товатор",
                    dataIndex: 'count_products',
                    sortable: true,
                    flex: true
                }]
            });
            
            var grid = this.grid;
        
            win = desktop.createWindow({
                id: id,
                title:'Категории товаров',
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
                    text: 'Добавить',
                    scope: this,
                    handler: function() {
                        this.createForm("new");
                    }
                }, '-', {
                    iconCls: 'icon-add',
                    text: 'Редактирование',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];
                        if (!selection) return;
                        this.createForm(selection.raw.id, selection.raw);
                    }
                }]
            });
            
            store.load();
        }
        win.show(null, function() {windowShow(self)});
        return win;
    },

    createForm : function(id, data){

        var desktop = this.app.getDesktop();
        var winId = 'service-manager-service-form-' + id;
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
                    labelWidth: 95,
                    msgTarget: 'side',
                    anchor:'100%'
                },

                reader : Ext.create('Ext.data.reader.Json', {
                    model: 'Service'
                }),

                items: [{
                    xtype: 'textfield',
                    fieldLabel: 'Id',
                    name: 'id',
                    disabled: true
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Название *',
                    name: 'title',
                    allowBlank: false
                },{
                    xtype: 'combo',
                    store: self.store,
                    displayField: 'title',
                    valueField: 'id',
                    name: 'parent_id',
                    fieldLabel: 'Родительская',
                    autoHeight: true,
                    typeAhead: true,
                    forceSelection: true,
                    triggerAction: 'all',
                    queryMode: 'local'
                }],

                buttons: [{
                    text: 'Сохранить',
                    formBind: true,
                    handler: function(){
                        this.up('form').getForm().submit({
                            params: {
                                'id' : id
                            },
                            url: '/admin/service/save/'+id,
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

            var form = this.form;
            var title = id == 'new'? 'Создание' : 'Редактирование';

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
                    form
                ]
            });

            if (id != 'new') {
                form.getForm().load({
                    url: '/admin/service/getOne',
                    params : {
                        'id' : id
                    }
                });
            }
        }
        win.show();
    }
});

