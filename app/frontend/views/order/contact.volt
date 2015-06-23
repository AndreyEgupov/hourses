<div class="columns-container">
    <div id="columns" class="container">
        <div class="row">
            {{ partial("partials/breadcrumb") }}
            <div id="center_column" class="center_column col-sm-12 col-md-12">
                <h1 id="cart_title" class="page-heading">Детали заказа</h1>
                {% if success is defined %}
                    <div class="alert alert-success" role="alert">
                        {{ success }}
                    </div>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                {% else %}
                    <form class="form-horizontal" role="form" method="post">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Всего товаров:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" disabled value=" {{ cart.getTotalCount() }}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">На сумму:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" disabled value="{{ currencyObj.symbol }} {{ getPrice(cart.getTotalPrice(), currencyObj) }}">

                            </div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="phone">Моб. телефон* :</label>
                            <div class="col-sm-7">
                                <input type="number" class="form-control" id="phone" placeholder="Ваш моб. телефон" required="true" name="phone" value="{{ request.get('phone') }}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="name"> Имя:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="name" placeholder="Ваше имя" name="name" value="{{ request.get('name') }}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Email:</label>
                            <div class="col-sm-7">
                                <input type="email" class="form-control" id="email" placeholder="Ваш email" name="email" value="{{ request.get('email') }}">
                                <small>Детали заказа будут отправлены на введенный email</small>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-7">
                                <button type="submit" class="btn btn-success">Отправить заказ</button>
                            </div>
                        </div>
                    </form>
                {% endif %}
            </div>
        </div>
    </div>
</div>