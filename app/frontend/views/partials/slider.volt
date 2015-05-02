{% if sliderDivs|length > 1 %}
<div class="container">
    <div class="page-slider margin-bottom-35">
        <div id="layerslider" style="width: 100%; height: 300px; margin: 0 auto;">
            {% for sliderDiv in sliderDivs %}
                {{ sliderDiv.content }}
            {% endfor %}
        </div>
    </div>
</div>
{% endif %}