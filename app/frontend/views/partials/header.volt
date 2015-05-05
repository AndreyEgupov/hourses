<div class="header-container">
    <header id="header">
        <div class="header-bottom clearfix">
            <div class="container">
                <div class="row">
                    <!-- Block currencies module -->
                    <div id="currencies-block-top">
                        <form id="setCurrency" action="4-automotive-motocrycle.html" method="post">
                            <div class="current">
                                <input type="hidden" name="id_currency" id="id_currency" value=""/>
                                <input type="hidden" name="SubmitCurrency" value=""/>
                                <!--<span class="cur-label">Currency :</span>-->
                                <span>Euros </span></div>
                            <ul id="first-currencies" class="currencies_ul toogle_content">
                                <li class="selected">
                                    <a href="javascript:setCurrency(1);" rel="nofollow" title="Dollar">
                                        Руб.
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:setCurrency(2);" rel="nofollow" title="Euros">
                                        Dollar
                                    </a>
                                </li>
                            </ul>
                        </form>
                    </div>

                    {#<div class="header_user_info">#}
                    {#<ul class="links">#}
                    {#<li class="first">#}
                    {#<a class="login" href="my-account.html" rel="nofollow"#}
                    {#title="Log in to your customer account">#}
                    {#My Account#}
                    {#</a>#}
                    {#</li>#}

                    {#<li><a href="module/blockwishlist/mywishlist.html" class="top-link-wishlist"#}
                    {#title="My Wishlist">My Wishlist</a></li>#}

                    {#<li><a href="order.html" class="top-link-checkout" title="Check out" rel="nofollow">Checkout</a>#}
                    {#</li>#}
                    {#</ul>#}
                    {#</div>#}

                    {#<div class="welcome-market col-sm-4">#}
                    {#<ul class="links">#}
                    {#<li class="first welcome ">#}
                    {#<p>Welcome to Market! <a class="login" href="my-account.html" rel="nofollow"#}
                    {#title="Log in to your customer account">#}
                    {#Join Free#}
                    {#</a> or <a class="login" href="my-account.html" rel="nofollow"#}
                    {#title="Log in to your customer account">#}
                    {#Sign in#}
                    {#</a></p>#}

                    {#</li>#}


                    {#</ul>#}
                    {#</div>#}
                </div>
            </div>
        </div>
        <div class="header-top clearfix">
            <div class="container">
                <div class="row">
                    <div id="header_logo" class="logo col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <a class="logo" href="/" title="Welcome to SP Market">
                            <img src="/img/welcome-to-sp-nik-1415445354.jpg" alt="Welcome to SP Market" width="142"
                                 height="42"/>
                        </a>
                    </div>
                    <div class="header-middle-right col-lg-9 col-md-9 col-sm-12 col-xs-12">
                        <!-- MODULE Block cart -->
                        <div class="shopping_cart clearfix">
                            <a href="order.html" title="View my shopping cart" rel="nofollow">
                                <div class="shopcart"><b>Shopping Cart</b> <br/>
                                    <span class="ajax_cart_quantity unvisible">0</span>
                                    <span class="ajax_cart_product_txt unvisible">Product</span>
                                    <span class="ajax_cart_product_txt_s unvisible">Products</span>
                                    <span class="ajax_cart_total unvisible"></span>
                                    <span class="ajax_cart_no_product">(empty)</span>
                                </div>
                            </a>

                            <div class="cart_block block exclusive">
                                <div class="head-minicart">
                                    <span class="label-products">Your products </span>
                                    <span class="label-price">Price </span>
                                </div>
                                <div class="block_content">
                                    <!-- block list of products -->
                                    <div class="cart_block_list">
                                        <p class="cart_block_no_products">
                                            No products
                                        </p>

                                        <div class="cart-prices">
                                            <div class="cart-prices-line first-line">
								<span class="pr">
									Shipping
								</span>
                                                <span class="price cart_block_shipping_cost ajax_cart_shipping_cost">Free shipping!</span>
                                            </div>
                                            <div class="cart-prices-line last-line">
                                                <span class="price cart_block_total ajax_block_cart_total">$ 0.00</span>
                                                <span>Total</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="wrapper">
                                        <a href="order.html" class="button">Go to cart</a>
                                        <a href="order%3Fstep=1.html" class="button" title="Checkout" rel="nofollow">checkout</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="layer_cart">
                            <div class="clearfix">
                                <div class="layer_cart_product col-xs-12 col-md-6">
                                    <span class="cross" title="Close window"></span>

                                    <h2>
                                        <i class="icon-ok"></i>Product successfully added to your shopping cart
                                    </h2>

                                    <div class="product-image-container layer_cart_img">
                                    </div>
                                    <div class="layer_cart_product_info">
                                        <span id="layer_cart_product_title" class="product-name"></span>
                                        <span id="layer_cart_product_attributes"></span>

                                        <div>
                                            <strong class="dark">Quantity</strong>
                                            <span id="layer_cart_product_quantity"></span>
                                        </div>
                                        <div>
                                            <strong class="dark">Total</strong>
                                            <span id="layer_cart_product_price"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="layer_cart_cart col-xs-12 col-md-6">
                                    <h2>
                                        <!-- Plural Case [both cases are needed because page may be updated in Javascript] -->
					<span class="ajax_cart_product_txt_s  unvisible">
						There are <span class="ajax_cart_quantity">0</span> items in your cart.
					</span>
                                        <!-- Singular Case [both cases are needed because page may be updated in Javascript] -->
					<span class="ajax_cart_product_txt ">
						There is 1 item in your cart.
					</span>
                                    </h2>

                                    <div class="layer_cart_row">
                                        <strong class="dark">
                                            Total products
                                        </strong>
					<span class="ajax_block_products_total">
											</span>
                                    </div>

                                    <div class="layer_cart_row">
                                        <strong class="dark">
                                            Total shipping&nbsp;                    </strong>
					<span class="ajax_cart_shipping_cost">
													Free shipping!
											</span>
                                    </div>
                                    <div class="layer_cart_row">
                                        <strong class="dark">
                                            Total
                                        </strong>
					<span class="ajax_block_cart_total">
											</span>
                                    </div>
                                    <div class="button-container">
					<span class="continue btn btn-default button exclusive-medium" title="Continue shopping">
						<span>
							<i class="fa fa-chevron-left left"></i>Continue shopping
						</span>
					</span>
                                        <a class="btn btn-default button button-medium" href="order.html"
                                           title="Proceed to checkout" rel="nofollow">
						<span>
							Proceed to checkout<i class="fa fa-chevron-right right"></i>
						</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="crossseling"></div>
                        </div>
                        <!-- #layer_cart -->
                        <div class="layer_cart_overlay"></div>


                        <!-- /MODULE Block cart --><!-- Block search module TOP -->

                        <div id="search_block_top" class="col-md-offset-3 clearfix">
                            <form id="searchbox" method="get"
                                  action="http://prestashop.skyoftech.com/sp_market/en/search">
                                <input type="hidden" name="controller" value="search"/>
                                <input type="hidden" name="orderby" value="position"/>
                                <input type="hidden" name="orderway" value="desc"/>
                                <input class="search_query form-control" type="text" id="search_query_top"
                                       name="search_query" placeholder="Enter keywords to search..." value=""/>
                                <button type="submit" name="submit_search" class=" button-search">
                                    <i class="fa fa-search"></i>
                                </button>
                            </form>
                        </div>
                        <!-- /Block search module TOP -->
                        <!-- SP Extra Slider -->
                        <div class="hotcate-wrap">
                            <div class="container">
                                <div class="row">
                                </div>
                            </div>
                        </div>
                        <!-- /SP Extra Slider -->
                    </div>
                </div>
            </div>
        </div>

    </header>
</div>