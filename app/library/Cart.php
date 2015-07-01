<?php

class Cart {

    public $products = array();

    /**
     * @param Products $p
     * @param $count
     * @return $this
     */
    public function add(Products $p, $count) {
        $img  = $p->getFirstImage();

        foreach ($this->products as $key => $product) {
            if($product['id'] == $p->id) {
                $this->products[$key]['count'] += $count;
                return $this;
            }
        }

        $this->products[] = array(
            'title' => $p->title,
            'price' => $p->price,
            'img' => $img->src,
            'count' => $count,
            'id' => $p->id
        );

        return $this;
    }

    public function remove(Products $p) {
        foreach($this->products as $key => $product) {
            if($p->id == $product['id']) {
                unset($this->products[$key]);
            }
        }
        return $this;
    }

    public function removeById($productId) {
        foreach($this->products as $key => $product) {
            if($productId == $product['id']) {
                unset($this->products[$key]);
            }
        }
        return $this;
    }

    public function removeAll() {
        $this->products = array();
        return $this;
    }

    public function getTotalPrice() {
        $total = 0;
        foreach ($this->products as $p) {
            $total += $p['price'] * $p['count'];
        }
        return $total;
    }

    public function getTotalCount () {
        $totalCount = 0;
        foreach ($this->products as $p) {
            $totalCount += $p['count'];
        }

        return $totalCount;
    }

    public function getProducts () {
        return $this->products;
    }

    public static function getFullUrl($string) {
        if(preg_match("/^http/", $string)) {
            return $string;
        }
        return $_SERVER["HTTP_HOST"] . $string;
    }
}