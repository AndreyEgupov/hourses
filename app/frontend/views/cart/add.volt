<div class="layer_cart_overlay" style="width: 100%; height: 100%; display: block;"></div>
<div id="layer_cart">
    <div class="clearfix">
        <div class="layer_cart_product col-xs-12 col-md-6">
            <span class="cross" title="Close window"></span>
            <h2>
                <i class="icon-ok"></i>Товар успешно добавлен в корзину
            </h2>
            <div class="product-image-container layer_cart_img">
                {% set img = product.getFirstImage() %}
                <img class="layer_cart_img img-responsive" src="{{ img.src }}" alt="{{ product.title|e }}" title="{{ product.title|e }}">
            </div>
            <div class="layer_cart_product_info">
                <span id="layer_cart_product_title" class="product-name">{{ product.title|e }}</span>
                <div>
                    <strong class="dark">Количество</strong>
                    <span id="layer_cart_product_quantity">{{ count }}</span>
                </div>
                <div>
                    <strong class="dark">Всего</strong>
                    <span id="layer_cart_product_price">{{ currencyObj.symbol }} {{ getPrice(count * product.price, currencyObj) }}</span>
                </div>
            </div>
        </div>
        <div class="layer_cart_cart col-xs-12 col-md-6">
            <h2>
                <span class="ajax_cart_product_txt_s  unvisible" style="display: inline;">
                    Всего в корзине <span class="ajax_cart_quantity" style="display: inline;">{{ cart.getTotalCount() }}</span> товар(a|ов).
                </span>
            </h2>
            <div class="layer_cart_row">
                <strong class="dark">
                    Всего товаров на сумму
                </strong>
                <span class="ajax_block_products_total">{{ currencyObj.symbol }} {{ getPrice(cart.getTotalPrice(), currencyObj) }}</span>
            </div>

            <div class="button-container">
                <span class="continue btn btn-default button exclusive-medium" title="Продолжить покупки">
                    <span>
                        <i class="fa fa-chevron-left left"></i>Продолжить покупки
                    </span>
                </span>
                <a class="btn btn-default button button-medium" href="/order" title="Proceed to checkout" rel="nofollow">
                    <span>
                        Оформить заказ<i class="fa fa-chevron-right right"></i>
                    </span>
                </a>
            </div>
        </div>
    </div>
    <div class="crossseling"></div>
</div>