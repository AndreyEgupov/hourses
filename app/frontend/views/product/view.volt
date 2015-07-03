<div class="columns-container">
    <div id="columns" class="container">
        <div class="row">
            {{ partial("partials/breadcrumb") }}
            <div id="center_column" class="center_column col-sm-12 col-md-12">
                <div itemscope="" itemtype="http://schema.org/Product">
                    <div class="primary_block row">
                        <div class="pb-left-content col-lg-10 col-md-10 col-sm-12 col-xs-12">
                            <!-- left infos-->
                            <div class="pb-left-column col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <!-- product img-->
                                <div id="image-block" class="clearfix">
                                    <span id="view_full_size">
                                        <a class="jqzoom" title="" rel="gal1" href="{{ product.getFirstImage().src }}" itemprop="url" data-rel="prettyPhoto">
                                            <img src="{{ product.getFirstImage().src }}" itemprop="image" >
                                        </a>
                                    </span>
                                    <a href="{{ product.getFirstImage().src }}" data-rel="prettyPhoto" class="zoomImg"><i class="fa fa-search"></i></a>
                                </div> <!-- end image-block -->
                                {% if product.ProductsImage|length > 1 %}
                                    {{ partial('partials/product/images') }}
                                {% endif %}
                            </div> <!-- end pb-left-column -->
                            <!-- end left infos-->
                            <!-- right infos -->
                            <div class="pb-right-column col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="fixmagrin">
                                    <h1 itemprop="name">{{ product.title }}</h1>
                                    <div class="activequality">
                                        <div class="leftquality">
                                            <p id="pQuantityAvailable">
                                                Наличие в магазине:
                                                <spn style="color: #00ABF0">
                                                    {% if product.is_available %}
                                                        <i class="fa fa-check-square-o"></i> Есть
                                                    {% else %}
                                                        <i class="fa fa-minus-square-o"></i> Закончился
                                                    {% endif %}
                                                </spn>
                                            </p>
                                        </div>
                                        <div class="rightprice">
                                            <div class="content_prices clearfix">
                                                <div class="price">
                                                    <p class="our_price_display" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                                                        <link itemprop="availability" href="http://schema.org/InStock">
                                                        <span id="our_price_display2" itemprop="price">{{ currencyObj.symbol }} {{ getPrice(product.price, currencyObj) }}</span>
                                                        <meta itemprop="priceCurrency" content="{{ currencyObj.title }}">
                                                    </p>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="short_description_block">
                                        <div id="short_description_content" class="rte align_justify" itemprop="description">
                                            {% if product.description %}
                                                <h2>Описание товара</h2>
                                                <div>
                                                    {{ product.description }}
                                                </div>
                                            {% else %}
                                                Описание товара отсутствует
                                            {% endif %}
                                        </div>
                                    </div>

                                    <form id="buy_block" action="" method="post">
                                        <div class="product-size-social">
                                            <a href="/page/view/9" target="_size">как определить размер</a>
                                            <script type="text/javascript" src="//yastatic.net/share/share.js" charset="utf-8"></script><div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="small" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,moimir,gplus" data-yashareTheme="counter"></div>
                                        </div>
                                        <div class="box-info-product">
                                            <div class="product_attributes clearfix">
                                                {{ partial('partials/product/attributes') }}
                                                <p id="quantity_wanted_p">
                                                    <label>Количество:</label>
                                                    <input type="text" name="qty" id="quantity_wanted" class="text" value="1">
                                                    <a href="" data-field-qty="qty" class="btn btn-default button-minus product_quantity_down">
                                                        <span><i class="fa fa-minus"></i></span>
                                                    </a>
                                                    <a href="" data-field-qty="qty" class="btn btn-default button-plus product_quantity_up">
                                                        <span><i class="fa fa-plus"></i></span>
                                                    </a>
                                                    <span class="clearfix"></span>
                                                </p>
                                                <div class="box-cart-bottom" style="margin-left: 5px;">
                                                    <div>
                                                        <p class="buttons_bottom_block no-print">
                                                            <button type="button" name="" class="button exclusive" title="Добавить в корзину" onclick="cartAdd({{ product.id }})">
                                                                <span><i class="fa fa-shopping-cart" style="font-size: 2em;width: 30px;"></i> Добавить в корзину</span>
                                                            </button>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <div class="rightproduct col-lg-2 col-md-2 col-sm-0 col-xs-12">
                            {{ partial('partials/product/policy') }}
                        </div>
                    </div>

                    <div class="moreinfo_block col-sm-12 col-md-12">
                        {{ partial('partials/product/tab') }}
                    </div>

                    <section class="blockproductscategory  block">

                        <div id="productscategory_list" class="clearfix">
                            <p class="title_block">
                                <span>Похожие продукты</span>
                            </p>
                            <ul class="owlCarousel clearfix product_list row grid" data-items="4">
                                {% for item in similarProducts  %}
                                    {{ partial('partials/product/item') }}
                                {% endfor %}
                            </ul>
                        </div>
                    </section>
                    <!-- description & features -->
                </div> <!-- itemscope product wrapper -->
                <script type="text/javascript">
                    $(document).ready(function(){
                        $('#product ul.tab-info li:first, #product .tab-content section:first').addClass('active');
                    });
                </script>
            </div><!-- #center_column -->
        </div><!-- .row -->
    </div><!-- #columns -->

</div>
<script>
    $(document).ready(function() {
        $('#thumbs_list').on('click', 'a', function () {
            var src = $(this).attr('data-src');
            $("#view_full_size a").attr("href", src);
            $("#view_full_size img").attr("src", src);
        });

        var $input = $("#quantity_wanted");

        $("#quantity_wanted_p a.product_quantity_up").on("click", function () {
            var val =  Number.parseInt($input.val()) + 1;
            $($input).val(val);
        })
        $("#quantity_wanted_p a.product_quantity_down").on("click", function () {
            var val = Number.parseInt($input.val()) - 1;
            val = val > 0 ?val : 1;
            $($input).val(val);
        })
    });
</script>