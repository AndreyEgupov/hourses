Ext.define('MyDesktop.ProductManager', {
    extend: 'Ext.ux.desktop.Module',

    id:'product-manager',
        
    init : function(){
  
        var self = this;
        
        this.launcher = {
            text: 'Product',
            iconCls: 'icon-grid',
            handler : this.createWindow,
            scope : this
        };
        
        this.grid = null;
        this.store = null;
        this.urlImage = null;

        Ext.define('Product', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                {name: 'price', type: 'float'},
                {name: 'price_old', type: 'float'},
                {name: 'id_sync', type: 'int'},
                {name: 'date_update', type: 'date'},
                {name: 'date_create', type: 'date'},
                {name: 'is_available', type: 'bool'},
                {name: 'category_id', type: 'int'},
                'title'
            ],
            idProperty: 'id'
        });

        Ext.define('Category', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                {name: 'title', type: 'string'}
            ],
            idProperty: 'id'
        });

        Ext.define('ProductsImages', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                'src',
                {name: 'product_id', type: 'int'}
            ],
            idProperty: 'id'
        });
    },

    createWindow : function(){ // открытие списка событий 
        this.productAttributeList = this.app.getProductAttributes();

        var desktop = this.app.getDesktop();
        var id = this.id;
        var win = desktop.getWindow(id);

        var self = this;
       
        if(!win) {
            this.categoryStore = Ext.create('Ext.data.Store', {
                model: 'Category',
                proxy: {
                    type: 'ajax',
                    url: '/admin/service/getList.json',
                    reader: {
                        type: 'json',
                        root: 'data',
                        totalProperty: 'totalCount'
                    }
                },
                autoLoad: true
            });

            this.store = Ext.create('Ext.data.Store', {

                model: 'Product',
                remoteGroup: true,

                buffered: true,
                leadingBufferZone: 300,
                pageSize: 100,
                proxy: {

                    type: 'ajax',
                    url: '/admin/product/getList.json',
                    reader: {
                        root: 'data',
                        totalProperty: 'totalCount'
                    },
                    extraParams : {
                        search : ""
                    },

                    simpleSortMode: true,
                    simpleGroupMode: true,

                    groupParam: 'sort',
                    groupDirectionParam: 'id'
                },
                sorters: [{
                    property: 'id',
                    direction: 'DESC'
                }],
                autoLoad: true,
                autoSync: true,
                listeners: {
                    // This particular service cannot sort on more than one field, so if grouped, disable sorting
                    groupchange: function(store, groupers) {
                        self.grid.getSelectionModel().clearSelections();
                        var sortable = !store.isGrouped(),
                            headers = grid.headerCt.getVisibleGridColumns(),
                            i, len = headers.length;

                        for (i = 0; i < len; i++) {
                            headers[i].sortable = (headers[i].sortable !== undefined) ? headers[i].sortable : sortable;
                        }
                    },

                    // This particular service cannot sort on more than one field, so if grouped, disable sorting
                    beforeprefetch: function(store, operation) {
                        self.grid.getSelectionModel().clearSelections();
                        if (operation.groupers && operation.groupers.length) {
                            delete operation.sorters;
                        }
                    },

                    beforeload : function( store, operation, eOpts ){
                        self.grid.getSelectionModel().clearSelections();
                        var value = win.getChildByElement("mysearchProfile").getChildByElement('mysearchProfile').getValue();
                        if(value !== "") {
                            store.proxy.extraParams.search = value;
                        } else if(store.proxy.extraParams.search !== undefined) {
                            delete(store.proxy.extraParams.search);
                        }
                    }
                }
            });
            this.grid = Ext.create('Ext.grid.Panel', {

                border: false,
                xtype: 'grid',
                store: this.store,
                loadMask: true,
                columns:[{
                    text: "Id",
                    dataIndex: 'id',
                    width: 70,
                    sortable: true
                },{
                    text: "title",
                    dataIndex: 'title',
                    flex : true,
                    sortable: true
                },{
                    text: "Цена",
                    dataIndex: 'price',
                    flex : true,
                    sortable: true
                },{
                    text: "Старая цена",
                    dataIndex: 'price_old',
                    flex : true,
                    sortable: true
                },{
                    text: 'В наличии',
                    dataIndex: 'is_available',
                    trueText: "&radic;",
                    falseText: "",
                    xtype: 'booleancolumn',
                    width: 120,
                    align: 'center',
                    sortable: true
                },{
                    text: "id Sync",
                    dataIndex: 'id_sync',
                    width: 100,
                    sortable: true
                },{
                    text: "url",
                    dataIndex: 'id',
                    width : 70,
                    sortable: true,
                    renderer : function (value) {
                        return "<a href='/product/view/"+value+"' target='_blank'>view</a>";
                    }
                }]
            });

            win = desktop.createWindow({
                id: id,
                title:'Аттрибуты',
                width: '80%',
                height: 600,
                iconCls: 'icon-grid',
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items: [
                    self.grid
                ],
                tbar:[{
                    iconCls: 'icon-add',
                    text: 'Добавить',
                    scope: this,
                    handler: function() {
                        self.createForm("new");
                    }
                }, '-', {
                    iconCls: 'icon-add',
                    text: 'Редактирование',
                    scope: this,
                    handler: function() {
                        var selection = self.grid.getView().getSelectionModel().getSelection()[0];
                        if (!selection) return;
                        self.createForm(selection.raw.id, selection.raw);
                    }
                }, 'Найти',{
                    xtype: 'textfield',
                    name: 'searchField',
                    id : 'mysearchProfile',
                    hideLabel: true,
                    labelAlign: "right",
                    width: 200,
                    listeners: {
                        specialkey: function(field, e){
                            if (e.getKey() == e.ENTER) {
                                self.store.load();
                            }
                        },
                        change : function(e,value,oldVal) {

                            if(value==="" && oldVal!=="") {
                                self.store.load();
                            }
                        }
                    }

                }, {
                    xtype : "button",
                    text : "Поиск",
                    style : "width : 100px;",
                    listeners: {
                        click: function(){
                            var value = this.up().getChildByElement('mysearchProfile').getValue();
                            self.onTextFieldChange(value);
                        }
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
                }, '-', {
                    iconCls: 'icon-add',
                    text: 'Фотографии',
                    scope: this,
                    handler: function() {
                        var selection = self.grid.getView().getSelectionModel().getSelection()[0];
                        if (!selection) return;
                        self.createPhotoGrid(selection.raw.id, selection.raw);
                    }
                }, '-', {
                    iconCls: 'icon-add',
                    text: 'Аттрибуты',
                    scope: this,
                    handler: function() {
                        var selection = self.grid.getView().getSelectionModel().getSelection()[0];
                        if (!selection) return;
                        self.attributeList(selection.raw.id, selection.raw);
                    }
                }]
            });
            
        }
        
        win.show(null, function() {windowShow(self)});

        
        return win;
    },

    onTextFieldChange : function(value){
        this.store.load({
            params: {
                search : value
            }
        });
    },
    onDeleteClick: function(id){
        var self = this;
        Ext.MessageBox.confirm('Confirm', 'Удалить?', function(btn) {
            if (btn != 'yes') return;
            Ext.Ajax.request({
                url: '/admin/product/remove/' + id,
                success: function() {
                    self.store.load();
                }
            });
        });
    },

    attributeList : function (product_id, data) {
        this.productAttributeList.createWindow(product_id, data);
    },

    createForm : function(id, data){
       
        var desktop = this.app.getDesktop();
        var winId = 'product-manager-product-form-' + id;
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
                    model: 'Product'
                }),

                items: [{
                    xtype: 'textfield',
                    fieldLabel: 'Id',
                    name: 'id',
                    disabled: true
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Title *',
                    name: 'title',
                    allowBlank: false
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Цена *',
                    name: 'price',
                    allowBlank: false
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Старая цена *',
                    name: 'price_old'
                },{
                    xtype: 'combo',
                    store: self.categoryStore,
                    displayField: 'title',
                    valueField: 'id',
                    name: 'category_id',
                    fieldLabel: 'Категория',
                    autoHeight: true,
                    typeAhead: true,
                    forceSelection: true,
                    triggerAction: 'all',
                    queryMode: 'local'
                },{
                    xtype: 'checkboxfield',
                    fieldLabel: 'Есть в наличии',
                    name: 'is_available',
                    inputValue: "1",
                    uncheckedValue: "0",
                    checked: true
                },{
                    xtype: 'tinymcefield',
                    name: 'description',
                    fieldLabel: 'Описание',
                    height: 500,
                    tinymceConfig: {
                        theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
                        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,preview,|,forecolor,backcolor",
                        theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,media,advhr,|,print,|,insertfile,insertimage",
                        theme_advanced_buttons4: '',
                        skin: 'o2k7',
                        file_browser_callback : 'myFileBrowser',
                        remove_script_host : false,
                        convert_urls : false,
                        init_instance_callback : "showEditor"
                    }
                }
            ],

                buttons: [{
                    text: 'Сохранить',
                    formBind: true,
                    handler: function(){
                        this.up('form').getForm().submit({
                            params: {
                                'id' : id
                            },
                            url: '/admin/product/save.json',
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
            
            var title = 'Редактирование';
            
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
                var f = form.getForm().load({
                    url: '/admin/product/getOne.json',
                    params : {
                        'id' : id
                    }
                });
            }
        }
        win.show();
    },

    createPhotoGrid : function(id, data) {

        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('photo-grid-'+id);
        var self = this;

        if(!win) {

            // create the Data Store
            this.imagesStore = Ext.create('Ext.data.Store', {
                model : "ProductsImages",
                proxy: {
                    type: 'ajax',
                    url: '/admin/products-images/findBy',
                    extraParams : {
                        condition : 'product_id = ' + id
                    },
                    reader: {
                        type: 'json',
                        root: 'data',
                        totalProperty: 'totalCount'
                    }
                }
            });

            this.gridPhotos = Ext.create('Ext.grid.Panel', {

                border: false,
                xtype: 'grid',
                store: this.imagesStore,
                loadMask: true,
                columns:[{
                    text: "Id",
                    dataIndex: 'id',
                    width: 30,
                    sortable: true
                },{
                    text: "Картинка",
                    dataIndex: 'src',
                    sortable: true,
                    flex: true,
                    renderer : function (src) {
                        return '<img src="/timthumb.php?w=100&h=70&src='+src+'" />';
                    }
                },{
                    text: "Путь к картинке",
                    dataIndex: 'src',
                    sortable: true,
                    flex: true
                }]
            });

            var grid = this.gridPhotos;

            win = desktop.createWindow({
                id: id,
                title:'Фото',
                width: '50%',
                height: 500,
                iconCls: 'icon-grid',
                animCollapse : false,
                constrainHeader : true,
                layout: 'fit',
                items: [
                    grid
                ],
                tbar:[{
                    iconCls: 'icon-add',
                    text: 'Добавить',
                    scope: this,
                    handler: function() {
                        this.createPhotoForm("new", null, id);
                    }
                }, '-', {
                    iconCls: 'icon-add',
                    text: 'Редактирование',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];
                        if (!selection) return;
                        this.createPhotoForm(selection.raw.id, selection.raw, id);
                    }
                },"-",{
                    iconCls: 'icon-add',
                    text: 'Удалить',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];
                        if (!selection) return;
                        self.onDeletePhoto(selection.raw.id);
                    }
                }]
            });

            this.imagesStore.load();
        }

        win.show(null, function() {windowShow(self)});
        return win;
    },

    createPhotoForm : function(id, data, product_id){

        var desktop = this.app.getDesktop();
        var winId = 'photo-manager-service-image-form-' + id;
        var win = desktop.getWindow(winId);

        var self = this;

        if(!win){

            this.formPhoto = Ext.widget('form', {
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
                    model: 'ProductsImages'
                }),

                items: [{
                    xtype: 'textfield',
                    fieldLabel: 'Id',
                    name: 'id',
                    disabled: true
                },{
                    xtype: 'cefileinput',
                    fieldLabel: 'Картинка *',
                    name: 'src',
                    allowBlank: false
                }],

                buttons: [{
                    text: 'Сохранить',
                    formBind: true,
                    handler: function(){
                        this.up('form').getForm().submit({
                            params: {
                                id : id,
                                product_id : product_id
                            },
                            url: '/admin/products-images/save/'+id,
                            submitEmptyText: false,
                            waitMsg: 'Сохранение...',
                            success: function(form, action) {
                                win.close();
                                self.imagesStore.load();
                            }
                        });
                    }
                }]
            });

            var form = this.formPhoto;
            var title = id == 'new'? 'Создание' : 'Редактирование';

            win = desktop.createWindow({
                id: winId,
                title: title,
                width : "60%",
                height : 300,
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
                    url: '/admin/products-images/getOne',
                    params : {
                        'id' : id
                    }
                });
            }
        }
        win.show();
    },
    onDeletePhoto: function(id){
        var self = this;
        Ext.MessageBox.confirm('Confirm', 'Удалить данное фото?', function(btn) {
            if (btn != 'yes') return;
            Ext.Ajax.request({
                url: '/admin/products-images/remove/' + id,
                success: function() {
                    self.imagesStore.load();
                }
            });
        });
    }

});

