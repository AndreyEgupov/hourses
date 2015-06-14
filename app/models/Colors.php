<?php

class Colors extends \Phalcon\Mvc\Model
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
    public $attribute_id;

    /**
     *
     * @var string
     */
    public $hash;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->belongsTo('attribute_id', 'Attributes', 'id', array('alias' => 'Attributes'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'attribute_id' => 'attribute_id', 
            'hash' => 'hash'
        );
    }

}
