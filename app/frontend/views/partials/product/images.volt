<div id="views_block" class="clearfix ">
    <div id="thumbs_list">
        <ul class="owlCarousel" data-items="3">
            {% for img in product.ProductsImage %}
                <li id="thumbnail_{{ loop.index }}">
                    <a href="javascript:void(0);" data-src="{{ img.src }}">
                        <img class="img-responsive" src="/timthumb.php?w=148&h=148&src={{ img.src }}" alt="" >
                    </a>
                </li>
            {% endfor %}
        </ul>
    </div>
</div>
