{% if data|length %}
    <h1>{{ data.title }}</h1>
    <div class="content-page">
        {{ data.description }}
    </div>
{% else %}
    <div class="content-page">
        Ничего не найдено
    </div>
{% endif %}