/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
  config.PreserveSessionOnFileBrowser = true;
  // Define changes to default configuration here. For example:
  config.language = 'hu';
  // config.uiColor = '#AADC6E';

  //config.ContextMenu = ['Generic','Anchor','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','Table','Form'] ;
  
  //config.resize_enabled = false;
  //config.resize_maxHeight = 2000;
  //config.resize_maxWidth = 750;
  
  //config.startupFocus = true;

  config.skin = 'v2';
  
  // works only with en, ru, uk languages
  config.extraPlugins = "embed,attachment,syntaxhighlight";

  //config.stylesSet = 'my_styles';
  
  config.toolbar = 'Easy';
  
  config.toolbar_Easy =
    [
        ['Source','syntaxhighlight','-','Preview','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord'],
        ['Maximize','-','About'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Styles','Format'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript', 'TextColor'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image','Embed','Flash','Attachment','Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
    ];

  config.toolbar = 'light';

  config.toolbar_light =
    [
        ['RemoveFormat','syntaxhighlight'],
        ['Bold','Italic','Underline','PasteText','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor']
    ];

  config.toolbar = 'basic';

  config.toolbar_basic =
    [
        ['Source','syntaxhighlight','Styles','RemoveFormat'],
        ['Bold','Italic','Underline'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord'],
        ['Image','Flash'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],        
        ['Link','Unlink']
    ];
};

