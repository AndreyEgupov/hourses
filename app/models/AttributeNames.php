<?php

class AttributeNames extends \Phalcon\Mvc\Model
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
     * @var integer
     */
    public $id_sync;

    /**
     *
     * @var string
     */
    public $type;

    /**
     *
     * @var integer
     */
    public $is_visible;
    public function initialize()
    {
        $this->hasMany('id', 'Attributes', 'attribute_name_id', array('alias' => 'Attributes'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'title' => 'title', 
            'id_sync' => 'id_sync', 
            'type' => 'type', 
            'is_visible' => 'is_visible'
        );
    }

}
