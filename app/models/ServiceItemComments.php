<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class ServiceItemComments extends \Phalcon\Mvc\Model
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
    public $service_item_id;

    /**
     *
     * @var string
     */
    public $user_name;

    /**
     *
     * @var string
     */
    public $email;

    /**
     *
     * @var string
     */
    public $comment;

    /**
     *
     * @var string
     */
    public $date_comment;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->belongsTo('service_item_id', 'ServiceItem', 'id', array('alias' => 'ServiceItem'));
    }

}
