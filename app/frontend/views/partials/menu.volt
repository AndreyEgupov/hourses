<div class="menu-container">
    <div class="container">
        <div class="row">
            {{ partial("partials/category-top") }}
            <div class="header-bottom-right col-md-9 col-sm-6 col-xs-12">
                <!-- Menu -->
                <div id="block_top_menu" class="sf-contener col-md-12 col-sm-12 col-xs-12 clearfix ">
                    <div class="cat-title"><i class="fa fa-bars"></i></div>
                    <ul class="sf-menu clearfix menu-content">
                        {% for m in menuList %}
                            <li><a href="{{ m.url }}" title="{{ m.title|e }}">{{ m.title|e }}</a></li>
                        {% endfor %}
                    </ul>
                </div>
                <!--/ Menu -->

            </div>

        </div>
    </div>
</div>