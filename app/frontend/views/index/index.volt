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
                {{ partial("partials/slider") }}
                <div class="content_scene_cat "></div>
                {% if page.items|length %}
                    <div class="content_sortPagiBar clearfix">
                        {{ partial("partials/product-sort") }}
                    </div>
                    <ul class="product_list grid row">
                        {% for item in page.items  %}
                            {{ partial('partials/product/item') }}
                        {% endfor %}
                    </ul>
                    <div class="content_sortPagiBar clearfix">
                        {{ partial("partials/product-sort") }}
                    </div>
                {% else %}
                    Ничего не найдено
                {% endif %}
            </div>
        </div>
    </div>
</div>