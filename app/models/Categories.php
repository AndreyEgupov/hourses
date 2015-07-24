<?php

class Categories extends \Phalcon\Mvc\Model
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
    public $parent_id;

    /**
     *
     * @var string
     */
    public $parent_sort_id;

    /**
     *
     * @var string
     */
    public $title;

    /**
     *
     * @var string
     */
    public $img;

    /**
     *
     * @var string
     */
    public $icon_class;

    /**
     *
     * @var integer
     */
    public $sort;

    /**
     *
     * @var integer
     */
    public $count_products;

    public function initialize()
    {
        $this->hasMany('id', 'Categories', 'parent_id', array('alias' => 'Categories'));
        $this->hasMany('id', 'Products', 'category_id', array('alias' => 'Products'));
        $this->belongsTo('parent_id', 'Categories', 'id', array('alias' => 'CategoriesParent'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'parent_id' => 'parent_id', 
            'parent_sort_id' => 'parent_sort_id', 
            'title' => 'title', 
            'img' => 'img', 
            'icon_class' => 'icon_class', 
            'sort' => 'sort', 
            'count_products' => 'count_products'
        );
    }

}
