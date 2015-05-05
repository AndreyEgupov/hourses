<div class="sidebar-menu  col-md-3 col-sm-6 col-xs-12">
    <!-- Menu -->
    <div id="sp_vertical_menu" class="sp-vertical-menu clearfix">
        <div id="cat-titleall">
            <span><i class="fa fa-th-list"></i>Категории</span>
            <i class="fa-chevron-circle-down"></i>
        </div>
        {{ menuTop(categoriesMenu) }}
    </div>
    <!--/ Menu -->
    <script type="text/javascript">
        //<![CDATA[
        jQuery(document).ready(function ($) {
            ;
            (function (element) {
                var el = $(element), vf_menu = $('.vf-menu', el),
                        level1 = $('.vf-menu >.spvm-havechild', el), _li = $('.spvm-havechild', el), vf_button = $('.vf-button', el), nb_hiden = 10;

                if (level1.length && level1.length > nb_hiden) {
                    for (var i = 0; i < level1.length; i++) {
                        if (i > (nb_hiden - 1)) {
                            level1.eq(i).addClass('cat-visible');
                            level1.eq(i).hide();
                        }
                    }
                    vf_menu.append('<li class="more-wrap"><span class="more-view"><i class="fa fa-plus-square-o"></i>More Categories</span></li>');
                    $('.more-view', vf_menu).on('click touchstart', function () {
                        if (level1.hasClass('cat-visible')) {
                            vf_menu.find('.cat-visible').removeClass('cat-visible').addClass('cat-hidden').stop().slideDown(400);
                            $(this).html('<i class="fa fa-minus-square-o"></i>Close Menu');
                        } else if (level1.hasClass('cat-hidden')) {
                            vf_menu.find('.cat-hidden').removeClass('cat-hidden').addClass('cat-visible').stop().slideUp(200);
                            $(this).html('<i class="fa fa-plus-square-o"></i>More Categories');
                        }
                    });

                }
                function _vfResponsive() {
                    if ($(window).width() <= 979) {
                        vf_menu.hide();
                        $('#cat-titleall', el).on('click touchstart', function () {
                            $(this).toggleClass('active').parent().find('ul.vf-menu').stop().slideToggle('medium');
                            return false;
                        });
                        _li.addClass('vf-close');
                        _li.children('ul').css('display', 'none');
                        if (vf_button.length) {
                            vf_button.on('click touchstart', function () {
                                var _this = $(this), li = _this.parent(), ul = li.children('ul');
                                if (li.hasClass('vf-close')) {
                                    li.removeClass('vf-close').addClass('vf-open');
                                    ul.stop(false, true).slideDown(500);
                                    _this.removeClass('icon-close').addClass('icon-open');
                                } else {
                                    li.removeClass('vf-open').addClass('vf-close');
                                    ul.stop(false, true).slideUp(200);
                                    _this.removeClass('icon-open').addClass('icon-close');
                                }
                                return;
                            });
                        }
                    } else {
                        $('.cat-title', el).unbind('click');
                        vf_button.unbind('click');
                        $('.cat-title', el).removeClass('active');
                        vf_menu.removeAttr('style');
                        _li.addClass('vf-close');
                        _li.children('ul').removeAttr('style');
                        vf_button.removeClass('icon-open').addClass('icon-close');
                    }
                }

                _vfResponsive();
                $(window).on('resize', function () {
                    _vfResponsive();
                });
            })('#sp_vertical_menu');
        });
        //]]>
    </script>
</div>