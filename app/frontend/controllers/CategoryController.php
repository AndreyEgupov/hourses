<?php
namespace Multiple\Frontend\Controllers;

use Categories;
use Phalcon\Mvc\Model\Query;
use RecommendedArticle;
use ServiceItem;
use Services;
use Slider;

class CategoryController extends ControllerBase {

    public function listAction($categoryId) {
        $category = Categories::findFirst($categoryId);

        $childCategories = Categories::find(array(
            'parent_id = :parentId:',
            'bind' => array(
                'parentId' => $category->id
            )
        ));
        $this->view->setVar('childCategories', $childCategories);

        if($childCategories->count()) {
            $this->view->pick('category/child-list');
        }

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

        $this->products = $products;

        $this->view->setVar('categoryId', $category->id);
        $this->br->add($category->title, "category/list/".$categoryId);
    }

}

