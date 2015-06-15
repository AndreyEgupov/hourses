<?

class Paginator {

    const COUNT_PAGES = 6;
    public $page;

    public $items;
    public $before;
    public $next;
    public $last;
    public $current;
    public $total_pages;

    function __construct($page) {
        $this->page = $page;

        $this->items = $page->items;
        $this->before = $page->before;
        $this->next = $page->next;
        $this->last = $page->last;
        $this->current = $page->current;
        $this->total_pages = $page->total_pages;
    }

    /**
     * @return array
     */
    public function getPages () {
        $pages = array();
        for($i = $this->current - Paginator::COUNT_PAGES/2, $loop= 0; $loop < Paginator::COUNT_PAGES/2; $loop++, $i++) {
            if($i <= 0) continue;
            $pages[] = $i;
        }
        for($i = $this->current, $loop=0; $loop < Paginator::COUNT_PAGES/2; $loop++, $i++) {
            if($i > $this->total_pages) break;
            $pages[] = $i;
        }

        return $pages;
    }

    public function showFirst() {
        return ($this->current > Paginator::COUNT_PAGES/2);
    }

    public function showLast() {
        return ($this->current <= $this->last - Paginator::COUNT_PAGES/2 );
    }
}