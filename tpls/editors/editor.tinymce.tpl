{if !$sSettingsTinymce}
    {assign var="sSettingsTinymce" value="ls.settings.getTinymce()"}
{/if}
<script type="text/javascript">
    ls.lang.load({lang_load name="panel_photoset,panel_spoiler,panel_title_h4,panel_title_h5,panel_title_h6"});
    if (!tinymce) {
        ls.loadAssetScript('tinymce_4', function(){
            jQuery(function(){
                tinymce.init({$sSettingsTinymce});
            });
        });
    } else {
        jQuery(function(){
            tinymce.init({$sSettingsTinymce});
        });
    }

    {if Config::Get('view.float_editor')}
        $(function(){
            ls.editor.float({
                topStep: {if Config::Get('view.header.top') == 'fixed'}60{else}0{/if}, // Отступ от верха страницы
                dif: 0,     // Изменение ширины при прилипании (из-за стилизации может скакать один пиксель)
                textareaClass: '.js-editor-wysiwyg',    // Селектор textarea
                editorClass: '.mce-tinymce', // Селектор редактора
                headerClass: '.mce-toolbar-grp' // Селектор шапки
            });
        });
    {/if}
</script>
