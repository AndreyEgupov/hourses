<?php
namespace Multiple\Frontend\Controllers;

use RecommendedArticle;
use ServiceItem;
use Services;
use Slider;
use Phalcon\Mvc\Model\Query;

class IndexController extends ControllerBase
{
    public function indexAction() {

        $this->view->setVar('sliderList', Slider::find('is_active=1'));
    }

}

