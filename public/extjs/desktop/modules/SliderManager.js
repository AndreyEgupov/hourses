Ext.define('MyDesktop.SliderManager', {
    extend: 'Ext.ux.desktop.Module',
    id:'slider-manager',
        
    init : function(){
  
        var self = this;
        
        this.launcher = {
            text: 'Slider',
            iconCls: 'icon-grid',
            handler : this.createWindow,
            scope : this
        };
        
        this.grid = null;
        this.store = null;
        this.urlImage = null;
  
        Ext.define('Slider', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                {name: 'sort', type: 'int'},
                {name: 'is_active', type: 'bool'},
                'title', 'img_src', 'url'
            ],
            idProperty: ['id']
        });
    },
    onDeleteClick: function(id){
        var self = this;
        Ext.MessageBox.confirm('Confirm', 'Delete select item?', function(btn) {
            if (btn != 'yes') return;
            Ext.Ajax.request({
                url: '/admin/slider/remove/' + id,
                success: function() {
                    self.store.load();
                }
            });
        });
    },
    createWindow : function(){
        var desktop = this.app.getDesktop();
        var id = this.id;
        var win = desktop.getWindow(id);
        var self = this;
        
        if(!win) {
            // create the Data Store
            this.store = Ext.create('Ext.data.Store', {
                model: 'Slider',
                remoteGroup: true,
                // allow the grid to interact with the paging scroller by buffering
                buffered: true,
                leadingBufferZone: 300,
                pageSize: 100,
                proxy: {
                    // load using script tags for cross domain, if the data in on the same domain as
                    // this page, an Ajax proxy would be better
                    type: 'ajax',
                    url: '/admin/slider/getList',
                    reader: {
                        root: 'data',
                        totalProperty: 'totalCount'
                    },
                    extraParams : {
                        search : ""
                    },
                    // sends single sort as multi parameter
                    simpleSortMode: true,
                    // sends single group as multi parameter
                    simpleGroupMode: true,

                    // This particular service cannot sort on more than one field, so grouping === sorting.
                    groupParam: 'sort',
                    groupDirectionParam: 'id'
                },
                sorters: [{
                    property: 'id',
                    direction: 'DESC'
                }],
                autoLoad: true,
                autoSync: true
            });
 
           var store = this.store;

            this.grid = Ext.create('Ext.grid.Panel', {
                border: false,
                xtype: 'grid',
                store: store,
                loadMask: true,
                selModel: {
                    pruneRemoved: false
                },
                viewConfig: {
                    trackOver: false
                },
                features:[{
                    ftype: 'grouping',
                    hideGroupedHeader: false
                }],
                columns:[{
                    text: "ID",
                    dataIndex: 'id',
                    width: 60,
                    sortable: true
                },{
                    text: "Title",
                    dataIndex: 'title',
                    sortable: true,
                    flex : true
                },{
                    text: "Url",
                    dataIndex: 'url',
                    sortable: true,
                    flex : true
                },{
                    text: 'Активен',
                    dataIndex: 'is_active',
                    trueText: "&radic;",
                    falseText: "",
                    xtype: 'booleancolumn',
                    width: 70,
                    align: 'center',
                    sortable: true
                } ],
                emptyText: 'Нет данных...'
            });
            
            var grid = this.grid;
        
            win = desktop.createWindow({
                id: id,
                title:'Слайдер',
                width: 1250,
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
                        this.createForm('new');
                    }
                },{
                    iconCls: 'icon-add',
                    text: 'Редактировать',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];

                        if (!selection) return;

                        this.createForm(selection.raw.id, selection.raw);
                    }
                },"-",{
                    iconCls: 'icon-add',
                    text: 'Удалить',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];
                        if (!selection) return;
                        self.onDeleteClick(selection.raw.id);
                    }
                }]
            });
            win.show();
        }
    },

    createForm : function(id, data){
        
        var desktop = this.app.getDesktop();
        var winId = 'slider-manager-slider-form-' + id;
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
                bodyPadding: 15,
                fieldDefaults: {
                    labelAlign: 'right',
                    labelWidth: 95,
                    msgTarget: 'side',
                    anchor:'100%'
                },
                
                reader : Ext.create('Ext.data.reader.Json', {
                    model: 'Slider'
                }),
                items: [{
                    xtype: 'textfield',
                    fieldLabel: 'Id',
                    name: 'id',
                    disabled : true
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Title',
                    name: 'title'
                },{
                    xtype: 'cefileinput',
                    fieldLabel: 'Картинка',
                    name: 'img_src',
                    allowBlank: false
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Url',
                    name: 'url'
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Сортировка',
                    name: 'sort'
                },{
                    xtype: 'checkboxfield',
                    fieldLabel: 'Активна',
                    name: 'is_active',
                    inputValue: "1",
                    uncheckedValue: "0",
                    checked: true
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
                            url: '/admin/slider/save',
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
            
            var title = (id == 'new' 
                ? 'Новый '
                : 'Редактирование ');
            
            win = desktop.createWindow({
                id: winId,
                title: title,
                width : '80%',
                height : 600,
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
                    url: '/admin/slider/getOne',
                    params : {
                        'id' : id
                    }
                });
            }
        }
        win.show();
    }
});