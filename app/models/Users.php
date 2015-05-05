<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class Users extends \Phalcon\Mvc\Model
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
    public $email;

    /**
     *
     * @var string
     */
    public $password;

    /**
     *
     * @var string
     */
    public $phone;

    /**
     *
     * @var integer
     */
    public $status_id;

    /**
     *
     * @var string
     */
    public $code_validate;

    /**
     *
     * @var integer
     */
    public $user_group_id;

    /**
     *
     * @var integer
     */
    public $balance;

    /**
     *
     * @var integer
     */
    public $tariff_plan_id;

    /**
     *
     * @var integer
     */
    public $binding_ip;

    /**
     *
     * @var string
     */
    public $date_register;

    /**
     *
     * @var integer
     */
    public $is_new;

    /**
     *
     * @var integer
     */
    public $newsletter;
    public function validation()
    {

        $this->validate(
            new Email(
                array(
                    'field'    => 'email',
                    'required' => true,
                )
            )
        );
        if ($this->validationHasFailed() == true) {
            return false;
        }
    }
    public function initialize()
    {
        $this->belongsTo('user_group_id', 'User_group', 'id', array('alias' => 'User_group'));
    }

}
