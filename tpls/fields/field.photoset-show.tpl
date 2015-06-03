<script type="text/javascript">
    (function($){
        "use strict";
        function setPrettyPhoto() {
            $("a[rel^='prettyPhoto']").prettyPhoto({
                social_tools:'',
                show_title: false,
                slideshow:true,
                deeplinking: false
            });
        }

        function setRowGrid() {
            $('.js-topic-photoset-list img').load(function () {
                $('.js-topic-photoset-list').rowGrid({
                    itemSelector: '.topic-photoset-item',
                    minMargin: 10,
                    maxMargin: 15,
                    resize: false,
                    lastRowClass: 'topic-photoset-last_row',
                    firstItemClass: "first-item"
                });
            });
        }

        function resetRowGrid() {
            $('.js-topic-photoset-list').rowGrid('appended');
        }

        $(function(){
            setPrettyPhoto();
            setRowGrid();
        });

        $('body').on('ls_photoset_update', function(){
            setPrettyPhoto();
            resetRowGrid();
        });
    }(jQuery));
</script>

<div class="topic-photoset">
    {$aPhotos=$oTopic->getPhotosetPhotos(0, Config::Get('module.topic.photoset.per_page'))}
    {if count($aPhotos)<$oTopic->getPhotosetCount()}
    <h4>{$oTopic->getPhotosetCount()} {$oTopic->getPhotosetCount()|declension:$aLang.topic_photoset_count_images}</h4>
    {/if}
    <a name="photoset"></a>

    <ul class="topic-photoset-list list-unstyled list-inline clearfix js-topic-photoset-list">
        {if count($aPhotos)}
            {$sThumbneilSize = 'x100'}
            {foreach $aPhotos as $oPhoto}
                <li class="topic-photoset-item">
                    <a class="topic-photoset-image" href="{$oPhoto->getUrl()}" rel="prettyPhoto[pp_gal]"  title="{$oPhoto->getDescription()}">
                        <img src="{$oPhoto->getUrl($sThumbneilSize)}" {*$oPhoto->getImgSizeAttr($sThumbneilSize)*} alt="{$oPhoto->getDescription()}" class="" />
                    </a>
                </li>
                {$iLastPhotoId=$oPhoto->getId()}
            {/foreach}
        {/if}
        <script type="text/javascript">
            ls.photoset.idLast='{$iLastPhotoId+1}';
            ls.photoset.thumbSize='{$sThumbneilSize}';
        </script>
    </ul>

    {if count($aPhotos)<$oTopic->getPhotosetCount()}
        <a href="#" id="topic-photo-more" class="btn btn-info btn-large btn-block topic-photo-more" onclick="ls.photoset.getMore('{$oTopic->getId()}'); return false;">
            {$aLang.topic_photoset_show_more} &darr;
        </a>
    {/if}
</div>
