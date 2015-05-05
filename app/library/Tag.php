<?

class Tag extends \Phalcon\Tag
{
    /**
     * обрезает дробную часть
     * @param $input
     * @return float
     */
    static public function noformat($input)
    {
        return round($input, 0);
    }
}