<div id="center_column" class="center_column col-sm-8 col-md-9">
    <div class="content_scene_cat "></div>
    {% if product.items|length %}
    <div class="content_sortPagiBar clearfix">
        {{ partial("partials/product-sort") }}
    </div>
    <ul class="product_list grid row">
        {% for item in product.items  %}
            <li class="ajax_block_product col-xs-12 col-sm-6 col-md-4 last-in-line last-line first-item-of-tablet-line last-item-of-mobile-line last-mobile-line">
            <div class="product-container" itemscope itemtype="http://schema.org/Product">
                <div class="left-block">
                    <div class="product-image-container">
                        <a class="product_img_link" href="/" title="Enase temu vacen" itemprop="url">
                            {% for img in item.ProductsImage %}
                                {% if loop.index > 2 %} {% break  %} {% endif %}
                                <img class="img_{{ loop.index0 }}" src="/timthumb.php?w=245&h=245&src={{ img.src }}" alt="" />
                            {% endfor %}
                            {% if item.ProductsImage|length == 0 %}
                                <img class="img_0" src="/timthumb.php?w=245&h=245&src=/img/notpic.jpg" alt="" />
                            {% endif %}
                        </a>
                    </div>
                </div>
                <div class="right-block">
                    <h5 itemprop="name">
                        <a href="automotive-motocrycle/4-printed-dress.html" title="{{ item.title|e }}"
                           itemprop="url">
                            {{ item.title|e }}
                        </a>
                    </h5>
                    <div class="product-desc" itemprop="description">
                        {{ item.description }}
                    </div>

                    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer"
                         class="content_price">
                        <span itemprop="price" class="price product-price">
                            {{ currency }} {{ item.price }}
                        </span>
                        <meta itemprop="priceCurrency" content="USD"/>
                        <span class="old-price product-price">
                            {{ currency }} {{ item.price_old }}
                        </span>
                        {% if item.price_old %}
                        <span class="price-percent-reduction">-{{ noformat(100 - item.price/item.price_old * 100) }}%</span>
                        {% endif %}
                    </div>
                    <div class="button-container">
                        <a class="button ajax_add_to_cart_button cart_button"
                           href="cart%3Fadd=1&amp;id_product=4&amp;token=c3148f158c47dee7012a227278ac6a29.html"
                           rel="nofollow" title="Add to cart" data-id-product="4">
                            <span>В корзину</span>
                        </a>
                    </div>
                </div>
            </div>
            <!-- .product-container> -->
        </li>
        {% endfor %}
    </ul>
    <div class="content_sortPagiBar clearfix">
        {{ partial("partials/product-sort") }}
    </div>
    {% else %}
        Ничего не найдено
    {% endif %}
</div>