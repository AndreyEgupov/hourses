<?php
namespace Multiple\Frontend\Controllers;

use Categories;
use Orders;
use Phalcon\Exception;
use Phalcon\Mvc\Model\Query;
use Products;
use RecommendedArticle;
use ServiceItem;
use Services;
use Slider;
use Phalcon\Mvc\View;

class OrderController extends ControllerBase {

    public function indexAction() {

    }

    public function contactAction () {
        $cart = $this->session->get('cart');

        if($cart->getTotalCount()  == 0) {
            $this->response->redirect("/");
        }

        if($this->request->isPost()) {
            $phone = $this->request->get('phone');
            $email = $this->request->get('email');
            $name = $this->request->get('name');

            if($email) {
                $this->appEmails [] = $email;
            }

            $mail = $this->getDI()->get('mail');
            $mail->send($this->appEmails, 'Заказ товаров ', 'order', array(
                'email' => $email,
                'phone' => $phone,
                'name' => $name,
                'datetime' => date("Y-m-d H:i:s")
            ));

            $order = new Orders();
            $order->assign(array(
                'phone' => $phone,
                'email' => $email,
                'name' => $name,
                'total_price' => $cart->getTotalPrice(),
                'datetime' => date("Y-m-d H:i:s")
            ));

            $order->save();

            // очищаем корзину
            $cart->removeAll();
            $this->session->set('cart', $cart);
            $this->view->setVar('cart', $cart);

            $this->view->setVar('success', 'Ваш тоар успешно отправлен на обработку, наши менеджеры свяжуться с вами в ближайщее время!');
        }

        $this->view->setVar('request', $this->request);
    }

    public function successAction () {

    }

}

