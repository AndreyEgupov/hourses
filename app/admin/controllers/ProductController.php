<?php
namespace Multiple\Admin\Controllers;

use Products;
use Phalcon\Paginator\Adapter\Model;

class ProductController extends ControllerBase {
    public $model = Products::class;

    public function getListAction() {
        $this->setJson();
        $params = array();
        if($search = $this->request->get('search')) {
            $params = array(
                'title LIKE :s: OR description LIKE :s: OR price LIKE :s:',
                'bind' => array(
                    's' => '%'.$search.'%'
                )
            );
        }
        if($order = $this->request->get('sort')) {
            $orderType = $this->request->get('dir');
            $params['order'] = $order . ' '.$orderType;
        }
        $data = Products::find($params);

        if($this->request->get('limit') and $this->request->get('page')) {

            $paginator = new Model(
                array(
                    "data" => $data,
                    "limit"=> $this->request->get('limit'),
                    "page" => $this->request->get('page')
                )
            );

            return array(
                'data' => $paginator->getPaginate()->items,
                'totalCount' => count($data),
            );
        }
        return array(
            'data' => $data,
            'totalCount' => count($data),
        );
    }
}

