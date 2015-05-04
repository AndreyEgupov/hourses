$(document).ready( function(){
	
	//Display Custom Go top
	if($('#page')){
		$( '#page' ).append( "<a id='sp-totop' class='backtotop' href='#'><i class='fa fa-angle-up'></i></a>" );
	}
	
	$(".backtotop").addClass("hidden-top");
		$(window).scroll(function () {
		if ($(this).scrollTop() === 0) {
			$(".backtotop").addClass("hidden-top")
		} else {
			$(".backtotop").removeClass("hidden-top")
		}
	});

	$('.backtotop').click(function () {
		$('body,html').animate({
				scrollTop:0
			}, 1200);
		return false;
	});
	
} );



