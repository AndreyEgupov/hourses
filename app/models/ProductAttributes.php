<?php

class ProductAttributes extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var integer
     */
    public $product_id;

    /**
     *
     * @var integer
     */
    public $attribute_id;
    public function initialize()
    {
        $this->belongsTo('product_id', 'Products', 'id', array('alias' => 'Product'));
        $this->belongsTo('attribute_id', 'Attributes', 'id', array('alias' => 'Attribute'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'product_id' => 'product_id', 
            'attribute_id' => 'attribute_id'
        );
    }

}
