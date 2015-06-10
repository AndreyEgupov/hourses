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

    /**
     *
     * @var integer
     */
    public $id_sync;
    public function initialize()
    {
        $this->hasMany('id', 'ProductsAttribute', 'product_id', array('alias' => 'ProductsAttribute'));
        $this->hasMany('id', 'ProductsImage', 'product_id', array('alias' => 'ProductsImage'));
        $this->belongsTo('category_id', 'Categories', 'id', array('alias' => 'Categories'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'category_id' => 'category_id', 
            'title' => 'title', 
            'price' => 'price', 
            'price_old' => 'price_old', 
            'description' => 'description', 
            'date_create' => 'date_create', 
            'date_update' => 'date_update', 
            'is_available' => 'is_available', 
            'id_sync' => 'id_sync'
        );
    }

}
