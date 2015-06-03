{if !$sSettingsTinymce}
    {assign var="sSettingsTinymce" value="ls.settings.getTinymce()"}
{/if}
<script type="text/javascript">
    ls.lang.load({lang_load name="panel_title_h4,panel_title_h5,panel_title_h6"});
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
</script>
