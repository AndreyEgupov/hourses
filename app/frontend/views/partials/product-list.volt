<div id="center_column" class="center_column col-sm-8 col-md-9">
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