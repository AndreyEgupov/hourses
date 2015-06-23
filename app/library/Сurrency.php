<?
use Phalcon\DI;

/**
 * Class Сurrency
 * конвертор валют
 */
abstract class Сurrency {

    static public function getVal($price, Currency $currency) {
        return round($price * $currency->relation, 2);
    }
}