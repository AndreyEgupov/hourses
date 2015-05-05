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
            <li class="category316 last"> {{ b['text'] }}</li>
        {% endif %}
    {% endfor %}
</div>
<!-- /Breadcrumb -->
