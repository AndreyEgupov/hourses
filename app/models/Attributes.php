<?php

class Attributes extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $title;

    /**
     *
     * @var string
     */
    public $alias;

    /**
     *
     * @var string
     */
    public $type;
    public function initialize()
    {
        $this->hasMany('id', 'Products_attribute', 'attribute_id', array('alias' => 'Products_attribute'));
    }

}
