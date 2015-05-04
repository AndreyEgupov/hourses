<div class="columns-container">
    <div id="columns" class="container">
        <div class="row">
            {{ partial("partials/breadcrumb") }}
            <div id="left_column" class="column col-sm-4 col-md-3">
                {{ partial("partials/categories-left") }}
                <div class="hotcate-wrap">
                    <div class="container">
                        <div class="row">
                        </div>
                    </div>
                </div>
                {{ partial("partials/filter") }}
            </div>
            <div id="center_column" class="center_column col-sm-8 col-md-9">
                <div class="content_scene_cat "></div>
                <div class="content_sortPagiBar clearfix">
                    {{ partial("partials/product-sort") }}
                </div>

                {{ partial("partials/product-list") }}

                <div class="content_sortPagiBar clearfix">
                    {{ partial("partials/product-sort") }}
                </div>
            </div>
        </div>
    </div>
</div>