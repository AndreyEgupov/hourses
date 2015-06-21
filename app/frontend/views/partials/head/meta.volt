{% set title = title is defined? title : titleDefault %}
{% set description = description is defined? description : descriptionDefault %}
{% set keywordsDefault = keywords is defined? keywords : keywordsDefault %}

{% set title = meta? meta.title : titleDefault %}
{% set description = meta? meta.description : descriptionDefault %}
{% set keywordsDefault = meta? meta.keywords : keywordsDefault %}
<meta charset="utf-8"/>
<title>{{ title|e }}</title>

<meta content="{{ description|e }}" name="description">
<meta content="{{ keywordsDefault|e }}" name="keywords">
