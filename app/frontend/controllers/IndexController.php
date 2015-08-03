<?php
namespace Multiple\Frontend\Controllers;

use RecommendedArticle;
use ServiceItem;
use Services;
use Slider;
use Phalcon\Mvc\Model\Query;

use CategoryMenu;
use Cities;

use Paginator;
use Phalcon\Http\Request;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Paginator\Adapter\Model;

class IndexController extends ControllerBase
{
    public function indexAction() {
        if($_GET == array()) {
            $this->view->setVar('sliderList', Slider::find('is_active=1'));
        }
    }
}

