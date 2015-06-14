<?php
namespace Multiple\Frontend\Controllers;

use Phalcon\Exception;
use Phalcon\Mvc\View;

class ProductController extends ControllerBase
{
    public function viewAction($productId) {
        $this->view->setRenderLevel(View::LEVEL_LAYOUT);
        $product = \Products::findFirst($productId);
        if(!$product) {
            throw new Exception("Product not found");
        }
        $this->view->setVar('product', $product);

        $category = $product->Categories;


        $similarProducts = \Products::find(array(
            "category_id = :categoryId:",
            "bind" => array("categoryId" => $category->id),
            "limit" => 10
        ));
        $this->view->setVar('similarProducts', $similarProducts);

        $this->br->add($category->title, 'category/list/'.$category->id);
        $this->br->add($product->title);
    }

}

