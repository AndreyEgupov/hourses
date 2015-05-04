jQuery(document).ready(function($){        
		$(".header_user_info ul.links li").mouseenter(function(){
            $(".header_user_info ul.links li.first").addClass('inactive');
        });
        $(".header_user_info ul.links li").mouseleave(function(){
            $(".header_user_info ul.links li.first").removeClass('inactive');
        });
        $(".header_user_info ul.links li.first").mouseenter(function(){
            $(".header_user_info ul.links li.first").removeClass('inactive');
		});

		})