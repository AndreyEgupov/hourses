<?php

namespace Multiple\Admin;

use Phalcon\DiInterface;
use Phalcon\Loader,
    Phalcon\Mvc\Dispatcher,
    Phalcon\Mvc\View,
    Phalcon\Mvc\ModuleDefinitionInterface;

class Module implements ModuleDefinitionInterface
{

    /**
     * Регистрация автозагрузчика, специфичного для текущего модуля
     * @param DiInterface $dependencyInjector
     */
    public function registerAutoloaders(DiInterface $dependencyInjector = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces(
            array(
                'Multiple\Admin\Controllers' => '../app/admin/controllers/',
            )
        );

        $loader->register();
    }

    /**
     * Регистрация специфичных сервисов для модуля
     * @param DiInterface $di
     */
    public function registerServices(DiInterface $di)
    {
        // Регистрация диспетчера
        $di->set('dispatcher', function() {
            $dispatcher = new Dispatcher();
            $dispatcher->setDefaultNamespace("Multiple\Admin\Controllers");
            return $dispatcher;
        });

        // Регистрация компонента представлений
        $di->set('view', function() {
            $view = new View();
            $view->setViewsDir('../app/admin/views/');
            return $view;
        });
    }

}