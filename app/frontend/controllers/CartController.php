<?php
namespace Multiple\Frontend\Controllers;

use Categories;
use Phalcon\Exception;
use Phalcon\Mvc\Model\Query;
use Products;
use RecommendedArticle;
use ServiceItem;
use Services;
use Slider;
use Phalcon\Mvc\View;

class CartController extends ControllerBase {

    public function addAction($productId, $count) {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        $cart = $this->session->get('cart');

        $product = Products::findFirst($productId);
        if(!$product) {
            throw new Exception("В магазине не найден такой продукт");
        }
        $cart->add($product, $count);

        $this->view->setVar('product', $product);
        $this->view->setVar('count', $count);
        $this->view->setVar('cart', $cart);

    }

    public function updateAction() {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);

    }

    public function editCountAction ($productId, $count) {
        $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
        $cart = $this->session->get('cart');
        foreach($cart->getProducts() as $key => $product) {
            if($product['id'] == $productId) {
                $cart->products[$key]['count'] = $count;
            }
        }
        $this->session->set('cart', $cart);
    }

    public function deleteAction ($productId) {
        $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
        $cart = $this->session->get('cart');
        $cart->removeById($productId);

        $this->session->set('cart', $cart);
    }
}

