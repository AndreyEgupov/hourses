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
                $("#layered_price_range spn:eq(0)").text(ui.values[ 0 ]);
                $("#layered_price_range spn:eq(1)").text(ui.values[ 1 ]);
                $("#priceMin").val(ui.values[ 0 ]);
                $("#priceMax").val(ui.values[ 1 ]);
            }
        });
        $("#layered_price_range spn:eq(0)").text(prices[0]);
        $("#layered_price_range spn:eq(1)").text(prices[1]);
        $("#layered_price_range i").each(function () {
            $(this).text(currency);
        });
    }
});
