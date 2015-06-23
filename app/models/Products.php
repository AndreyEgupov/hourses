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

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('id', 'ProductAttributes', 'product_id', array('alias' => 'ProductAttributes'));
        $this->hasMany('id', 'ProductsImage', 'product_id', array('alias' => 'ProductsImage'));
        $this->belongsTo('param_id', 'Params', 'id', array('alias' => 'Params'));
        $this->belongsTo('site_id', 'Sites', 'id', array('alias' => 'Sites'));
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

    public function getFirstImage () {
        $images = $this->ProductsImage;
        if(!$images->getFirst()) {
            $img = new ProductsImage();
            $img->src = '/img/notpic.jpg';
            return $img;
        };
        return $images->getFirst();
    }

    public function getUniqueAttributes () {
        $productAttributes = $this->ProductAttributes;
        $attributeNames = array();
        foreach ($productAttributes as $productAttribute) {
            $attribute = $productAttribute->Attribute;
            $attributeName = $attribute->AttributeName;
            $attributeNames[$attributeName->id] [] = $attribute;
        }

        return $attributeNames;
    }
}
