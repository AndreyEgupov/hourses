<div class="header-container">
    <header id="header">
        <div class="header-bottom clearfix">
            <div class="container">
                <div class="row">
                    <!-- Block currencies module -->
                    <div id="currencies-block-top">
                        <form id="setCurrency" action="" method="post">
                            <div class="current">
                                <input type="hidden" name="currency" id="currency" value=""/>
                                <span>{{ currencyObj.title }} {{ currencyObj.symbol }} </span>
                            </div>
                            <ul id="first-currencies" class="currencies_ul toogle_content">
                                {% for curr in currencies %}
                                    {% if currencyObj.id == curr.id %}{% continue %}{% endif %}
                                    <li>
                                        <a href="javascript:setCurr({{ curr.id }});" rel="nofollow" title="{{ curr.title }}">
                                            {{ curr.title }} {{ curr.symbol }}
                                        </a>
                                    </li>
                                {% endfor %}
                            </ul>
                        </form>
                    </div>
                    <script>
                        function setCurr (id) {
                            $("input#currency").val(id);
                            $("form#setCurrency").submit();
                        }
                    </script>
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
                        <a class="logo" href="/" title="Магазин конных товаров">
                            <img src="/img/welcome-to-sp-nik-1415445354.jpg" alt="Магазин конных товаров" width="150"/>
                        </a>
                    </div>
                    <div class="header-middle-right col-lg-9 col-md-9 col-sm-12 col-xs-12" >
                        <!-- MODULE Block cart -->
                        <div class="shopping_cart clearfix">
                            {{ partial('partials/cart') }}
                        </div>

                        <!-- /MODULE Block cart --><!-- Block search module TOP -->

                        <div id="search_block_top" class="col-md-offset-3 clearfix">
                            <form id="searchbox" method="get" action="/">
                                <input class="search_query form-control" type="text" name="s" placeholder="Что будем искать?" value="" />
                                <button type="submit" class=" button-search">
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
        <div class="slogal">
            <div class="container" style="padding: 0">
                {{ slogal }}
                <span class="phone">{{ phone1 }}</span>
            </div>
        </div>
    </header>
</div>