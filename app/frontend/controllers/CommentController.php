<?php

namespace Multiple\Frontend\Controllers;
use Phalcon\Mvc\View;
use ServiceItem;

class CommentController extends ControllerBase
{
    public function addAction ($serviceItemId) {
        $this->setJsonResponse();

        $comment = new \ServiceItemComments();
        $result = $comment->save(array(
            "service_item_id" => (int)$serviceItemId,
            "email" => $this->request->get('email'),
            "user_name" => $this->request->get('user_name'),
            "comment" => $this->request->get('comment'),
            "date_comment" => date("Y-m-d H:i:s")
        ));

        if($result) {
            return array(
                "success" => true,
                "Комментарий успешно добавлен"
            );
        }

        $errors = array();
        foreach($comment->getMessages() as $m) {
            $errors[] = $m->getMessage();
        }

        return array(
            "success" => true,
            "errors" => $errors,
            'serviceItemId' => $serviceItemId
        );
    }

}

