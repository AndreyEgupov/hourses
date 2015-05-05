<?php

class ProductsImage extends \Phalcon\Mvc\Model
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
     * @var string
     */
    public $src;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->belongsTo('product_id', 'Products', 'id', array('alias' => 'Products'));
    }

}
