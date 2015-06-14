<?

namespace Multiple\Frontend\Controllers;
use Breadcrumbs;
use Categories;
use CategoryMenu;
use Cities;
use Menu;
use MenuHelper;
use Order;
use Phalcon\Http\Request;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;
use ProductFilters;
use Phalcon\Paginator\Adapter\Model;


class ControllerBase extends Controller {

    const COUNT_ITEMS_VIEW = 24;
    public $br = null;

    public $products;
    public $productFilters;

    public function initialize() {
        $this->br = new Breadcrumbs();

        $this->setSessionVars();

        $this->view->setVar("user", $this->session->get("user"));
        $this->view->setVar("menuList", Menu::find(
            array("order" => "position")
        ));

       // $this->view->adminUserId = Config::findFirst("name = 'admin-user-id'")->value;

        $this->initLeftCatalog();
    }

    private function setSessionVars  () {
        $request = new Request();

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
            $this->session->set("sortType", Order::TYPE_DEFAULT);
        }
        $this->view->setVar("sortType", $this->session->get("sortType"));

        $this->view->setVar('currency', "₽");
    }

    private function initLeftCatalog() {
        $categoryList = Categories::find(array(
            "order" => "sort, title "
        ))->toArray();

        $this->view->setVar('categoriesMenu', MenuHelper::formatTree($categoryList, null));
    }

    protected $_isJsonResponse = false;

    // Call this func to set json response enabled
    public function setJsonResponse() {
        $this->view->disable();

        $this->_isJsonResponse = true;
        $this->response->setContentType('application/json', 'UTF-8');
    }

    // After route executed event
    public function afterExecuteRoute(Dispatcher $dispatcher) {
        if ($this->_isJsonResponse) {
            $data = $dispatcher->getReturnedValue();
            if (is_array($data)) {
                $data = json_encode($data);
            }
            $this->response->setContent($data);
            $this->response->send();
        }

        $this->view->setVar("br", $this->br->generate()); // added breadcrumb in view

        $this->initFilter ();
    }

    /**
     * redirect if user is null
     */
    public function checkUser () {
        if(!$this->session->get("user")) {
            $this->response->redirect('/user/login');
        }
    }

    public function initFilter () {
        $categoryId = $this->view->getVar('categoryId');

        $attributes = $this->request->get('attribute');
        $attributes = $attributes? $attributes : array();

        $prices = $this->request->get('prices');
        $prices = $prices? array('price' => array(@$prices[0], @$prices[1])) : array();

        $productFilters = new ProductFilters($attributes, $categoryId, $prices);
        $productFiltersBase = new ProductFilters(array(), $categoryId, array());

        $this->products = $productFilters->getList();
        $productsMeta = $productFilters->getMeta();
        $productsMetaBase = $productFiltersBase->getMeta();

        $attributes = $productFilters->getAttributes();

        $variables = array(
            'minPrice' => $productsMetaBase['min'],
            'maxPrice' => $productsMetaBase['max'],
            'priceOne' => $prices? @$prices['price'][0] : $productsMeta['min'],
            'priceTwo' => $prices? @$prices['price'][1] : $productsMeta['max'],
            'attributes' => $attributes
        );

        $this->view->setVars($variables);

        $this->initProducts();
    }

    private function initProducts () {
        if(!$this->products) {return;}

        $currentPage = (int) @$_GET["page"];
        $paginator = new Model(
            array(
                "data" => $this->products,
                "limit"=> ControllerBase::COUNT_ITEMS_VIEW,
                "page" => $currentPage? $currentPage : 1
            )
        );
        $page = $paginator->getPaginate();
        $this->view->setVar('page', $page);
    }
}
