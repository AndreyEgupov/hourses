<div class="columns-container">
    <div id="columns" class="container">
        <div class="row">
            {{ partial("partials/breadcrumb") }}
            <div id="left_column" class="column col-sm-4 col-md-3">
                {{ partial("partials/categories-left") }}
                <div class="hotcate-wrap">
                    <div class="container">
                        <div class="row">
                        </div>
                    </div>
                </div>
                {{ partial("partials/filter") }}
            </div>
            {{ partial("partials/product-list") }}
        </div>
    </div>
</div>