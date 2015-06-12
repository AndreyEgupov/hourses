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
                                            <a class="jqzoom" title="" rel="gal1" href="{{ product.getFirstImage().src }}" itemprop="url">
                                                <div class="zoomPad">
                                                        <img itemprop="image" src="/timthumb.php?w=435&h=435&src={{ product.getFirstImage().src }}" title="{{ product.title|e }}" alt="{{ product.title|e }}" >
                                                    <div class="zoomPup" ></div>
                                                    <div class="zoomWindow" >
                                                        <div class="zoomWrapper" >
                                                            <div class="zoomWrapperTitle" ></div>
                                                            <div class="zoomWrapperImage" >
                                                                <img src="{{ product.getFirstImage().src }}" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="zoomPreload" style="top: 208px; left: 184.5px; position: absolute; visibility: hidden;">Loading zoom</div>
                                                </div>
                                            </a>
                                    </span>
                                    <a href="{{ product.getFirstImage().src }}" data-rel="prettyPhoto" class="zoomImg"><i class="fa fa-search"></i></a>
                                </div> <!-- end image-block -->
                                <!-- thumbnails -->
                                <div id="views_block" class="clearfix ">
                                    <span class="view_scroll_spacer scroll_left" >
							            <a id="view_scroll_left" class="" title="Other views" href="javascript:{}" ></a>
						            </span>
                                    <div id="thumbs_list">
                                        <ul id="thumbs_list_frame" >
                                            {% for img in product.ProductsImage %}
                                                {% if loop.index != 1 %}
                                                    <li id="thumbnail_{{ loop.index }}">
                                                        <a href="javascript:void(0);" rel="{gallery: 'gal1', smallimage: '{{ img.src }}',largeimage: '{{ img.src }}'}" title="">
                                                            <img class="img-responsive" id="thumb_52" src="{{ img.src }}" alt="" title="" itemprop="image">
                                                        </a>
                                                    </li>
                                                {% endif %}
                                            {% endfor %}
                                        </ul>
                                    </div>
                                    <span class="view_scroll_spacer scroll_right">
                                        <a id="view_scroll_right" title="Other views" href="javascript:{}" ></a>
                                    </span>
                                </div> <!-- end views-block -->
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
                                                        <span id="our_price_display2" itemprop="price">{{ currency }} {{ product.price }}</span>
                                                        <meta itemprop="priceCurrency" content="{{ currency }}">

                                                    </p>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="short_description_block">
                                        <div id="short_description_content" class="rte align_justify" itemprop="description">
                                            <h2>Описание</h2>
                                            <div>
                                                {{ product.description }}
                                            </div>
                                        </div>
                                    </div>

                                    <form id="buy_block" action="" method="post">
                                        <div class="box-info-product">
                                            <div class="product_attributes clearfix">
                                                {{ partial('partials/product/attributes') }}
                                                <p id="quantity_wanted_p">
                                                    <label>Количество:</label>
                                                    <input type="text" name="qty" id="quantity_wanted" class="text" value="1" style="border: 1px solid rgb(189, 194, 201);">
                                                    <a href="" data-field-qty="qty" class="btn btn-default button-minus product_quantity_down">
                                                        <span><i class="fa fa-minus"></i></span>
                                                    </a>
                                                    <a href="" data-field-qty="qty" class="btn btn-default button-plus product_quantity_up">
                                                        <span><i class="fa fa-plus"></i></span>
                                                    </a>
                                                    <span class="clearfix"></span>
                                                </p>
                                                <div class="box-cart-bottom">
                                                    <div>
                                                        <p id="add_to_cart" class="buttons_bottom_block no-print">
                                                            <button type="submit" name="Submit" class="button exclusive" title="Добавить в корзину">
                                                                <span>Добавить в корзину</span>
                                                            </button>
                                                        </p>
                                                    </div>
                                                </div>

                                                <ul id="usefull_link_block" class="clearfix no-print" title="Print">
                                                    <li class="print">
                                                        <a href="javascript:print();">
                                                            <i class="fa fa-print"></i>
                                                        </a>
                                                    </li>
                                                </ul>
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
                            <p class="title_block"><span>Похожие продукты</span></p>
                            <ul id="bxslider1" class="bxslider clearfix owl-carousel owl-theme owl-loaded">
                                <div class="owl-stage-outer"><div class="owl-stage" style="width: 892.5px; transform: translate3d(0px, 0px, 0px); transition: 0s; -webkit-transition: 0s;"><div class="owl-item active" style="width: 277.5px; margin-right: 20px;"><li class="ajax_block_product">
                                                <div class="product-container" itemscope="" itemtype="http://schema.org/Product">
                                                    <div class="left-block">
                                                        <div class="product-image-container">
                                                            <a class="product_img_link" href="12-printed-dress.html" title="Tuza suma niten" itemprop="url">


                                                                <img class="img_1" src="/html/sp_market/56-home_default/printed-dress.jpg" alt="Tuza suma niten">
                                                                <img class="img_0" src="/html/sp_market/57-home_default/printed-dress.jpg" alt="Tuza suma niten">
                                                            </a>
                                                            <div class="quick-view-wrapper-mobile">
                                                                <a class="quick-view-mobile" href="12-printed-dress.html" rel="http://prestashop.skyoftech.com/sp_market/en/sports-outdoors/12-printed-dress.html">
                                                                    <i class="icon-eye-open"></i>
                                                                </a>
                                                            </div>
                                                            <a class="quick-view" href="12-printed-dress.html" rel="http://prestashop.skyoftech.com/sp_market/en/sports-outdoors/12-printed-dress.html">
                                                                <span>Quick view</span>
                                                            </a>



                                                        </div>


                                                    </div>
                                                    <div class="right-block">
                                                        <h5 itemprop="name">
                                                            <a href="12-printed-dress.html" title="Tuza suma niten" itemprop="url">
                                                                Tuza suma niten
                                                            </a>
                                                        </h5>

                                                        <div class="comments_note" itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating">
                                                            <div class="star_content clearfix">
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <meta itemprop="worstRating" content="0">
                                                                <meta itemprop="ratingValue" content="0">
                                                                <meta itemprop="bestRating" content="5">
                                                            </div>
                                                            <span class="nb-comments"><span itemprop="reviewCount">0</span> Review(s)</span>
                                                        </div>



                                                        <p class="product-desc" itemprop="description">
                                                            Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur nec dolor commodo, tempus turpis vitae, maximus sapien. Aenean lobortis purus in efficitur bibendum. Vestibulum interdum magna pellentesque neque sagittis dignissim. Maecenas vestibulum ex nisi, a egestas augue condimentum sed.
                                                        </p>

                                                        <div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer" class="content_price">
													<span itemprop="price" class="price product-price">
								$ 50.99							</span>
                                                            <meta itemprop="priceCurrency" content="USD">


                                                        </div>
                                                        <div class="button-container">
                                                            <a class="button ajax_add_to_cart_button cart_button" href="../cart%3Fadd=1&amp;id_product=12&amp;token=c3148f158c47dee7012a227278ac6a29.html" rel="nofollow" title="Add to cart" data-id-product="12">
                                                                <span>Add to cart</span>
                                                            </a>

                                                        </div>

                                                        <div class="functional-buttons clearfix">

                                                            <div class="wishlist">
                                                                <a class="addToWishlist wishlistProd_12" data-toggle="tooltip" title="Add to wishlist" href="11-printed-dress.html#" rel="nofollow" onclick="WishlistCart('wishlist_block_list', 'add', '12', false, 1); return false;">
                                                                    <i class="fa fa-heart"></i>
                                                                </a>
                                                            </div>
                                                            <div class="compare">
                                                                <a class="add_to_compare" href="12-printed-dress.html" data-toggle="tooltip" title="Add to compare" data-id-product="12"><i class="fa fa-bar-chart"></i></a>
                                                            </div>

                                                        </div>



                                                    </div>

                                                </div><!-- .product-container> -->
                                            </li></div><div class="owl-item active" style="width: 277.5px; margin-right: 20px;"><li class="ajax_block_product">
                                                <div class="product-container" itemscope="" itemtype="http://schema.org/Product">
                                                    <div class="left-block">
                                                        <div class="product-image-container">
                                                            <a class="product_img_link" href="13-printed-summer-dress.html" title="Caze ruma poten" itemprop="url">


                                                                <img class="img_1" src="/html/sp_market/60-home_default/printed-summer-dress.jpg" alt="Caze ruma poten">
                                                                <img class="img_0" src="/html/sp_market/61-home_default/printed-summer-dress.jpg" alt="Caze ruma poten">
                                                            </a>
                                                            <div class="quick-view-wrapper-mobile">
                                                                <a class="quick-view-mobile" href="13-printed-summer-dress.html" rel="http://prestashop.skyoftech.com/sp_market/en/sports-outdoors/13-printed-summer-dress.html">
                                                                    <i class="icon-eye-open"></i>
                                                                </a>
                                                            </div>
                                                            <a class="quick-view" href="13-printed-summer-dress.html" rel="http://prestashop.skyoftech.com/sp_market/en/sports-outdoors/13-printed-summer-dress.html">
                                                                <span>Quick view</span>
                                                            </a>


                                                            <span class="sale-box  reduced_price">Reduced price!</span>
                                                        </div>


                                                    </div>
                                                    <div class="right-block">
                                                        <h5 itemprop="name">
                                                            <a href="13-printed-summer-dress.html" title="Caze ruma poten" itemprop="url">
                                                                Caze ruma poten
                                                            </a>
                                                        </h5>

                                                        <div class="comments_note" itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating">
                                                            <div class="star_content clearfix">
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <meta itemprop="worstRating" content="0">
                                                                <meta itemprop="ratingValue" content="0">
                                                                <meta itemprop="bestRating" content="5">
                                                            </div>
                                                            <span class="nb-comments"><span itemprop="reviewCount">0</span> Review(s)</span>
                                                        </div>



                                                        <p class="product-desc" itemprop="description">
                                                            Cras vel fringilla ex. Mauris rutrum leo vel mollis dapibus. Morbi urna nisi, maximus ut fringilla eget, rhoncus et metus. Fusce mollis sollicitudin lobortis. Aliquam mauris massa, pulvinar id faucibus nec, auctor ut est. Nulla ante magna, volutpat in nunc et, commodo interdum turpis. Proin magna enim
                                                        </p>

                                                        <div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer" class="content_price">
													<span itemprop="price" class="price product-price">
								$ 28.98							</span>
                                                            <meta itemprop="priceCurrency" content="USD">

								<span class="old-price product-price">
									$ 30.51
								</span>

                                                            <span class="price-percent-reduction">-5%</span>


                                                        </div>
                                                        <div class="button-container">
                                                            <a class="button ajax_add_to_cart_button cart_button" href="../cart%3Fadd=1&amp;id_product=13&amp;token=c3148f158c47dee7012a227278ac6a29.html" rel="nofollow" title="Add to cart" data-id-product="13">
                                                                <span>Add to cart</span>
                                                            </a>

                                                        </div>

                                                        <div class="functional-buttons clearfix">

                                                            <div class="wishlist">
                                                                <a class="addToWishlist wishlistProd_13" data-toggle="tooltip" title="Add to wishlist" href="11-printed-dress.html#" rel="nofollow" onclick="WishlistCart('wishlist_block_list', 'add', '13', false, 1); return false;">
                                                                    <i class="fa fa-heart"></i>
                                                                </a>
                                                            </div>
                                                            <div class="compare">
                                                                <a class="add_to_compare" href="13-printed-summer-dress.html" data-toggle="tooltip" title="Add to compare" data-id-product="13"><i class="fa fa-bar-chart"></i></a>
                                                            </div>

                                                        </div>



                                                    </div>

                                                </div><!-- .product-container> -->
                                            </li></div><div class="owl-item active" style="width: 277.5px; margin-right: 20px;"><li class="ajax_block_product">
                                                <div class="product-container" itemscope="" itemtype="http://schema.org/Product">
                                                    <div class="left-block">
                                                        <div class="product-image-container">
                                                            <a class="product_img_link" href="10-blouse.html" title="Gure tuma piza" itemprop="url">


                                                                <img class="img_1" src="/html/sp_market/48-home_default/blouse.jpg" alt="Gure tuma piza">
                                                                <img class="img_0" src="/html/sp_market/49-home_default/blouse.jpg" alt="Gure tuma piza">
                                                            </a>
                                                            <div class="quick-view-wrapper-mobile">
                                                                <a class="quick-view-mobile" href="10-blouse.html" rel="http://prestashop.skyoftech.com/sp_market/en/sports-outdoors/10-blouse.html">
                                                                    <i class="icon-eye-open"></i>
                                                                </a>
                                                            </div>
                                                            <a class="quick-view" href="10-blouse.html" rel="http://prestashop.skyoftech.com/sp_market/en/sports-outdoors/10-blouse.html">
                                                                <span>Quick view</span>
                                                            </a>


                                                            <span class="sale-box ">On sale!</span>

                                                        </div>


                                                    </div>
                                                    <div class="right-block">
                                                        <h5 itemprop="name">
                                                            <a href="10-blouse.html" title="Gure tuma piza" itemprop="url">
                                                                Gure tuma piza
                                                            </a>
                                                        </h5>

                                                        <div class="comments_note" itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating">
                                                            <div class="star_content clearfix">
                                                                <div class="star star_on"></div>
                                                                <div class="star star_on"></div>
                                                                <div class="star star_on"></div>
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <meta itemprop="worstRating" content="0">
                                                                <meta itemprop="ratingValue" content="3">
                                                                <meta itemprop="bestRating" content="5">
                                                            </div>
                                                            <span class="nb-comments"><span itemprop="reviewCount">1</span> Review(s)</span>
                                                        </div>



                                                        <p class="product-desc" itemprop="description">
                                                            Cras vel fringilla ex. Mauris rutrum leo vel mollis dapibus. Morbi urna nisi, maximus ut fringilla eget, rhoncus et metus. Fusce mollis sollicitudin lobortis. Aliquam mauris massa, pulvinar id faucibus nec, auctor ut est. Nulla ante magna, volutpat in nunc et, commodo interdum turpis. Proin magna enim
                                                        </p>

                                                        <div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer" class="content_price">
													<span itemprop="price" class="price product-price">
								$ 25.65							</span>
                                                            <meta itemprop="priceCurrency" content="USD">

								<span class="old-price product-price">
									$ 27.00
								</span>

                                                            <span class="price-percent-reduction">-5%</span>


                                                        </div>
                                                        <div class="button-container">
                                                            <a class="button ajax_add_to_cart_button cart_button" href="../cart%3Fadd=1&amp;id_product=10&amp;token=c3148f158c47dee7012a227278ac6a29.html" rel="nofollow" title="Add to cart" data-id-product="10">
                                                                <span>Add to cart</span>
                                                            </a>

                                                        </div>

                                                        <div class="functional-buttons clearfix">

                                                            <div class="wishlist">
                                                                <a class="addToWishlist wishlistProd_10" data-toggle="tooltip" title="Add to wishlist" href="11-printed-dress.html#" rel="nofollow" onclick="WishlistCart('wishlist_block_list', 'add', '10', false, 1); return false;">
                                                                    <i class="fa fa-heart"></i>
                                                                </a>
                                                            </div>
                                                            <div class="compare">
                                                                <a class="add_to_compare" href="10-blouse.html" data-toggle="tooltip" title="Add to compare" data-id-product="10"><i class="fa fa-bar-chart"></i></a>
                                                            </div>

                                                        </div>



                                                    </div>

                                                </div><!-- .product-container> -->
                                            </li></div></div></div><div class="owl-controls"><div class="owl-nav"><div class="bx-prev" style="">‹</div><div class="bx-next" style="">›</div></div><div class="owl-dots" style="display: none;"></div></div></ul>
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