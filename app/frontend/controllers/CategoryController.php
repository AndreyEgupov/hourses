<?php
namespace Multiple\Frontend\Controllers;

use Categories;
use Phalcon\Mvc\Model\Query;
use Phalcon\Paginator\Adapter\Model;
use RecommendedArticle;
use ServiceItem;
use Services;
use Slider;

class CategoryController extends ControllerBase {

    public function listAction($categoryId) {
        $currentPage = (int) @$_GET["page"];

        $category = Categories::findFirst($categoryId);
        $sql = "
            SELECT p.*
            FROM Products p
            INNER JOIN Categories c ON c.id = p.category_id
            WHERE c.parent_sort_id LIKE :parentSortId:
            GROUP BY p.id
            ORDER BY p.date_update, p.category_id
        ";

        $query  = $this->modelsManager->createQuery($sql);
        $products   = $query->execute(array(
            'parentSortId' => $category->parent_sort_id."%"
        ));
        $paginator = new Model(
            array(
                "data" => $products,
                "limit"=> ControllerBase::COUNT_ITEMS_VIEW,
                "page" => $currentPage? $currentPage : 1
            )
        );
        $page = $paginator->getPaginate();

        $this->view->setVar('product', $page);

        $this->br->add($category->title, "category/list/".$categoryId);
    }

}

