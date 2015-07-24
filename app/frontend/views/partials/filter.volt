<!-- Block layered navigation module -->
<div id="layered_block_left" class="block">
    <p class="title_block"><span>Фильтр</span></p>

    <div class="block_content">
        <form action="" method="get">
            <div>
                <div class="layered_price" >
                    <div class="layered_subtitle_heading">
                        <span class="layered_subtitle">Цена:</span>
                        <span id="layered_price_range"><i>$</i> <spn></spn> - <i>$</i> <spn></spn></span>
                        <input type="hidden" value="{{ getPrice(minPrice, currencyObj) }}" id="priceMin" name="prices[]" />
                        <input type="hidden" value="{{ getPrice(maxPrice, currencyObj) }}" id="priceMax" name="prices[]" />
                    </div>
                    <div id="ul_layered_price" class="col-lg-12" ></div>
                </div>

                <div class="layered_filter">
                    <div class="layered_subtitle_heading">
                        <span class="layered_subtitle">Производитель</span>
                    </div>
                    <ul class="col-lg-12 layered_filter_ul color-group">
                        {% for attribute in attributes %}
                            {% if attribute.attribute_name_id == 6 %}
                                <li class="nomargin hiddable col-md-12">
                                    <input {{ inObjectList(attribute, attributesRequest)? 'checked' : '' }}
                                            type="checkbox" class="checkbox" name="attribute[]" id="layered_category_{{ attribute.id }}" value="{{ attribute.id }}"/>
                                    <label for="layered_category_{{ attribute.id }}">
                                        {{ attribute.val }}
                                    </label>
                                </li>
                            {% endif %}
                        {% endfor %}
                    </ul>
                </div>
            </div>
            <div class="col-sm-12" style="text-align: right; padding-right: 0;">
                <a href='{{ router.getRewriteUri() }}' role="button" class="btn btn-default" style="margin-right: 7px;" >Отмена</a>
                <button type="submit" class="btn btn-primary">Применить</button>
            </div>
        </form>
    </div>

    {{ partial('partials/socials/vk') }}
</div>
<!-- /Block layered navigation module -->