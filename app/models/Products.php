<?php

class Products extends \Phalcon\Mvc\Model
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
    public $category_id;

    /**
     *
     * @var string
     */
    public $title;

    /**
     *
     * @var string
     */
    public $price;

    /**
     *
     * @var string
     */
    public $price_old;

    /**
     *
     * @var string
     */
    public $description;

    /**
     *
     * @var string
     */
    public $date_create;

    /**
     *
     * @var string
     */
    public $date_update;

    /**
     *
     * @var integer
     */
    public $is_available;
    public function initialize()
    {
        $this->hasMany('id', 'ProductsAttribute', 'product_id', array('alias' => 'ProductsAttribute'));
        $this->hasMany('id', 'ProductsImage', 'product_id', array('alias' => 'ProductsImage'));
        $this->belongsTo('category_id', 'Categories', 'id', array('alias' => 'Categories'));
    }

}
