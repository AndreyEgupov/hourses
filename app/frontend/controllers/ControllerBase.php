<?

namespace Multiple\Frontend\Controllers;
use Categories;
use CategoryMenu;
use Cities;
use Menu;
use Phalcon\Mvc\Controller;

class ControllerBase extends Controller {

    const COUNT_ITEMS_VIEW = 3;
    public $br = null;

    public function initialize() {
        $this->br = new \Breadcrumbs();

        $this->setSessionVars();
        $this->initLeftCategories();

        $this->view->setVar("user", $this->session->get("user"));
        $this->view->setVar("menuList", Menu::find(
            array("order" => "position")
        ));

        $this->view->adminUserId = \Config::findFirst("name = 'admin-user-id'")->value;

        $this->initLeftCatlog();
    }

    private function setSessionVars  () {
        $request = new \Phalcon\Http\Request();

        $countInPage  = $request->get("countInPage");
        if($countInPage) {
            $this->session->set("countInPage", $countInPage);
        } else if(!$this->session->get("countInPage")) {
            $this->session->set("countInPage", ControllerBase::COUNT_ITEMS_VIEW);
        }
        $this->view->setVar("countInPage", $this->session->get("countInPage"));

        $countInPage  = $request->get("sortType");
        if($countInPage) {
            $this->session->set("sortType", $countInPage);
        } else if(!$this->session->get("sortType")) {
            $this->session->set("sortType", \Order::TYPE_DEFAULT);
        }
        $this->view->setVar("sortType", $this->session->get("sortType"));
    }

    private function initLeftCategories() {
        $categoryList = Categories::find()->toArray();
        $categories = CategoryMenu::buildTree($categoryList);

        debug($categories);
    }

    protected $_isJsonResponse = false;

    // Call this func to set json response enabled
    public function setJsonResponse() {
        $this->view->disable();

        $this->_isJsonResponse = true;
        $this->response->setContentType('application/json', 'UTF-8');
    }

    // After route executed event
    public function afterExecuteRoute(\Phalcon\Mvc\Dispatcher $dispatcher) {
        if ($this->_isJsonResponse) {
            $data = $dispatcher->getReturnedValue();
            if (is_array($data)) {
                $data = json_encode($data);
            }
            $this->response->setContent($data);
            $this->response->send();
        }

        $this->view->setVar("br", $this->br->generate()); // added breadcrumb in view
    }

    /**
     * redirect if user is null
     */
    public function checkUser () {
        if(!$this->session->get("user")) {
            $this->response->redirect('/user/login');
        }
    }
}
