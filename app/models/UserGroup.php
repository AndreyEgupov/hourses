<?php

class UserGroup extends \Phalcon\Mvc\Model
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
    public function initialize()
    {
        $this->hasMany('id', 'Users', 'user_group_id', array('alias' => 'Users'));
    }

}
