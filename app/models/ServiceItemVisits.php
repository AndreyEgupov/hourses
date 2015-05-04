<?php

class ServiceItemVisits extends \Phalcon\Mvc\Model
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
    public $ip;

    /**
     *
     * @var integer
     */
    public $service_item_id;

    /**
     *
     * @var string
     */
    public $date;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->belongsTo('service_item_id', 'ServiceItem', 'id', array('alias' => 'ServiceItem'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'ip' => 'ip', 
            'service_item_id' => 'service_item_id', 
            'date' => 'date'
        );
    }

}
