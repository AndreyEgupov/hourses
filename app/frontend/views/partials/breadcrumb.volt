<!-- Breadcrumb -->
<div class="breadcrumb ">
    {% for b in br %}
        {% if loop.index == 1 %}
            <li class="home">
                {% if br|length > 1 %}
                    <a href="{{ b['link'] }}" title="" class="has-link">{{ b['text'] }}</a>
                {% endif %}
            </li>
        {% else %}
            <span class="navigation-pipe"><i class="fa fa-angle-double-right"></i></span>
            {% if loop.last %}
                <li class="category316 last">
                    {{ b['text'] }}
                </li>
            {% else %}
                <li class="category316">
                    <a href="{{ b['link'] }}">{{ b['text'] }}</a>
                </li>
            {% endif %}

        {% endif %}
    {% endfor %}
</div>
<!-- /Breadcrumb -->
