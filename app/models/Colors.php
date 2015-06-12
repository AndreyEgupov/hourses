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
