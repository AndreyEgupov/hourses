/*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/
$(document).ready(function() {
			
				$('#bxslider1').owlCarousel2({
					center: false,
					nav: true,
					loop: true,
					margin: 20,
					slideBy: 4,
					autoplay: false,
					autoplayHoverPause: true,
					autoplaySpeed: 1000,
					navSpeed: 200,
					smartSpeed: 200,
					startPosition: 1,
					mouseDrag: true,
					touchDrag: true,
					pullDrag: true,
					dots: false,
					autoWidth: false,
					navClass: ['bx-prev ', 'bx-next '],
					navText: ['&#139;', '&#155;'],
					responsive: {
						0: {
							items: 1
						},
						480: {
							items: 2
						},
						768: {
							items: 3
						},
						1200: {
							items:4
						}
					}
				});
			
});