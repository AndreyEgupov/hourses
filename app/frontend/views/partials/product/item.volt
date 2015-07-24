<li class="ajax_block_product col-xs-12 col-sm-6 col-md-4 last-in-line last-line first-item-of-tablet-line last-item-of-mobile-line last-mobile-line">
    <div class="product-container" itemscope itemtype="http://schema.org/Product">
        <div class="left-block">
            <div class="product-image-container">
                <a class="product_img_link" href="/product/view/{{ item.id }}" title="Enase temu vacen" itemprop="url">
                    {% for img in item.ProductsImage %}
                        {% if loop.index > 2 %} {% break  %} {% endif %}
                        <img class="img_{{ loop.index0 }}" src="/timthumb.php?w=245&h=245&src={{ img.src }}" alt="" />
                    {% endfor %}
                    {% if item.ProductsImage|length == 0 %}
                        <img class="img_0" src="/timthumb.php?w=245&h=245&src=/img/notpic.jpg" alt="" />
                    {% endif %}
                </a>
                {% if item.price_old > item.price %}
                    <span class="sale-box reduced_price">Скидка!</span>
                {% endif %}
            </div>
        </div>
        <div class="right-block">
            <h5 itemprop="name">
                <a href="/product/view/{{ item.id }}" title="{{ item.title|e }}"
                   itemprop="url">
                    {{ item.title|e }}
                </a>
            </h5>
            <div class="product-desc" itemprop="description">
                {{ item.description }}
            </div>

            <div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="content_price">
                <span itemprop="price" class="price product-price">
                    {{ currencyObj.symbol }} {{ getPrice(item.price, currencyObj) }}
                </span>
                <meta itemprop="priceCurrency" content="{{ currencyObj.title }}"/>
                {% if item.price_old %}
                    <span class="old-price product-price">
                        {{ currencyObj.symbol }} {{ getPrice(item.price_old, currencyObj) }}
                    </span>
                {% endif %}
                {% if item.price_old %}
                    <span class="price-percent-reduction">-{{ noformat(100 - item.price/item.price_old * 100) }}%</span>
                {% endif %}
                <span itemprop="price" class="price product-price right inverse-currency">
                    {{ inverseCurrency.symbol }} {{ getPrice(item.price, inverseCurrency) }}
                </span>
            </div>
            <div class="button-container">
                <a class="button ajax_add_to_cart_button cart_button"
                   href="javascript:cartAdd({{ item.id }})"
                   rel="nofollow" title="Добавить в корзину" data-id-product="{{ item.id }}">
                    <span>В корзину</span>
                </a>
            </div>
        </div>
    </div>
    <!-- .product-container> -->
</li>