<?php

class Currency extends \Phalcon\Mvc\Model
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
    public $symbol;

    /**
     *
     * @var string
     */
    public $relation;

    /**
     *
     * @var string
     */
    public $alias;

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'title' => 'title', 
            'symbol' => 'symbol', 
            'relation' => 'relation',
            'alias' => 'alias'
        );
    }

}
