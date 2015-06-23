<a href="/order" title="Просмотр корзины" rel="nofollow">
    <div class="shopcart"><b>Корзина</b> <br/>
        {% if cart.getTotalCount() > 0  %}
            <span class="ajax_cart_quantity ">{{ cart.getTotalCount() }}</span>
            <span class="ajax_cart_product_txt ">Товаров</span>
            <span class="ajax_cart_product_txt_s unvisible">Товаров</span>
            <span class="ajax_cart_total ">{{ currencyObj.symbol }} {{ getPrice(cart.getTotalPrice(), currencyObj) }}</span>
        {% else %}
            <span class="ajax_cart_no_product">(empty)</span>
        {% endif %}
    </div>
</a>

<div class="cart_block block exclusive">
    <div class="head-minicart">
        <span class="label-products">Ваши покупки </span>
        <span class="label-price">Цена </span>
    </div>
    <div class="block_content">
        <!-- block list of products -->
        <div class="cart_block_list">
            <p class="cart_block_no_products">
                {% for p in cart.getProducts() %}
                    <dl class="products">
                        <dt class="first_item last_item" data-id="cart_block_combination_of_{{ p['id'] }}" >
                            <a class="cart-images" href="/product/view/{{ p['id'] }}" title="{{ p['title']|e }}">
                                <img src="/timthumb.php?w=70&h=70&src={{ p['img'] }}" alt="{{ p['title']|e }}">
                            </a>
                            <div class="cart-info">
                                <div class="product-name">
                                    <span class="quantity-formated">
                                        <span class="qualy">Количество: </span>
                                        <span class="quantity">{{ p['count'] }}</span>
                                    </span>
                                    <a href="/product/view/{{ p['id'] }}" title="{{ p['title']|e }}" class="cart_block_product_name">{{ p['title']|e }}</a>
                                </div>
                                <span class="price">{{ currencyObj.symbol }} {{ getPrice(p['count'] * p['price'], currencyObj) }}</span>
                            </div>
                        </dt>
                        <dd data-id="cart_block_combination_of_{{ p['id'] }}" class="first_item">
                            <!-- Customizable datas -->
                        </dd>
                    </dl>
                {% endfor %}
            </p>
            <div class="cart-prices">
                <div class="cart-prices-line first-line">
                    <span class="pr">
                        Количество
                    </span>
                    <span class="price cart_block_shipping_cost ajax_cart_shipping_cost">{{ cart.getTotalCount() }}</span>
                </div>
                <div class="cart-prices-line last-line">
                    <span class="price cart_block_total ajax_block_cart_total">{{ currencyObj.symbol }} {{ getPrice(cart.getTotalPrice(), currencyObj) }}</span>
                    <span>Всего</span>
                </div>
            </div>
        </div>
        <div class="wrapper">
            <a href="/order" class="button">Оформить заказ</a>
        </div>
    </div>
</div>