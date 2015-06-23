<table id="cart_summary" class="table table-bordered stock-management-on">
    <thead>
    <tr>
        <th class="cart_product first_item">Товар</th>
        <th class="cart_description item">Описание</th>
        <th class="cart_avail item">Наличие</th>
        <th class="cart_unit item">Цена</th>
        <th class="cart_quantity item">Количество</th>
        <th class="cart_total item">Всего</th>
        <th class="cart_delete last_item">&nbsp;</th>
    </tr>
    </thead>

    <tbody>
    {% for p in cart.getProducts() %}
        <tr class="cart_item first_item address_0 odd" data-product-id="{{ p['id'] }}">
            <td class="cart_product">
                <a href="">
                    <img src="/timthumb.php?w=98&h=98&src={{ p['img'] }}" alt="" width="98" height="98">
                </a>
            </td>
            <td class="cart_description">
                <p class="product-name">
                    <a href="/product/view/{{ p['id'] }}">{{ p['title'] }}</a>
                </p>
                <small>SKU : demo_3</small>
                <small>
                    Size
                    : S, Color : Orange
                </small>
            </td>
            <td class="cart_avail">
                <span class="label label-success">In stock</span>
            </td>
            <td class="cart_unit" data-title="Unit price">
                                    <span class="price" >
                                        <span class="price">{{ currencyObj.symbol }} {{ getPrice(p['price'], currencyObj) }}</span>
                                    </span>
            </td>

            <td class="cart_quantity text-center">
                <input type="hidden" value="6" name="quantity">
                <input size="2" type="text" autocomplete="off" class="cart_quantity_input form-control grey" value="{{ p['count'] }}" name="">

                <div class="cart_quantity_button clearfix">
                    <a rel="nofollow" class="quantity_down btn btn-default button-minus"
                       id="cart_quantity_down"
                       href="javascript:void(0)"
                       title="Subtract">
                        <span><i class="fa fa-minus"></i></span>
                    </a>
                    <a rel="nofollow" class="quantity_up btn btn-default button-plus"
                       id="cart_quantity_up"
                       href="javascript:void(0)"
                       title="Add">
                        <span><i class="fa fa-plus"></i></span>
                    </a>
                </div>
            </td>
            <td class="cart_total" data-title="Total">
                <span class="price" id="total_product_price_24_136_0">
                    {{ currencyObj.symbol }} {{ getPrice(p['count'] * p['price'], currencyObj) }}
                </span>
            </td>
            <td class="cart_delete text-center" data-title="Delete">
                <div>
                    <a rel="nofollow" title="Delete" class="cart_quantity_delete" id="24_136_0_0"
                       href=""><i class="fa fa-trash"></i>
                    </a>
                </div>
            </td>
        </tr>
    {% endfor %}
    </tbody>

    <tfoot>
    <tr class="cart_total_price">
        <td rowspan="5" colspan="3" id="cart_voucher" class="cart_voucher">
        </td>
        <td colspan="3" class="text-right">Всего продуктов</td>
        <td colspan="2" class="price" id="total_product">{{ cart.getTotalCount() }}</td>
    </tr>
    <tr class="cart_total_price">
        <td colspan="3" class="total_price_container text-right">
            <span>Итого</span>
        </td>
        <td colspan="2" class="price" id="total_price_container">
            <span id="total_price">{{ currencyObj.symbol }} {{ getPrice(cart.getTotalPrice(), currencyObj) }}</span>
        </td>
    </tr>
    </tfoot>
</table>