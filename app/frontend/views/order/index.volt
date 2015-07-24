<div class="columns-container">
    <div id="columns" class="container">
        <div class="row">
            {{ partial("partials/breadcrumb") }}
            <div id="center_column" class="center_column col-sm-12 col-md-12">
                <h1 id="cart_title" class="page-heading">
                    Корзина
                    <span class="price right" >Сумма минимального заказа 200 € евро.</span>
                </h1>
                <div id="order-detail-content" class="table_block table-responsive">
                    {{ partial('partials/cart-summary') }}
                </div>

                <p class="cart_navigation clearfix">
                    {% if cart.getTotalCount() > 0 %}
                    <a href="/order/contact" class="button btn btn-default standard-checkout button-medium pull-right" title="Proceed to checkout">
                        <span>Продолжить<i class="fa fa-chevron-right right"></i></span>
                    </a>
                    {% endif %}
                    <a href="/" class="button-exclusive button" title="Continue shopping">
                        <i class="fa fa-chevron-left left"></i>Вернуться в магазин
                    </a>
                </p>

            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("input.cart_quantity_input").on('change', function () {
            var productId = $(this).parents('tr').attr('data-product-id'),
                count = $(this).val();
                console.log(productId, count);
            $.ajax({
                type: "POST",
                url: '/cart/editCount/'+productId+'/'+count,
                success: function (data) {
                    location.reload();
                }
            });
        });

        $(".quantity_down").on("click", function () {
            var $input = $(this).parents('td').find('input.cart_quantity_input'),
                val = $input.val() - 1;
            val = val >=1 ? val : 1;
            $input.val(val).trigger('change');
        });
        $(".quantity_up").on("click", function () {
            var $input = $(this).parents('td').find('input.cart_quantity_input'),
                    val = parseInt($input.val()) + 1;
            $input.val(val).trigger('change');
        });

        $(".cart_quantity_delete").on("click", function () {
            var t = confirm("Вы действительно хотите удалить этот товар?");
            if(!t) {return;}

            var productId = $(this).parents('tr').attr('data-product-id');
            $.ajax({
                type: "POST",
                url: '/cart/delete/'+productId,
                success: function (data) {
                    location.reload();
                }
            });
        });
    });
</script>