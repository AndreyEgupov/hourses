<div class="row list-view-sorting clearfix">
        <div class="panel panel-default">

            <div class="panel-heading"><h3 class="panel-title">Профиль пользователя</h3></div>
            <div class="panel-body">
                {% if errors|length > 0 %}
                    {% for error in errors %}
                        <p class="bg-danger padding20">{{ error }}</p>
                    {% endfor %}
                {% endif %}
                {% if success %}
                    <p class="bg-success padding20">{{ success }}</p>
                {% endif %}
                <form role="form" action="" method="post">
                    <div class="form-body">
                        <div class="form-group">
                            <label >Email</label>
                            <input type="email" class="form-control" value="{{ user.email }}" disabled />
                        </div>
                    </div>
                    <div class="form-body">
                        <div class="form-group">
                            <label >Пароль *</label>
                            <input type="password" class="form-control" placeholder="Введите новый пароль" name="password"  required="true"/>
                        </div>
                    </div>
                    <div class="form-body">
                        <div class="form-group">
                            <label >Пароль еще раз *</label>
                            <input type="password" class="form-control" placeholder="Введите новый пароль" name="password2" required="true"/>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn blue">Сохранить</button>
                        <button type="button" class="btn default">Отмена</button>
                    </div>
                </form>
            </div>
        </div>
</div>