<div class="product-page">
    <div class="row">
        <div class="col-md-6 col-sm-6">
            <div class="product-main-image">
                <img src="/timthumb.php?w=387&src={{ item.logo_src }}" alt="" class="img-responsive" data-BigImgSrc="{{ item.logo_src }}">
            </div>
            <div class="product-other-images">
                <a href="javascript:void(0);" onclick="clickZoom(this);" style="display: inline;">
                    <img alt="" src="/timthumb.php?w=387&src={{ item.logo_src }}" data-BigImgSrc="{{ item.logo_src }}">
                </a>
                {% for serviceItemImage in item.ServiceItemImages  %}
                <a href="javascript:void(0);" onclick="clickZoom(this);">
                    <img alt="" src="/timthumb.php?w=387&src={{ serviceItemImage.img_src }}" data-BigImgSrc="{{ serviceItemImage.img_src }}">
                </a>
                {% endfor %}
            </div>
        </div>
        <div class="col-md-6 col-sm-6">
            <h1>{{ item.title }}</h1>
            <div class="price-availability-block clearfix">
                <div class="price">
                    <strong>{{ item.price }} <span>руб </span></strong>
                    <!--                    <em>$<span>62.00</span></em>-->
                </div>
                <div class="availability">
                    <!--                    Availability: <strong>In Stock</strong>-->
                </div>
            </div>
            <div class="description">
                {{ item.description }}
            </div>
            <div class="product-page-cart">
                <br>
                <button class="btn btn-primary" type="submit" onclick="displayContact({{ item.id }});" id="show-contact">Показать контакты</button>
            </div>
            <div class="review">
                <input type="range" value="4" step="0.25" id="backing4">
                <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                </div>
                <a href="javascript:$('#review-click').trigger('click');">{{ item.ServiceItemComments|length }} комментариев</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="javascript:$('#review-click').trigger('click');">Написать комментарий</a>
            </div>
            <ul class="social-icons">
                {#<li><a class="facebook" data-original-title="facebook" href="#"></a></li>#}
                {#<li><a class="twitter" data-original-title="twitter" href="#"></a></li>#}
                {#<li><a class="googleplus" data-original-title="googleplus" href="#"></a></li>#}
                {#<li><a class="evernote" data-original-title="evernote" href="#"></a></li>#}
                {#<li><a class="tumblr" data-original-title="tumblr" href="#"></a></li>#}
                <script type="text/javascript" src="//yastatic.net/share/share.js" charset="utf-8"></script><div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="small" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,moimir,gplus" data-yashareTheme="counter"></div>            </ul>
        </div>

        <div class="product-page-content">
            <ul id="myTab" class="nav nav-tabs">

                <li {% if item.ServiceItemVideos|length > 0 %} class="active" {% endif %}>
                    <a href="#Video" data-toggle="tab">Видео({{ item.ServiceItemVideos|length }})</a>
                </li>
                <li  {% if item.ServiceItemVideos|length == 0 %} class="active" {% endif %}>
                    <a href="#Reviews" data-toggle="tab" id="review-click">Комментарии ({{ item.ServiceItemComments|length }})</a>
                </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in {% if item.ServiceItemVideos|length > 0 %} active {% endif %}" id="Video" style="padding: 15px 0;">
                    {%  for video in item.ServiceItemVideos %}
                        <iframe width="100%" height="{{ video.height }}" src="{{ video.youtube_src }}" frameborder="0" allowfullscreen></iframe>
                    {% endfor %}
                </div>
                <div class="tab-pane fade in {% if item.ServiceItemVideos|length == 0 %}active {% endif %}" id="Reviews">
                    <!--<p>There are no reviews for this product.</p>-->
                    {%  for comment in item.ServiceItemComments %}
                    <div class="review-item clearfix">
                        <div class="review-item-submitted">
                            <strong>{{ display_when(comment.date_comment) }}</strong>
                            <em>{{ comment.user_name }}</em>
                            <div class="rateit" data-rateit-value="5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>
                        <div class="review-item-content">
                            <p>{{ comment.comment }}</p>
                        </div>
                    </div>
                    {% endfor %}
                    <!-- BEGIN FORM-->
                    <form data-action="/comment/add/{{ item.id }}" class="reviews-form" role="form" method="post"
                          id="comment-form" onsubmit="saveComment()" action="javascript:void(0)">
                        <h2>Написать комментарий</h2>
                        <div class="form-group">
                            <label for="name">Имя <span class="require">*</span></label>
                            <input type="text" class="form-control" id="name" required="true" name="user_name" />
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" />
                        </div>
                        <div class="form-group">
                            <label for="review">Ваш комментарий <span class="require">*</span></label>
                            <textarea class="form-control" rows="8" id="review" required="true" name="comment"></textarea>
                        </div>

                        <div class="padding-top-20">
                            <button type="submit" class="btn btn-primary">Отправить</button>
                        </div>
                    </form>
                    <!-- END FORM-->
                </div>
            </div>
        </div>

        <!--        <div class="sticker sticker-sale"></div>-->
    </div>
</div>
<script>
    function clickZoom (that) {
        var img = $(that).find("img").clone();
        $("div.product-main-image").html(img);
        $('.product-main-image').zoom({url: $(img).attr('data-BigImgSrc')});
    }

    function displayContact (serviceItemId) {
        $.post("/service-item/getServiceItem/"+serviceItemId, {}, function (data) {
            $("#show-contact").fadeOut();
            var phone = data.serviceItem.phone,
                email = data.serviceItem.email;
            if(phone) {
                $( "<h5><i class='fa fa-phone'></i> "+phone+"</h5>" ).insertAfter("#show-contact");
            }
            if(email) {
                $( "<h5><i class='fa fa-envelope-o'></i> "+email+"</h5>" ).insertAfter("#show-contact");
            }
            if (!email && !phone) {
                $( "<p>Пользователь не указал свои контакты</p>" ).insertAfter("#show-contact");
            }
        })
    }

    function writeComment() {
        $("#Reviews").trigger("click");
    }

    function saveComment () {
        var $form = $("form#comment-form");
        var params = $form.serialize();
        $.ajax({
            type: "POST",
            url: $form.attr("data-action"),
            data: params,
            success: function (data) {
                if(data && !data.error) {
                    alert("Коментарий успешно добавлен, сейчас страница будет перезагружена...");
                    location.reload();
                }
            }
        });
    }
</script>
