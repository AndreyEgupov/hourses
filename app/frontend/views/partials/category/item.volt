<li class="ajax_block_product col-xs-12 col-sm-6 col-md-4 last-in-line last-line first-item-of-tablet-line last-item-of-mobile-line last-mobile-line category-list-li">
    <div class="product-container category-list" itemscope itemtype="http://schema.org/Product">
        <div class="left-block">
            <div class="right-block">
                <h5 itemprop="name">
                    <a href="/category/list/{{ category.id }}" title="{{ category.title|e }}" class="category-title">
                        {{ category.title|e }}
                    </a>
                </h5>
            </div>
            <div class="product-image-container">
                <a class="product_img_link" href="/category/list/{{ category.id }}" title="{{ category.title|e }}" itemprop="url">
                    <img class="img_0" src="/timthumb.php?w=150&h=150&src={{ category.img }}" alt="" />
                </a>
            </div>
        </div>
    </div>
    <!-- .product-container> -->
</li>