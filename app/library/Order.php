<?

abstract class Order {
    const TYPE_DEFAULT = 1;
    static function getOrderServiceItem ($orderType) {
        switch($orderType) {
            case 1:
                return "Products.title ASC";
            case 2:
                return "Products.title DESC";
            case 3:
                return "Products.price ASC";
            case 4:
                return "Products.price DESC";
            case 5:
                return "Products.date_create ASC";
            case 6:
                return "Products.date_create DESC";
        }

        throw new Exception("wrong type order column");
    }
}