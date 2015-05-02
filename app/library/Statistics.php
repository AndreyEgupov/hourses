<?

class Statistics {
    /**
     * Подсчитывает количество посищений за последние $countHours  часов
     * @param $serviceItemId
     * @param int $countDays
     * @return mixed
     */
    public static function countVisits ($serviceItemId, $countDays = 1) {
        $minDate = strtotime('-'.$countDays.' day');

        return ServiceItemVisits::count(array(
            "service_item_id = :serviceItemId: AND date > :minDate:",
            "bind" => array(
                "minDate" => $minDate,
                "serviceItemId" => $serviceItemId
            )
        ));
    }
}