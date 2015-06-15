<?

use Phalcon\Di;
use Phalcon\Mvc\Model\Query\Builder;

class ProductFilters {
    private $model = Products::class;
    private $builder = null;

    function __construct(array $attrIdList = array(), $categoryId=null, array $filterParams=array(), $order=null) {
        $this->builder($attrIdList, $categoryId, $filterParams, $order);
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
     * @param array $attrIdList
     * @param null $categoryId
     * @param array $filterParams
     * @return \Phalcon\Mvc\Model\Resultset\Simple
     */
    public function getAttributes (array $attrIdList = array(), $categoryId=null, array $filterParams=array()) {
        $builder = new Builder(array('models' => array('Products')));
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

    public function builder (array $attrIdList = array(), $categoryId=null, array $filterParams=array(), $order=null) {
        $builder = new Builder(array('models' => array('Products')));

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

        $this->builder = $builder;
        return $this;
    }

}