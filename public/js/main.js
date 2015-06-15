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
                $("#layered_price_range spn:eq(0)").text(number_format(ui.values[ 0 ], 0, '', ' '));
                $("#layered_price_range spn:eq(1)").text(number_format(ui.values[ 1 ], 0, '', ' '));
                $("#priceMin").val(ui.values[ 0 ]);
                $("#priceMax").val(ui.values[ 1 ]);
            }
        });
        $("#layered_price_range spn:eq(0)").text(prices[0]);
        $("#layered_price_range spn:eq(1)").text(prices[1]);
        $("#layered_price_range spn:eq(0)").text(number_format(prices[ 0 ], 0, '', ' '));
        $("#layered_price_range spn:eq(1)").text(number_format(prices[ 1 ], 0, '', ' '));
        $("#layered_price_range i").each(function () {
            $(this).text(currency);
        });
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
});
