<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class Orders extends \Phalcon\Mvc\Model
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
    public $phone;

    /**
     *
     * @var string
     */
    public $email;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var string
     */
    public $total_price;

    /**
     *
     * @var string
     */
    public $datetime;


    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'phone' => 'phone', 
            'email' => 'email', 
            'name' => 'name', 
            'total_price' => 'total_price', 
            'datetime' => 'datetime'
        );
    }

}
