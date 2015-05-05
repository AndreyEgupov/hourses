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
    public $icon_class;

    /**
     *
     * @var integer
     */
    public $sort;
    public function initialize()
    {
        $this->hasMany('id', 'Categories', 'parent_id', array('alias' => 'Categories'));
        $this->hasMany('id', 'Products', 'category_id', array('alias' => 'Products'));
        $this->belongsTo('parent_id', 'Categories', 'id', array('alias' => 'CategoriesParent'));
    }

}
