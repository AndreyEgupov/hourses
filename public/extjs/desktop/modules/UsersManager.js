Ext.define('MyDesktop.UsersManager', {
    extend: 'Ext.ux.desktop.Module',
    id:'users-manager',
        
    init : function(){
  
        var self = this;
        
        this.launcher = {
            text: 'Users',
            iconCls: 'icon-grid',
            handler : this.createWindow,
            scope : this
        };
        
        this.grid = null;
        this.store = null;
        this.urlImage = null;
  
        Ext.define('Users', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                {name: 'balance', type: 'int'},
                'email'
            ],
            idProperty: 'id'
        });
        new countItem().get(self);
    },
    createWindow : function(){ // открытие списка событий 
        
        var desktop = this.app.getDesktop();
        var id = this.id;
        var win = desktop.getWindow(id);
        var self = this;
       
        if(!win) {
        
            // create the Data Store
            this.store = Ext.create('Ext.data.Store', {
                model : "Users",
                proxy: {
                    type: 'ajax',
                    url: '/admin/users/getList.json',
                    reader: {
                        type: 'json',
                        root: 'data',
                        totalProperty: 'totalCount'
                    }
                },
                listeners: {
                    "load": function(){
                        self.itemStore.load();
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
                    text: "email",
                    dataIndex: 'email',
                    flex: true,
                    sortable: true
                }]
            
            });
            
            var grid = this.grid;
        
            win = desktop.createWindow({
                id: id,
                title:'Пользователи',
                width: 880,
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
                }/*, '-', {
                    iconCls: 'icon-add',
                    text: 'Удалить',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];
                        if (!selection) return;
                        this.onDeleteClick(selection.raw.id);
                    }
                }, 'Поиск',{
                    xtype: 'textfield',
                    name: 'searchField',
                    hideLabel: true,
                    labelAlign: "right",
                    width: 200,
                    listeners: {
                        change: {
                            fn: self.onTextFieldChange,
                            scope: this,
                            buffer: 100
                        }
                    }
                }*/]
            });
            
            store.load();
        }
        
        win.show(null, function() {windowShow(self)});
        
        return win;
    },
    
    onDeleteClick: function(id){
        var self = this;
        
        Ext.MessageBox.confirm('Confirm', 'Удалить этого пользователя?', function(btn) {
            if (btn != 'yes') return;
            Ext.Ajax.request({
                url: '/admin/users/delete.json?id=' + id,
                success: function() {
                    self.store.load();
                }
            });
        });
    },
    
    onTextFieldChange : function(e){
        this.store.load({
            "params": {
                "search" : e.value
            }
        });
    },
    createForm : function(id, data){
       
        var desktop = this.app.getDesktop();
        var winId = 'users-manager-users-form-' + id;
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
                    model: 'Users'
                }),
                items: [{
                    xtype: 'textfield',
                    fieldLabel: 'Id',
                    name: 'id',
                    disabled: true
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Email *',
                    name: 'email',
                    allowBlank: false
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
                            url: '/admin/users/save.json?is_new=0',
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
            
            var title = 'Редактирование Пользователя';
            
            win = desktop.createWindow({
                id: winId,
                title: title,
                width : 600,
                height : 400,
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
                    url: '/admin/users/getOne.json',
                    params : {
                        'id' : id
                    }
                });
            }
        }
        win.show();
    }
});
