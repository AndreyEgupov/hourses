<?php
namespace Multiple\Frontend\Controllers;

use CBRAgent;
use RecommendedArticle;
use ServiceItem;
use Services;
use Slider;
use Phalcon\Mvc\Model\Query;

use CategoryMenu;
use Cities;

use Phalcon\Http\Request;
use Phalcon\Mvc\Dispatcher;

class CronController extends ControllerBase
{
	public function dayAction() {
		$cbrAgent = new CBRAgent();
		$cbrAgent->syncDb();
	}
}

