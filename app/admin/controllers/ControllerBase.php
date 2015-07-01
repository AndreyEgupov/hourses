<?

namespace Multiple\Admin\Controllers;
use Exception;
use JsonController;

class ControllerBase extends JsonController {

    public function getListAction() {
        $this->setJson();
        $data = call_user_func ($this->model."::find");
        return array(
            'data' => $data->toArray(),
            'totalCount' => count($data->toArray()),
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

    public function initialize() {
        $user = $this->session->get("user");
        if(!$user or $user->user_group_id < 1) {
            $this->response->redirect('/user/login');
        }
    }
}
