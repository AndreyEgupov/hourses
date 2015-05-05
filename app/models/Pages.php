<?php

class Pages extends \Phalcon\Mvc\Model
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
    public $description;

    /**
     *
     * @var string
     */
    public $meta_keywords;

    /**
     *
     * @var string
     */
    public $meta_description;

    /**
     *
     * @var integer
     */
    public $is_active;

}
