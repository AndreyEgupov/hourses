<?

use Phalcon\Di;
use Phalcon\Mvc\Model\Query\Builder;

class ProductFilters {
    private $model = Products::class;
    private $builder = null;

    function __construct(array $filters, array $attrIdList = array(), $categoryId=null, array $filterParams=array(), $order=null, $search=null) {
        $this->builder($filters, $attrIdList, $categoryId, $filterParams, $order, $search);
    }

    /**
     * @return Phalcon\Mvc\Model\Query\Builder
     */
    public function getBuilder () {
        return $this->builder;
    }

    public function getList () {
        return $this->getBuilder()->getQuery()->execute();
    }

    public function getMeta () {
        $this->builder->columns('MIN(Products.price) as min, MAX(Products.price) as max');
        $this->builder->groupBy(null);

        return $this->getBuilder()->getQuery()->execute()->getFirst();
    }

    /**
     * @param array $filters
     * @param array $attrIdList
     * @param null $categoryId
     * @param array $filterParams
     * @return \Phalcon\Mvc\Model\Resultset\Simple
     */
    public function getAttributes (array $filters, array $attrIdList = array(), $categoryId=null, array $filterParams=array()) {
        $builder = new Builder(array('models' => array('Products')));

        if($filters['sales']) {
            $builder->andWhere('Products.price_old IS NOT NULL');
        }

        if($filters['instock']) {
            $builder->andWhere('Products.is_available = 1');
        }

        if($filters['novelty']) {
            $builder->andWhere('Products.date_create > :date:', array('date' => date('Y-m-d H:i:s', time()- (86400 * 14))));
        }


        if($attrIdList) {
            $builder->inWhere('pa.attribute_id', $attrIdList);
        }
        if($categoryId) {
            $category = Categories::findFirst($categoryId);
            $builder->innerJoin(Categories::class, 'c.id = Products.category_id', 'c');
            $builder->AndWhere('c.parent_sort_id LIKE :categoryParentSortId:', array('categoryParentSortId'=>$category->parent_sort_id."%"));
        }
        if($filterParams) {
            foreach($filterParams as $column => $values) {
                if(is_array($values) and count($values) == 2) {
                    $builder->andWhere($this->model.".".$column." BETWEEN :val1: AND :val2:", array('val1'=>$values[0], 'val2' => $values[1]));
                } else {
                    $builder->andWhere($this->model.".".$column." = :val:", array('val' => $values));
                }
            }
        }
        $builder->innerJoin(ProductAttributes::class, 'pa.product_id = Products.id', 'pa');
        $builder->innerJoin(Attributes::class, 'a.id = pa.attribute_id', 'a');
        $builder->groupBy('a.id');
        $builder->columns(
            'a.id, a.attribute_name_id, '.
            'IF(a.text_ is not null, a.text_, IF(a.boolean_ is not null, a.boolean_, IF(a.int_ is not null, a.int_, IF(a.varchar_ is not null, a.varchar_, IF(a.date_ is not null, a.date_, a.datetime_))))) as val'
        );

        $attributes = $builder->getQuery()->execute();
        return  $attributes;
    }

    public function builder (array $filters, array $attrIdList = array(), $categoryId=null, array $filterParams=array(), $order=null, $search = null) {
        $builder = new Builder(array('models' => array('Products')));
        if($filters['sales']) {
            $builder->andWhere('Products.price_old IS NOT NULL');
        }

        if($filters['instock']) {
            $builder->andWhere('Products.is_available = 1');
        }

        if($filters['novelty']) {
            $builder->andWhere('Products.date_create > :date:', array('date' => date('Y-m-d H:i:s', time()- (86400 * 14))));
        }

        if($attrIdList) {
            $builder->groupBy($this->model.".id");
            $builder->innerJoin(ProductAttributes::class, 'pa.product_id = Products.id', 'pa');
            $builder->inWhere('pa.attribute_id', $attrIdList);
        }
        if($categoryId) {
            $category = Categories::findFirst($categoryId);
            $builder->innerJoin(Categories::class, 'c.id = Products.category_id', 'c');
            $builder->AndWhere('c.parent_sort_id LIKE :categoryParentSortId:', array('categoryParentSortId'=>$category->parent_sort_id."%"));
        }
        if($filterParams) {
            foreach($filterParams as $column => $values) {
                if(is_array($values) and count($values) == 2) {
                    $builder->andWhere($this->model.".".$column." BETWEEN :val1: AND :val2:", array('val1'=>$values[0], 'val2' => $values[1]));
                } else {
                    $builder->andWhere($this->model.".".$column." = :val:", array('val' => $values));
                }
            }
        }
        if($order) {
            $builder->orderBy(Order::getOrderServiceItem($order));
        }
        if($search) {
            $builder->andWhere("Products.title LIKE :s: OR Products.description LIKE :s:", array("s"=>'%'.$search.'%'));
        }

        $this->builder = $builder;
        return $this;
    }

}