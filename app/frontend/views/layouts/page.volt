<!DOCTYPE HTML>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7 " lang="en"><![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8 ie7" lang="en"><![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9 ie8" lang="en"><![endif]-->
<!--[if gt IE 8]>
<html class="no-js ie9" lang="en"><![endif]-->

<html lang="en">
{{ partial("partials/head") }}
<body id="category" itemscope itemtype="http://schema.org/WebPage"
      class="category category-4 category-automotive-motocrycle hide-right-column lang_en">
    <div id="page">
        {{ partial("partials/header") }}
        {{ partial("partials/menu") }}
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
                    </div>
                    {{ content() }}
                </div>
            </div>
        </div>

        <!-- .columns-container -->
        <!-- Footer -->
        {{ partial("partials/footer") }}
        <!-- #footer -->
    </div>
</body>
</html>