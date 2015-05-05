<?
class MenuHelper {

    static public $categoryUrl = "/category/list/";

    /**
     * Строим дерево для подменю
     * @param $tree
     * @param $parent
     * @return array
     */
    static public function formatTree($tree, $parent){
        $tree2 = array();
        foreach($tree as $i => $item){
            $item['url'] = self::$categoryUrl.$item['id'];
            if($item['parent_id'] == $parent){
                $tree2[$item['id']] = $item;
                $tree2[$item['id']]['submenu'] = self::formatTree($tree, $item['id']);
            }
        }

        return $tree2;
    }

    public static function menuLeft($data, $first=true) {
        if (empty($data)) {
            return '';
        }
        $out = '<ul style="display: none;">';
        if($first) {
            $out = '<ul class="tree dhtml">';
        }
        foreach ($data as $name => $children) {
            $out .= '<li><a href="'.$children['url'].'">'.$children['title'].'</a>' . self::menuLeft($children['submenu'], false) . '</li>';
        }
        $out .= '</ul>';
        return $out;
    }

    public static function menuTop($data, $first=true) {
        if (empty($data)) {
            return '';
        }
        $out = '<ul>';
        if($first) {
            $out = '<ul class="vf-menu clearfix menu-content" id="menushow">';
        }
        foreach ($data as $name => $children) {
            $cls  = !empty($children['submenu']) ? "spvm-havechild" : "";
            $icon = "";
            if($first) {
                $cls .= ' spvm-hoverforce';
                $icon = '<i class="icon8"></i>';
            }
            $out .= '<li class="'.$cls.'" >'.$icon.'<a href="'.$children['url'].'">'.$children['title'].'</a>'.$icon . self::menuTop($children['submenu'], false) . '</li>';
        }
        $out .= '</ul>';
        return $out;
    }
}

