$(document).ready(function() {
    if(jQuery.fn.owlCarousel) {
        var $owl = $(".owlCarousel");
        $owl.each(function (ind, container) {
            $(container).owlCarousel({
                items : $(container).attr('data-items'),
                navigation:true
            });
        });
    }

    if(jQuery.fn.slider) {
        $("#ul_layered_price" ).slider({
            step: 5,
            min: parseInt(minPrice),
            max: parseInt(maxPrice),
            values: [prices[0], prices[1]],
            range: true,
            slide: function( event, ui ) {
                $("#layered_price_range spn:eq(0)").text(number_format(priceRelation * ui.values[ 0 ], 0, '', ' '));
                $("#layered_price_range spn:eq(1)").text(number_format(priceRelation * ui.values[ 1 ], 0, '', ' '));
                $("#priceMin").val(ui.values[ 0 ]);
                $("#priceMax").val(ui.values[ 1 ]);
            }
        });
        $("#layered_price_range spn:eq(0)").text(number_format(priceRelation * prices[ 0 ], 0, '', ' '));
        $("#layered_price_range spn:eq(1)").text(number_format(priceRelation * prices[ 1 ], 0, '', ' '));
        $("#layered_price_range i").each(function () {
            $(this).text(currency);
        });
        $("#priceMin").val(prices[0]);
        $("#priceMax").val(prices[1]);
    }

    function number_format(number, decimals, dec_point, thousands_sep) {
        number = (number + '')
            .replace(/[^0-9+\-Ee.]/g, '');
        var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
                var k = Math.pow(10, prec);
                return '' + (Math.round(n * k) / k)
                        .toFixed(prec);
            };
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n))
            .split('.');
        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '')
                .length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1)
                .join('0');
        }
        return s.join(dec);
    }

    var $leftMenu = $("#categories_block_left ul.tree");
    $leftMenu.find("li a").each(function () {
        if($(this).attr("href") == location.pathname || $(this).attr("href")+"/" == location.pathname) {
            $(this).closest("li").addClass("active");
            $(this).parents("li ul").each(function () {
                $(this).siblings("span").removeClass('CLOSE').addClass('OPEN');
                $(this).fadeIn();
            });
        }
    });

    $("div.shopping_cart").hover(function () {
        $(".cart_block.block.exclusive").fadeIn();
    }, function () {
        $(".cart_block.block.exclusive").fadeOut();
    });
});

function cartAdd (id) {
    var count = parseInt($("#quantity_wanted").val()) + 0;
    count = isNaN(count)? 1 : count;
    $.ajax({
        type: "POST",
        url: '/cart/add/'+id+"/"+count,
        success: function (data) {
            $("#layer_cart").remove();
            $("#layer_cart_overlay").remove();
            $("body").append(data);

            updateCart();
        }
    });
}

function updateCart () {
    $.ajax({
        type: "POST",
        url: '/cart/update/',
        success: function (data) {
            $("div.shopping_cart.clearfix").html(data);
        }
    });
}
