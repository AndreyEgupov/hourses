var responsiveflagMenu = false;

$(document).ready(function(){
		responsiveLayout();
		$(window).resize(responsiveLayout);
});

// check resolution
function responsiveLayout(){
	
   if ($(document).width() >= 1201 && responsiveflagMenu == false){
		$('#page').addClass('layout-boxed');
		responsiveflagMenu = true;
	}
	else if ($(document).width() < 1200   ){
		$('#page').removeClass('layout-boxed');
		responsiveflagMenu = false;
	}
}

