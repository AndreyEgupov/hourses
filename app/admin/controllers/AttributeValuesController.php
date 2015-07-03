<?php
namespace Multiple\Admin\Controllers;

use Attributes;
use ProductAttributes;

class AttributeValuesController extends ControllerBase {
    public $model = Attributes::class;

    public function findAction () {
        $this->setJson();
        $search = $this->request->get('value');
        $type = $this->request->get('type');
        $attributeNameId = $this->request->get('attribute_name_id');

        $data = Attributes::find(array(
            $type . ' LIKE :val: AND attribute_name_id = :attributeNameId:',
            'bind' => array(
                'val' => '%' . $search . '%',
                'attributeNameId' => $attributeNameId
            ),
            'order' => $type
        ));

        $array = array();
        foreach($data as $obj) {
            $array[] = array(
                'id' => $obj->id,
                'value' => $obj->$type
            );
        }

        return array(
            'data' => $array,
            'totalCount' => count($data),
        );
    }

    public function saveAction ($id=null) {
        $this->setJson();

        $value = trim($this->request->get('value'));
        $type = trim($this->request->get('type'));

        $id = $this->request->get('product_attribute_id'); // delete this || or 'new'
        $productId = $this->request->get('product_id');
        $attributeNameId = $this->request->get('attribute_name_id');
        $hash = md5($value . preg_replace("/^([a-zA-Z]+)_$/", "$1", $type));

        if($id != 'new') {
            $data = ProductAttributes::findFirst($id);
            $data->delete();
        }
        $attribute = Attributes::findFirst(array(
            'attribute_name_id = :attributeNameId: AND ' . $type . ' LIKE :val:',
            'bind' => array(
                'val' => $value,
                'attributeNameId' => $attributeNameId
            )
        ));

        if(!$attribute) {
            $attribute = new Attributes();
            $model = array(
                'attribute_name_id' => $attributeNameId,
                $type => $value,
                'hash' => $hash
            );
            $attribute->save($model);
        }

        $productAttribute = new ProductAttributes();
        $productAttribute->save(array(
           'product_id' => $productId,
            'attribute_id' => $attribute->id
        ));

        return array(
            "success" => true,
            "errors" => $this->jsonRecursiveGetMsg($productAttribute->getMessages()),
            "data" => $productAttribute
        );
    }
}

