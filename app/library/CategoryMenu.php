<?
class CategoryMenu {
    static public function buildTree(&$data, $rootID = NULL) {
        $tree = array();
        foreach ($data as $id => $node) {
            if ($node['parent_id'] == $rootID) {
                unset($data[$id]);
                $node['childs'] = self::buildTree($data, $node['id']);
                $tree[] = $node;
            }
        }
        return $tree;
    }
}