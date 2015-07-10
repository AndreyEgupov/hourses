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

                {#<div class="layered_filter">#}
                    {#<div class="layered_subtitle_heading">#}
                        {#<span class="layered_subtitle">Цвет</span>#}
                    {#</div>#}
                    {#<ul id="ul_layered_id_attribute_group_3"#}
                        {#class="col-lg-12 layered_filter_ul color-group">#}
                        {#<li class="nomargin hiddable col-lg-6">#}
                            {#<input class="color-option  " type="button"#}
                                   {#name="layered_id_attribute_group_7" rel="7_3"#}
                                   {#id="layered_id_attribute_group_7" style="background: #f5f5dc;"/>#}
                            {#<label for="layered_id_attribute_group_7"#}
                                   {#name="layered_id_attribute_group_7" class="layered_color"#}
                                   {#rel="7_3">#}
                                {#<a href="">Beige<span> (2)</span></a>#}
                            {#</label>#}
                        {#</li>#}
                        {#<li class="nomargin hiddable col-lg-6">#}
                            {#<input class="color-option  " type="button"#}
                                   {#name="layered_id_attribute_group_8" rel="8_3"#}
                                   {#id="layered_id_attribute_group_8" style="background: #ffffff;"/>#}
                            {#<label for="layered_id_attribute_group_8"#}
                                   {#name="layered_id_attribute_group_8" class="layered_color"#}
                                   {#rel="8_3">#}
                                {#<a href="">White<span> (3)</span></a>#}
                            {#</label>#}
                        {#</li>#}
                    {#</ul>#}
                {#</div>#}
            </div>
            <div class="col-sm-12" style="text-align: right; padding-right: 0;">
                <a href='{{ router.getRewriteUri() }}' role="btn" class="btn btn-default" style="margin-right: 7px;" >Отмена</a>
                <button type="submit" class="btn btn-primary">Применить</button>
            </div>
        </form>
    </div>

    <p class="title_block" style="margin-top: 40px;"><span>Мы вконтакте</span></p>
    <div class="block_content">
        <script type="text/javascript" src="//vk.com/js/api/openapi.js?116"></script>

        <!-- VK Widget -->
        <div id="vk_groups"></div>
        <script type="text/javascript">
            VK.Widgets.Group("vk_groups", {mode: 0, width: "220", height: "400", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 12851086);
        </script>
    </div>
</div>
<!-- /Block layered navigation module -->