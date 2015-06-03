{if $_aRequest.blog_id}{$sTarget_id=$_aRequest.blog_id}{else}{$sTarget_id=0}{/if}

<div class="panel panel-default widget widget-type-blog">
    <div class="panel-body">
        <header class="widget-header">
            <h3 class="widget-title">{$aLang.widget_blog_avatar_block}</h3>
        </header>

        <div class="widget-content">
            {* БЛОК ЗАГРУЗКИ ИЗОБРАЖЕНИЯ *}
            <div class              ="js-alto-uploader"     {* Класс для взаимодействия со скриптом js *}
                 data-target        ="blog_avatar"          {* Тип объекта который отображается в админке *}
                 data-target-id     ="{$sTarget_id}"        {* Идентификатор объекта *}
                 data-empty         ="{asset file="img/empty_blog_image.png" theme=true}" {* Дефолтная картинка *}
                 data-preview-crop  ="309x309crop"          {* Размер картинки *}
                 data-crop          ="no">                  {* Вызывать или нет диалог обрезки изображения перед сохранением *}

                {* Картинка фона блога *}
                {img attr=[
                    'src'           => "{asset file="img/empty_blog_image.png" theme=true}",
                    'alt'           => "image",
                    'class'         => "thumbnail js-uploader-image",
                    'target-type'   => "blog_avatar",
                    'crop'          => '309x309crop',
                    'target-id'     => "{$sTarget_id}"
                ]}

                {* Меню управления аватаром блога *}
                <div class="uploader-actions text-center">

                    {* Кнопка загрузки картинки *}
                    <a class="btn btn-default btn-xs js-uploader-button-upload" href="#" onclick="return false">
                        {$aLang.uploader_image_upload}
                    </a>

                    {* Кнопка удаления картинки *}
                    <br/>
                    <a href="#" onclick="return false;" class="link-dotted js-uploader-button-remove" {if !$bImageIsTemporary}style="display: none;"{/if}>
                        {$aLang.uploader_image_delete}
                    </a>

                    {* Файл для загрузки *}
                    <input type="file" name="uploader-upload-image" class="uploader-actions-file js-uploader-file">

                </div>

                {* Форма обрезки картинки при ее загрузке *}
                {include_once file="modals/modal.crop_img.tpl"}

            </div>
        </div>

    </div>
</div>