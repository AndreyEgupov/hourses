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

        $sql = "
            SELECT p.*
            FROM Products p
            ORDER BY p.date_update, p.category_id
        ";

        $query  = $this->modelsManager->createQuery($sql);
        $products   = $query->execute();


        $this->products = $products;
    }

}

