
<div id="attributes">
    <div class="clearfix"></div>
    {% for attrNameId, attrList in product.getUniqueAttributes() %}
        {% set attrName = getAttributeName(attrNameId) %}
        {% if attrNameId == 1 or attrNameId == 4 or attrNameId == 5 %}{% continue %}{% endif %}
        {#{% if attrNameId == 2 %}#}
            {#<fieldset class="attribute_fieldset">#}
                {#<label class="attribute_label">{{ attrName.title }} :&nbsp;</label>#}
                {#<div class="attribute_list">#}
                    {#<ul id="color_to_pick_list" class="clearfix">#}
                        {#{% for attr in attrList %}#}
                            {#<li class="">#}
                                {#{% set color = attr.Color %}#}
                                {#<a href="" name="{{ attr.getVal() }}" class="color_pick selected" style="background:#{{ color.getFirst().hash }};" title="{{ attr.getVal() }}" data-attr-id="{{ attr.id }}"></a>#}
                            {#</li>#}
                        {#{% endfor %}#}
                        {#</select>#}

                    {#</ul>#}
                    {#<input type="hidden" class="color_pick_hidden" name="group_{{ attrName.id }}" value="">#}
                {#</div>#}
            {#</fieldset>#}
            {#{% continue %}#}
        {#{% endif %}#}
        {% if attrList|length > 1 %}
                <fieldset class="attribute_fieldset">
                    <label class="attribute_label" for="group_{{ attrName.id }}">{{ attrName.title }} :&nbsp;</label>
                    <div class="attribute_list">
                        <div class="selector" style="width: 150px;">
                            <select name="group_{{ attrName.id }}" id="group_{{ attrName.id }}" class="no-print">
                                {% for attr in attrList %}
                                    <option {% if loop.index == 1 %}selected{% endif %} value="{{ attr.id }}" title="{{ attr.getVal() }}">{{ attr.getVal() }}</option>
                                {% endfor %}
                            </select>
                        </div>
                    </div>
                </fieldset>
        {% else %}
            <fieldset class="attribute_fieldset">
                <label class="attribute_label">{{ attrName.title }} :&nbsp;</label>
                <div class="attribute_list">
                    <ul class="clearfix">
                        {% for attr in attrList %}
                            <li>
                                {{ attr.getVal() }}
                            </li>
                        {% endfor %}
                        </select>
                    </ul>
                </div>
            </fieldset>
        {% endif %}
    {% endfor %}
</div>
