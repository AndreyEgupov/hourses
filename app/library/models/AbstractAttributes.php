<?
namespace AbstractModels;

use Attributes;
use Phalcon\Mvc\Model\Resultset\Simple;

class AbstractAttributes extends Attributes {

    public $id;
    public $attribute_name_id;
    public $val;

    static public function compare ($a, $b) {
        if ($a->val < $b->val) return -1;
        else if($a->val == $b->val) return 0;
        else return 1;
    }

    static public function group(Simple $dataList) {
        $list = array();
        foreach($dataList as $data) {
            if (empty($list[$data->attribute_name_id])) {
                $list[$data->attribute_name_id] = array();
            }
            $list[$data->attribute_name_id][] = $data;
        }

        return self::sort($list);
    }

    static public function sort(array $groupList) {
        foreach($groupList as $key => $dataList) {
            usort($dataList, function($a, $b) {
                if ($a->val < $b->val) return -1;
                else if($a->val == $b->val) return 0;
                else return 1;
            });
            $groupList[$key] = $dataList;
        }
        return $groupList;
    }
}
