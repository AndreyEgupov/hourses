<?php

class Slider extends \Phalcon\Mvc\Model
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
    public $content;

    /**
     *
     * @var integer
     */
    public $sort;

    /**
     *
     * @var integer
     */
    public $is_active;

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'title' => 'title', 
            'content' => 'content', 
            'sort' => 'sort', 
            'is_active' => 'is_active'
        );
    }

}
