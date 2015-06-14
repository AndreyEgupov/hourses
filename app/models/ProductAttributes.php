<?php

class ProductAttributes extends \Phalcon\Mvc\Model
{

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

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->belongsTo('product_id', 'Products', 'id', array('alias' => 'Products'));
        $this->belongsTo('attribute_id', 'Attributes', 'id', array('alias' => 'Attributes'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'product_id' => 'product_id', 
            'attribute_id' => 'attribute_id'
        );
    }

}
