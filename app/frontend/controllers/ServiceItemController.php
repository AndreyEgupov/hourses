<?php

namespace Multiple\Frontend\Controllers;
use Config;
use Phalcon\Mvc\View;
use ServiceItem;
use ServiceItemVisits;
use Users;

class ServiceItemController extends ControllerBase
{

    public function listAction($serviceId=null) {
        $cityId = $this->session->get("city_id");
        $serviceItems = ServiceItem::find(array (
            "service_id = $serviceId and is_published=1 AND city_id = $cityId",
            "order" => \Order::getOrderServiceItem($this->session->get("sortType"))
        ));
        $paginator = new \Phalcon\Paginator\Adapter\Model(
            array(
                "data" => $serviceItems,
                "limit"=> $this->session->get("countInPage"),
                "page" => (int) $this->request->get("page"),
            )
        );
        $this->view->page  = $paginator->getPaginate();

        $this->view->setVar("service", \Services::findFirst($serviceId));

        $this->br->add(\Services::findFirst($serviceId)->title, "service-item/list/".$serviceId);
        $this->view->setVar("br", $this->br->generate());
        $this->view->setRenderLevel(View::LEVEL_LAYOUT);
    }

    public function viewAction($id=null) {
        $this->view->item  = ServiceItem::findFirst("id = $id");
        $this->view->setRenderLevel(View::LEVEL_LAYOUT);

        $visit = new ServiceItemVisits();
        $visit->save(array(
            "ip" => $_SERVER['REMOTE_ADDR'],
            "date" => date("Y-m-d H:i:s"),
            "service_item_id" => (int) $id
        ));
    }

    public function getPhotosAction ($serviceItemId) {
        $this->setJsonResponse();

        $data = ServiceItem::findFirst($serviceItemId)->ServiceItemImages->toArray();

        return $data;
    }

    public function deleteAction($serviceItemId) {
        $this->setJsonResponse();

        $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
        $serviceItem = ServiceItem::findFirst($serviceItemId);
        $serviceItem->ServiceItemImages->delete();
        $serviceItem->ServiceItemVideos->delete();
        $serviceItem->ServiceItemComments->delete();
        $serviceItem->delete();


        return array(
            "success" => true
        );
    }

    public function removeFromPlacementAction ($serviceItemId) {
        $this->setJsonResponse();

        $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
        $serviceItem = ServiceItem::findFirst($serviceItemId);
        $serviceItem->is_published = 0;
        $serviceItem->save();

        return array(
            "success" => true
        );
    }

    public function placementAction ($serviceItemId) {
        $this->setJsonResponse();

        $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
        $serviceItem = ServiceItem::findFirst($serviceItemId);

        if($serviceItem->is_vip) {
            $price = Config::findFirst("name = 'price-vip'")->value;
            $user = $this->session->get("user");
            $user = Users::findFirst($user->id);

            $balance = $user->balance;
            if($balance < $price) {
                return array(
                    "success" => false,
                    "msg" => "Что-бы размесить обьявление как VIP необходимо иметь на счету минимум ".$price." руб."
                );
            }

            $user->balance = $balance - $price;
            if ($user->save()) {
                $this->session->set("user", $user);

                $serviceItem->is_published = 1;
                $serviceItem->save();

                return array(
                    "success" => true,
                    "msg" => "Ваше обьявление размещено как vip, с вашего счета было снято ".$price." руб."
                );
            }
        }

        $serviceItem->is_published = 1;
        $serviceItem->save();

        return array(
            "success" => true,
            "msg" => "Ваше обьявение было удачно размещено!."
        );
    }

    public function getServiceItemAction ($serviceItemId) {
        $this->setJsonResponse();

        $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
        $serviceItem = ServiceItem::findFirst($serviceItemId);

        return array(
            "success" => true,
            "serviceItem" => $serviceItem
        );
    }

    public function upAction ($serviceItemId) { // поднятие анкеты
        $this->setJsonResponse();

        $serviceItem = ServiceItem::findFirst($serviceItemId);

        $price = Config::findFirst("name = 'price-up'")->value;
        $user = $this->session->get("user");
        $user = Users::findFirst($user->id);

        $balance = $user->balance;
        if($balance < $price) {
            return array(
                "success" => false,
                "msg" => "Что-бы поднять анкету на первое место, необходимо иметь на счету минимум ".$price." руб."
            );
        }

        $user->balance = $balance - $price;
        if ($user->save()) {
            $this->session->set("user", $user);

            $serviceItem->datePost = date('now');
            $serviceItem->save();

            return array(
                "success" => true,
                "msg" => "Обьявление успешно обновлено!"
            );
        }
    }
}

