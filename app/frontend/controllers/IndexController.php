<?php
namespace Multiple\Frontend\Controllers;

use RecommendedArticle;
use ServiceItem;
use Services;
use Slider;

class IndexController extends ControllerBase
{

    public function indexAction() {
        $this->view->services = Services::find("is_index_page=1");
        $this->view->setVar("recommendedArticles", RecommendedArticle::find("is_active = 1"));

        $this->view->setVar("topProducts", ServiceItem::find(array( // топ предложений на главной
            "is_top=1 AND is_published=1 AND city_id = :cityId:",
            "bind" => array(
                "cityId" => $this->session->get("city_id")
            )
        )));

        $this->view->setVar("sliderDivs", Slider::find(array( // slider
            "is_active=1",
            "order" => "sort, id DESC"
        )));
    }

}

