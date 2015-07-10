<div class="footer-container">

    <footer id="footer" class="container">

        <div class="row">
            <!-- Block myaccount module -->
            <div class="spotlight-wrap">
                <section class="footer-account box-footer col-sm-3 ">
                    <h3 class="mod-title">Не завершенные покупки</h3>
                    <div class="block_content toggle-footer">
                        <ul class="list-link">
                            <li>
                                <a href="/order" title="" >
                                    В корзине {{ cart.gettotalCount() }} товаров
                                </a>
                            </li>
                        </ul>
                    </div>
                </section>
                <!-- /Block myaccount module -->

                <!-- MODULE Block footer -->
                <section class="footer-block box-footer col-sm-3 " id="block_various_links_footer">
                    <h3 class="mod-title">Информация</h3>
                    <ul class="list-link">
                        <li class="item">
                            <a href=/page/view/1" title="Возврат денег">
                                Возврат денег
                            </a>
                        </li>
                        <li class="item">
                            <a href="/page/view/2" title="Обмен в магазине">
                                Обмен в магазине
                            </a>
                        </li>
                        <li class="item">
                            <a href="/page/view/3" title="Низкие цены">
                                Низкие цены
                            </a>
                        </li>


                        <li class="item">
                            <a href="/page/view/3" title="Бессплатная доставка">
                                Бессплатная доставка
                            </a>
                        </li>
                    </ul>

                </section>


                <!-- Block categories module -->
                <section class="blockcategories_footer box-footer col-xs-12 col-sm-3">
                    <h3 class="mod-title">Категории</h3>

                    <div class="category_footer toggle-footer">
                        <div class="list">
                            <ul class="list-link tree dhtml" style="margin-bottom: 20px;">
                                {% for c in categories %}
                                <li>
                                    <a href="/category/list/{{ c.id }}" title="">
                                        {{ c.title }}
                                    </a>
                                </li>
                                {% endfor %}

                            </ul>
                        </div>
                    </div>
                    <!-- .category_footer -->
                </section>
                <!-- /Block categories module -->
                <!-- MODULE Block contact infos -->
                <section id="block_contact_infos"
                         class="informations_block_left col-lg-3 col-md-3 col-sm-6 col-xs-12 last">
                    <div>
                        <h4 class="title_block"><a>Contact Us</a></h4>
                        <ul class="list-contact">
                            <li>
                                <i class="fa fa-map-marker"></i>{{ address }}
                            </li>
                            <li>
                                <i class="fa fa-envelope-o"></i>Email:
                                    <span>{{ emailContact }}</span>
                            </li>
                            <li>
                                <i class="fa fa-phone"></i>Phone 1:
                                <span>{{ phone1 }}</span>
                                <br/>
                                Phone 2:<span> {{ phone2 }}</span>
                            </li>

                        </ul>
                    </div>
                </section>
                <!-- /MODULE Block contact infos -->
            </div>
            <!-- SP Extra Slider -->
            <div class="hotcate-wrap">
                <div class="container">
                    <div class="row">
                    </div>
                </div>
            </div>
            <!-- /SP Extra Slider -->

        </div>
    </footer>
    <div class="copy-right col-xs-12 clear">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 yt-copyright">
                    &copy; 2015 Ecommerce software.
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 yt-payment">
                    <div class="block-payment">
                        <a class="payment1" href="#">payment1</a>
                        <a class="payment2" href="#">payment2</a>
                        <a class="payment3" href="#">payment3</a>
                        <a class="payment4" href="#">payment4</a>
                        <a class="payment5" href="#">payment5</a>
                        <a class="payment6" href="#">payment6</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/js/main.js"></script>
    <!-- BEGIN JIVOSITE CODE {literal} -->
    <script type='text/javascript'>
        (function(){ var widget_id = 'yxQMxne6Bu';
            var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);})();</script>
    <!-- {/literal} END JIVOSITE CODE -->