{% if topProducts|length > 0 %}
<h2>Топ предложений</h2>
<div class="bxslider-wrapper">
    <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="4" data-slide-margin="15">
        {% for serviceItem in topProducts %}
        <li>
            <div class="product-item">
                <div class="pi-img-wrapper">
                    {% set images =  serviceItem.ServiceItemImages.toArray() %}
                    {% if images|length > 0 %}
                        {% set src =  images[0]['img_src'] %}
                    {% else %}
                        {% set src =  '/img/b1.jpg' %}
                    {% endif %}
                    <a href=""><img src="/public/timthumb.php?w=128&h=171&src={{ src }}" class="img-responsive" alt=""></a>
                </div>
                <h3><a href="item.html">{{ serviceItem.title }}</a></h3>
            </div>
            <div class="sticker sticker-new"></div>
        </li>
        {% endfor %}
    </ul>
</div>
{% endif %}