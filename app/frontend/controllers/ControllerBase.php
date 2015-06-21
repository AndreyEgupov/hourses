<?

namespace Multiple\Frontend\Controllers;
use AbstractModels\AbstractAttributes;
use Breadcrumbs;
use Cart;
use Categories;
use CategoryMenu;
use Cities;
use Config;
use Currency;
use Menu;
use MenuHelper;
use Meta;
use Order;
use Paginator;
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
            array(
                "order" => "position"
            )
        ));

       // $this->view->adminUserId = Config::findFirst("name = 'admin-user-id'")->value;
        $this->setConfig();
        $this->setMetaDefault();

        $this->initLeftCatalog();
        $this->setCurrency();
        $this->setCart();
    }

    private function setConfig() {
        $configs = Config::find();
        foreach ($configs as $config) {
            $this->view->setVar($config->name, $config->value);
        }
    }

    private function setSessionVars  () {
        $request = new Request();

        if($request->get("countInPage")) {
            $this->session->set("countInPage", $request->get("countInPage"));
        } else if(!$this->session->get("countInPage")) {
            $this->session->set("countInPage", ControllerBase::COUNT_ITEMS_VIEW);
        }

        if($request->get("sortType")) {
            $this->session->set("sortType", $request->get("sortType"));
        } else if(!$this->session->get("sortType")) {
            $this->session->set("sortType", Order::TYPE_DEFAULT);
        }

        $this->view->setVar("countInPage", $this->session->get("countInPage"));
        $this->view->setVar("sortType", $this->session->get("sortType"));

        $this->view->setVar('currency', "₽");
        $this->view->setVar("p", $request->get("page"));
    }

    private function initLeftCatalog() {
        $categoryList = Categories::find(array(
            "count_products IS NOT NULL",
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

        $order = $this->view->getVar('sortType');

        $productFilters = new ProductFilters($attributes, $categoryId, $prices, $order);
        $productFiltersBase = new ProductFilters(array(), $categoryId, array());

        $this->products = $productFilters->getList();
        $productsMeta = $productFilters->getMeta();
        $productsMetaBase = $productFiltersBase->getMeta();

        //$attributes = $productFilters->getAttributes($attributes, $categoryId, $prices);
        //$attributesGroup = AbstractAttributes::group($attributes);

        $variables = array(
            'minPrice' => $productsMetaBase['min'],
            'maxPrice' => $productsMetaBase['max'],
            'priceOne' => $prices? @$prices['price'][0] : $productsMeta['min'],
            'priceTwo' => $prices? @$prices['price'][1] : $productsMeta['max'],
            //'attributesGroup' => $attributesGroup,
            //'attributesRequest' => $attributes
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
                "limit"=> $this->view->getVar('countInPage'),
                "page" => $currentPage? $currentPage : 1
            )
        );
        $page = new Paginator($paginator->getPaginate());
        $this->view->setVar('page', $page);
    }

    private function setCurrency () {
        if($this->request->get("currency")) {
            $currency = Currency::findFirst($this->request->get("currency"));
            $this->session->set("currencyObj", $currency);
        } else if(!$this->session->get("currencyObj")) {
            $this->session->set("currencyObj", Currency::findFirst());
        }

        $this->view->setVar("currencyObj", $this->session->get("currencyObj"));
        $this->view->setVar("currencies", Currency::find());
    }

    private function setMetaDefault () {
        $url = $this->router->getRewriteUri();
        $meta = Meta::findFirst(array(
            'url = :url:',
            'bind' => array(
                "url" => $url
            )
        ));
        $this->view->setVar('meta', $meta);
    }

    protected function setMeta ($title, $description =null, $keywords =null) {
        $this->view->setVar('title', $title);
        if($description) $this->view->setVar('description', $description);
        if($keywords) $this->view->setVar('keywords', $keywords);
    }

    protected function setCart () {

        $cart = $this->session->get('cart');
        if(!$cart) {
            $cart = new Cart();
            $this->session->set('cart', $cart);
        }
        $this->view->setVar('cart', $cart);
    }

}
