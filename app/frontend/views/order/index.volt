<div class="columns-container">
    <div id="columns" class="container">
        <div class="row">
            {{ partial("partials/breadcrumb") }}
            <div id="center_column" class="center_column col-sm-12 col-md-12">




                <h1 id="cart_title" class="page-heading">Shopping-cart summary
			<span class="heading-counter">Your shopping cart contains:
			<span id="summary_products_quantity">7 products</span>
		</span>
                </h1>






                <!-- Steps -->
                <ul class="step clearfix" id="order_step">
                    <li class="step_current  first">
                        <span><em>01.</em> Summary</span>
                    </li>
                    <li class="step_todo second">
                        <span><em>02.</em> Sign in</span>
                    </li>
                    <li class="step_todo third">
                        <span><em>03.</em> Address</span>
                    </li>
                    <li class="step_todo four">
                        <span><em>04.</em> Shipping</span>
                    </li>
                    <li id="step_end" class="step_todo last">
                        <span><em>05.</em> Payment</span>
                    </li>
                </ul>
                <!-- /Steps -->




                <p style="display:none" id="emptyCartWarning" class="alert alert-warning">Your shopping cart is empty.</p>
                <div class="cart_last_product">
                    <div class="cart_last_product_header">
                        <div class="left">Last product added</div>
                    </div>
                    <a class="cart_last_product_img" href="http://prestashop.skyoftech.com/sp_market/en/health-beauty/26-printed-dress.html">
                        <img src="http://prestashop.skyoftech.com/sp_market/125-small_default/printed-dress.jpg" alt="Giza suma tukam">
                    </a>
                    <div class="cart_last_product_content">
                        <p class="product-name">
                            <a href="http://prestashop.skyoftech.com/sp_market/en/health-beauty/26-printed-dress.html#/size-s/color-orange">
                                Giza suma tukam
                            </a>
                        </p>
                        <small>
                            <a href="http://prestashop.skyoftech.com/sp_market/en/health-beauty/26-printed-dress.html#/size-s/color-orange">
                                Size : S, Color : Orange
                            </a>
                        </small>
                    </div>
                </div>


                <div id="order-detail-content" class="table_block table-responsive">
                    <table id="cart_summary" class="table table-bordered stock-management-on">
                        <thead>
                        <tr>
                            <th class="cart_product first_item">Product</th>
                            <th class="cart_description item">Description</th>
                            <th class="cart_avail item">Avail.</th>
                            <th class="cart_unit item">Unit price</th>
                            <th class="cart_quantity item">Qty</th>
                            <th class="cart_total item">Total</th>
                            <th class="cart_delete last_item">&nbsp;</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr class="cart_total_price">
                            <td rowspan="5" colspan="3" id="cart_voucher" class="cart_voucher">
                            </td>
                            <td colspan="3" class="text-right">Total products</td>
                            <td colspan="2" class="price" id="total_product">$ 563.00</td>
                        </tr>
                        <tr style="display: none;">
                            <td colspan="3" class="text-right">
                                Total gift-wrapping cost:											</td>
                            <td colspan="2" class="price-discount price" id="total_wrapping">
                                $ 0.00
                            </td>
                        </tr>
                        <tr class="cart_total_delivery">
                            <td colspan="3" class="text-right">Total shipping</td>
                            <td colspan="2" class="price" id="total_shipping">$ 2.00</td>
                        </tr>
                        <tr class="cart_total_voucher" style="display:none">
                            <td colspan="3" class="text-right">
                                Total vouchers
                            </td>
                            <td colspan="2" class="price-discount price" id="total_discount">
                                $ 0.00
                            </td>
                        </tr>
                        <tr class="cart_total_price">
                            <td colspan="3" class="text-right">Total</td>
                            <td colspan="2" class="price" id="total_price_without_tax">$ 565.00</td>
                        </tr>
                        <tr class="cart_total_tax">
                            <td colspan="3" class="text-right">Tax</td>
                            <td colspan="2" class="price" id="total_tax">$ 0.00</td>
                        </tr>
                        <tr class="cart_total_price">
                            <td colspan="3" class="total_price_container text-right">
                                <span>Total</span>
                            </td>
                            <td colspan="2" class="price" id="total_price_container">
                                <span id="total_price">$ 565.00</span>
                            </td>
                        </tr>
                        </tfoot>
                        <tbody>

                        <tr id="product_24_136_0_0" class="cart_item first_item address_0 odd">
                            <td class="cart_product">
                                <a href="http://prestashop.skyoftech.com/sp_market/en/health-beauty/24-printed-dress.html#/size-s/color-orange"><img src="http://prestashop.skyoftech.com/sp_market/115-small_default/printed-dress.jpg" alt="Direas mute pokam" width="98" height="98"></a>
                            </td>
                            <td class="cart_description">
                                <p class="product-name"><a href="http://prestashop.skyoftech.com/sp_market/en/health-beauty/24-printed-dress.html#/size-s/color-orange">Direas mute pokam</a></p>
                                <small class="cart_ref">SKU : demo_3</small>		<small><a href="http://prestashop.skyoftech.com/sp_market/en/health-beauty/24-printed-dress.html#/size-s/color-orange">Size : S, Color : Orange</a></small>	</td>
                            <td class="cart_avail"><span class="label label-success">In stock</span></td>
                            <td class="cart_unit" data-title="Unit price">
		<span class="price" id="product_price_24_136_0">
			            	               	 	<span class="price">$ 82.00</span>
													</span>
                            </td>

                            <td class="cart_quantity text-center">

                                <input type="hidden" value="6" name="quantity_24_136_0_0_hidden">
                                <input size="2" type="text" autocomplete="off" class="cart_quantity_input form-control grey" value="6" name="quantity_24_136_0_0">
                                <div class="cart_quantity_button clearfix">
                                    <a rel="nofollow" class="cart_quantity_down btn btn-default button-minus" id="cart_quantity_down_24_136_0_0" href="http://prestashop.skyoftech.com/sp_market/en/cart?add=1&amp;id_product=24&amp;ipa=136&amp;id_address_delivery=0&amp;op=down&amp;token=c87f0e9ff576539748f3d9ecc1c4a2c4" title="Subtract">
                                        <span><i class="fa fa-minus"></i></span>
                                    </a>
                                    <a rel="nofollow" class="cart_quantity_up btn btn-default button-plus" id="cart_quantity_up_24_136_0_0" href="http://prestashop.skyoftech.com/sp_market/en/cart?add=1&amp;id_product=24&amp;ipa=136&amp;id_address_delivery=0&amp;token=c87f0e9ff576539748f3d9ecc1c4a2c4" title="Add"><span><i class="fa fa-plus"></i></span></a>
                                </div>
                            </td>
                            <td class="cart_total" data-title="Total">
		<span class="price" id="total_product_price_24_136_0">
												$ 492.00									</span>
                            </td>
                            <td class="cart_delete text-center" data-title="Delete">
                                <div>
                                    <a rel="nofollow" title="Delete" class="cart_quantity_delete" id="24_136_0_0" href="http://prestashop.skyoftech.com/sp_market/en/cart?delete=1&amp;id_product=24&amp;ipa=136&amp;id_address_delivery=0&amp;token=c87f0e9ff576539748f3d9ecc1c4a2c4"><i class="fa fa-trash"></i></a>
                                </div>
                            </td>
                        </tr>



                        <tr id="product_26_142_0_0" class="cart_item last_item address_0 even">
                            <td class="cart_product">
                                <a href="http://prestashop.skyoftech.com/sp_market/en/health-beauty/26-printed-dress.html#/size-s/color-orange"><img src="http://prestashop.skyoftech.com/sp_market/125-small_default/printed-dress.jpg" alt="Giza suma tukam" width="98" height="98"></a>
                            </td>
                            <td class="cart_description">
                                <p class="product-name"><a href="http://prestashop.skyoftech.com/sp_market/en/health-beauty/26-printed-dress.html#/size-s/color-orange">Giza suma tukam</a></p>
                                <small class="cart_ref">SKU : demo_3</small>		<small><a href="http://prestashop.skyoftech.com/sp_market/en/health-beauty/26-printed-dress.html#/size-s/color-orange">Size : S, Color : Orange</a></small>	</td>
                            <td class="cart_avail"><span class="label label-success">In stock</span></td>
                            <td class="cart_unit" data-title="Unit price">
		<span class="price" id="product_price_26_142_0">
			            	               	 	<span class="price">$ 71.00</span>
													</span>
                            </td>

                            <td class="cart_quantity text-center">

                                <input type="hidden" value="1" name="quantity_26_142_0_0_hidden">
                                <input size="2" type="text" autocomplete="off" class="cart_quantity_input form-control grey" value="1" name="quantity_26_142_0_0">
                                <div class="cart_quantity_button clearfix">
                                    <a rel="nofollow" class="cart_quantity_down btn btn-default button-minus" id="cart_quantity_down_26_142_0_0" href="http://prestashop.skyoftech.com/sp_market/en/cart?add=1&amp;id_product=26&amp;ipa=142&amp;id_address_delivery=0&amp;op=down&amp;token=c87f0e9ff576539748f3d9ecc1c4a2c4" title="Subtract">
                                        <span><i class="fa fa-minus"></i></span>
                                    </a>
                                    <a rel="nofollow" class="cart_quantity_up btn btn-default button-plus" id="cart_quantity_up_26_142_0_0" href="http://prestashop.skyoftech.com/sp_market/en/cart?add=1&amp;id_product=26&amp;ipa=142&amp;id_address_delivery=0&amp;token=c87f0e9ff576539748f3d9ecc1c4a2c4" title="Add"><span><i class="fa fa-plus"></i></span></a>
                                </div>
                            </td>
                            <td class="cart_total" data-title="Total">
		<span class="price" id="total_product_price_26_142_0">
												$ 71.00									</span>
                            </td>
                            <td class="cart_delete text-center" data-title="Delete">
                                <div>
                                    <a rel="nofollow" title="Delete" class="cart_quantity_delete" id="26_142_0_0" href="http://prestashop.skyoftech.com/sp_market/en/cart?delete=1&amp;id_product=26&amp;ipa=142&amp;id_address_delivery=0&amp;token=c87f0e9ff576539748f3d9ecc1c4a2c4"><i class="fa fa-trash"></i></a>
                                </div>
                            </td>
                        </tr>


                        </tbody>
                    </table>
                </div> <!-- end order-detail-content -->





                <div id="HOOK_SHOPPING_CART"></div>
                <p class="cart_navigation clearfix">
                    <a href="http://prestashop.skyoftech.com/sp_market/en/order?step=1" class="button btn btn-default standard-checkout button-medium pull-right" title="Proceed to checkout" style="">
                        <span>Proceed to checkout<i class="fa fa-chevron-right right"></i></span>
                    </a>
                    <a href="http://prestashop.skyoftech.com/sp_market/en/health-beauty/24-printed-dress.html" class="button-exclusive button" title="Continue shopping">
                        <i class="fa fa-chevron-left left"></i>Continue shopping
                    </a>
                </p>

            </div>
        </div>
    </div>
</div>