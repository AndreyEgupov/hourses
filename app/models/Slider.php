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
    public $img_src;

    /**
     *
     * @var string
     */
    public $url;

    /**
     *
     * @var integer
     */
    public $sort;

    /**
     *
     * @var string
     */
    public $text;

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
            'img_src' => 'img_src', 
            'url' => 'url', 
            'sort' => 'sort', 
            'text' => 'text', 
            'is_active' => 'is_active'
        );
    }

}
