/****************************************************
* CKEditor Extension
*****************************************************/
Ext.form.CKEditor = function(config){
    this.config = config;
    Ext.form.CKEditor.superclass.constructor.call(this, config);
};

Ext.extend(Ext.form.CKEditor, Ext.form.TextArea,  {
    onRender : function(ct, position){
        if(!this.el){
            this.defaultAutoCreate = {
                tag: "textarea",
                autocomplete: "off"
            };
        }
        Ext.form.TextArea.superclass.onRender.call(this, ct, position);
        CKEDITOR.replace(this.id, this.config.CKConfig);
    },

    setValue : function(value){
        Ext.form.TextArea.superclass.setValue.apply(this,[value]);
        CKEDITOR.instances[this.id].setData( value );
    },

    getValue : function(){
        CKEDITOR.instances[this.id].updateElement();
        return Ext.form.TextArea.superclass.getValue(this);
    },

    getRawValue : function(){
        CKEDITOR.instances[this.id].updateElement();
        return Ext.form.TextArea.superclass.getRawValue(this);
    },

    destroyInstance: function(){
        if (CKEDITOR.instances[this.id]) {
            delete CKEDITOR.instances[this.id];
        }
    }
});
Ext.reg('ckeditor', Ext.form.CKEditor);