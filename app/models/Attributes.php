<?php

class Attributes extends \Phalcon\Mvc\Model
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
    public $attribute_name_id;

    /**
     *
     * @var string
     */
    public $text_;

    /**
     *
     * @var integer
     */
    public $int_;

    /**
     *
     * @var string
     */
    public $double_;

    /**
     *
     * @var integer
     */
    public $boolean_;

    /**
     *
     * @var string
     */
    public $date_;

    /**
     *
     * @var string
     */
    public $datetime_;

    /**
     *
     * @var string
     */
    public $varchar_;

    /**
     *
     * @var string
     */
    public $img_;

    /**
     *
     * @var string
     */
    public $hash;

    /**
     *
     * @var integer
     */
    public $id_sync;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('id', 'Colors', 'attribute_id', array('alias' => 'Color'));
        $this->hasMany('id', 'ProductAttributes', 'attribute_id', array('alias' => 'ProductAttributes'));
        $this->belongsTo('attribute_name_id', 'AttributeNames', 'id', array('alias' => 'AttributeName'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'attribute_name_id' => 'attribute_name_id', 
            'text_' => 'text_', 
            'int_' => 'int_', 
            'double_' => 'double_', 
            'boolean_' => 'boolean_', 
            'date_' => 'date_', 
            'datetime_' => 'datetime_', 
            'varchar_' => 'varchar_', 
            'img_' => 'img_', 
            'hash' => 'hash', 
            'id_sync' => 'id_sync'
        );
    }

    public function getVal () {
        if($this->text_) {return $this->text_;}
        if($this->int_) {return $this->int_;}
        if($this->double_) {return $this->double_;}
        if($this->boolean_) {return $this->boolean_;}
        if($this->date_) {return $this->date_;}
        if($this->datetime_) {return $this->datetime_;}
        if($this->varchar_) {return $this->varchar_;}
        if($this->img_) {return $this->img_;}
    }

}
