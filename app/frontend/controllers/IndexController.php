<?php
namespace Multiple\Frontend\Controllers;

use RecommendedArticle;
use ServiceItem;
use Services;
use Slider;
use Phalcon\Mvc\Model\Query;
use Phalcon\Paginator\Adapter\Model;

class IndexController extends ControllerBase
{
    public function indexAction() {
        $currentPage = (int) @$_GET["page"];

        $sql = "
            SELECT p.*
            FROM Products p
            ORDER BY p.date_update, p.category_id
        ";

        $query  = $this->modelsManager->createQuery($sql);
        $products   = $query->execute();
        $paginator = new Model(
            array(
                "data" => $products,
                "limit"=> ControllerBase::COUNT_ITEMS_VIEW,
                "page" => $currentPage? $currentPage : 1
            )
        );
        $page = $paginator->getPaginate();

        $this->view->setVar('product', $page);

        //$this->br->add($category->title, "category/list/".$categoryId);
    }

}

