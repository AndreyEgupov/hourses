<?

namespace Multiple\Admin\Controllers;
use Exception;
use JsonController;
use Phalcon\Paginator\Adapter\Model;

class ControllerBase extends JsonController {

    public function getListAction() {
        $this->setJson();

        $params = array();
        if($order = $this->request->get('sort')) {
            $orderType = $this->request->get('dir');
            $params['order'] = $order . ' '.$orderType;
        }
        $data = call_user_func_array($this->model."::find", $params);

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

    public function getOneAction() {
        $this->setJson();
        $id = $this->request->get('id');

        if (!$id) {
            throw new Exception('Id or lenguage_id is required');
        }
        $data = call_user_func ($this->model."::findFirst", $id);
        return $data->dump();
    }

    public function removeAction($id) {
        $this->setJson();
        if (!isset($id)) {
            throw new Exception('Id is required');
        }
        $data = call_user_func ($this->model."::findFirst", $id);
        return array(
            'success' => $data->delete()
        );
    }

    public function saveAction($id=null) {
        $this->setJson();

        $id = $id ?  $id : $this->request->get('id');

        if (!isset($id)) {
            throw new Exception('Id is required');
        }

        $data = $this->request->getPost();
        unset($data['id']);
        if($id == "new") {
            $item = new $this->model;
            $item->assign($data);
            if (!$item->save()) {
                return array(
                    "success" => false,
                    "errors" => $this->jsonRecursiveGetMsg($item->getMessages()),
                    "data" => $data
                );
            }
        } else {
            $item = call_user_func ($this->model."::findFirst", $id);
            $item->save($data);
        }

        return array(
            "success" => true,
            "errors" => $this->jsonRecursiveGetMsg($item->getMessages()),
            "data" => $data
        );
    }

    /**
     * example condition = 'service_id = 1 AND is_active = 1 '
     * @return array - список
     */
    public function findByAction () {
        $this->setJson();
        $condition = $this->request->get('condition');

        $params = array();
        $params[] = $condition;

        if($order = $this->request->get('sort')) {
            $orderType = $this->request->get('dir');
            $params['order'] = $order . ' '.$orderType;
        }

        $data = call_user_func_array($this->model."::find", array($params));

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
            'data' => $data->toArray(),
            'totalCount' => count($data->toArray()),
        );
    }


    public function initialize() {
        $user = $this->session->get("user");
        if(!$user or $user->user_group_id < 1) {
            $this->response->redirect('/user/login');
        }
    }
}
