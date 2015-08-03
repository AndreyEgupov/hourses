{% if sliderList is defined %}
<div id="banner">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            {% for slider in sliderList %}
                <li data-target="#myCarousel" data-slide-to="{{ loop.index0 }}" ></li>
            {% endfor %}
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            {% for slider in sliderList %}
                <div class="item {% if loop.index0 == 0 %} active {% endif %}">
                    {% if slider.url %}
                        <a href="{{ slider.url }}">
                            <img src="{{ slider.img_src }}" alt="{{ slider.title|e }}">
                        </a>
                    {% else %}
                        <img src="{{ slider.img_src }}" alt="{{ slider.title|e }}">
                    {% endif %}
                    {% if slider.text  %}<span class="slider-text">{{ slider.text }}</span>{% endif %}
                </div>
            {% endfor %}
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Назад</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Вперед</span>
        </a>
    </div>
</div>
{% endif %}