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
                <!-- Block layered navigation module -->
                <div id="layered_block_left" class="block">
                    {{ partial('partials/socials/vk') }}
                </div>
                <!-- /Block layered navigation module -->
            </div>
            <div id="center_column" class="center_column col-sm-8 col-md-9">
                <div class="content_scene_cat "></div>
                <ul class="product_list grid row">
                    {% for category in childCategories  %}
                        {{ partial('partials/category/item') }}
                    {% endfor %}
                </ul>
            </div>
        </div>
    </div>
</div>