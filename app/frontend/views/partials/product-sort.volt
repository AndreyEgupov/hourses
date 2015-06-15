<div class="sortPagiBar  clearfix">
    <div class="row">
        <div class="col-xs-12">
            <div class="view-mode-wrap col-lg-2 col-md-2 col-sm-3 col-xs-12">
                <ul class="display hidden-xs">
                    <li id="grid"><a rel="nofollow" href=""title="Grid"><i class="fa fa-th-large"></i></a></li>
                    <li id="list"><a rel="nofollow" href="" title="List"><i class="fa fa-th-list"></i></a></li>
                </ul>
            </div>
            <div class="toolbar-center col-lg-5 col-md-5 col-sm-8 col-xs-12">
                <form id="productsSortForm" action="" class="productsSortForm"  method="GET">
                    <div class="select">
                        <label for="selectProductSort">Sort:</label>
                        <select id="selectProductSort" class="selectProductSort form-control" onchange="$(this).parents('#productsSortForm').submit();" name="sortType">
                            <option value="1" {% if sortType == 1 %} selected {% endif %}>Имени (А - Я)</option>
                            <option value="2" {% if sortType == 2 %} selected {% endif %}>Имени (Я - А)</option>
                            <option value="3" {% if sortType == 3 %} selected {% endif %}>Цене (Меньше &gt; Больше)</option>
                            <option value="4" {% if sortType == 4 %} selected {% endif %}>Цене (Больше &gt; Меньше)</option>
                            <option value="5" {% if sortType == 5 %} selected {% endif %}>Дате (Старые сверху)</option>
                            <option value="6" {% if sortType == 6 %} selected {% endif %}>Дате (Новые сверху)</option>
                        </select>
                    </div>
                </form>

                <form action="" class="nbrItemPages" method="GET">
                    <div class="clearfix">
                        <label for="nb_item">
                            Show:
                        </label>
                        <select name="countInPage" id="nb_item" class="form-control" onchange="onChange(this);">
                            <option value="9" {% if countInPage == 9 %} selected {% endif %}>9</option>
                            <option value="21" {% if countInPage == 21 %} selected {% endif %}>21</option>
                            <option value="45" {% if countInPage == 45 %} selected {% endif %}>45</option>
                            <option value="60" {% if countInPage == 60 %} selected {% endif %}>60</option>
                            <option value="90" {% if countInPage == 90 %} selected {% endif %}>90</option>
                        </select>
                    </div>
                </form>
            </div>
            <!-- Pagination -->
            {% if page.items|length > 0 and page.total_pages > 1 %}
                <div class="pager-wrapper col-lg-5 col-md-5 col-sm-12 col-xs-12">
                    <div  class="pagination clearfix">
                        <ul class="pagination">
                            <li id="pagination_previous_bottom" class="{% if page.current == 1 %}disabled{% endif %} pagination_previous">
                                {% if page.current != 1 %}
                                    <a href="?page={{ page.before }}"></a>
                                {% endif %}
                            </li>
                            {% if page.showFirst() %}
                                <li >
                                    <a href="?page=1">1</a>
                                </li>
                            {% endif %}
                            {% for index in page.getPages() %}
                                <li {% if page.current == index %}class="active"{% endif %} >
                                    <a href="?page={{ index }}">{{ index }}</a>
                                </li>
                            {% endfor %}
                            {% if page.showLast() %}
                                <li >
                                    <a href="?page={{ page.last }}">{{ page.last }}</a>
                                </li>
                            {% endif %}
                            <li id="pagination_next_bottom" class="{% if page.current == page.total_pages %}disabled{% endif %} pagination_next">
                                {% if page.current != page.total_pages %}
                                    <a href="?page={{ page.next }}"></a>
                                {% endif %}
                            </li>
                        </ul>
                    </div>
                </div>
            {% endif %}
        </div>
    </div>
</div>
<script>
    function onChange (me) {
        var $form = $(me).parents('form');
        var val = $form.find('select[name=countInPage] option:selected').val();
        $form.find('select[name=countInPage] option').removeAttr('selected');
        $form.find('select[name=countInPage] option[value='+val+']').attr('selected', true);
        $form.submit();
    }
</script>