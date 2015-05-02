<div class="row list-view-sorting clearfix">
    <!-- BEGIN PRODUCT LIST -->
    <div class="row product-list">
        {% for item in items %}
            <!-- PRODUCT ITEM START -->
            <div class="col-md-12" id="item-{{ item.id }}">
                <div class="product-item {% if item.is_vip %} vip {% endif %}">
                    <div class="control" style="padding-bottom: 10px; margin-bottom: 5px;padding-left: 6px; text-align: right; overflow: hidden; border-bottom: 1px dashed #bbb">
                        <button type="button" class="btn default count-visits" title="Просмотров за последние 24 часа ">
                            <strong>{{ count_service_item_visits(item.id, 1) }}</strong> - <small>за 24 часа</small>
                        </button>
                        <button type="button" class="btn default count-visits" title="Просмотров за последние 7 дней">
                            <strong>{{ count_service_item_visits(item.id, 7) }}</strong> - <small>за 7 дней</small>
                        </button>
                        <button type="button" class="btn default count-visits" title="Просмотров за последние 30 дней">
                            <strong>{{ count_service_item_visits(item.id, 30) }}</strong> - <small>за 30 дней</small>
                        </button>
                        <button type="button" class="btn default count-visits" title="Просмотров всего">
                            <strong>{{ count_service_item_visits(item.id, 365) }}</strong> - <small>всего</small>
                        </button>
                    </div>
                    <div class="photo">
                        <a href="/service-item/view/{{ item.id }}">
                            <img src="/timthumb.php?h=171&src={{ item.logo_src }}" />
                        </a>
                        <div class="pi-price">
                            <span class="price">{{ item.price }} руб</span>
                            <span class="date"><i class="fa fa-tags"></i> {{ display_when(item.date_post) }}</span>
                        </div>
                    </div>
                    <h3><a href="/service-item/view/{{ item.id }}">{{ item.title }}</a></h3>
                    <div class="description" style="  margin-top: 45px;">{{ item.short_description }}</div>
                    <div class="navigation">
                        <a href="/service-item/view/{{ item.id }}" class="btn btn-default add2cart">Подробнее</a>
                    </div>
                </div>
            </div>
            <!-- PRODUCT ITEM END -->
        {% endfor %}
    </div>
    <div class="clear"></div>
</div>