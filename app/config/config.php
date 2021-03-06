<?php

return new \Phalcon\Config(array(
    'database' => array(
        'adapter'     => 'Mysql',
        'host'        => 'localhost',
        'username'    => 'root',
        'password'    => '1665017',
        'dbname'      => 'horses',
        'charset'     => 'utf8',
    ),
    'application' => array(
        'controllersDir'    => __DIR__ . '/../../app/controllers/',
        'modelsDir'         => __DIR__ . '/../../app/models/',
        'viewsDir'          => __DIR__ . '/../../app/views/',
        'pluginsDir'        => __DIR__ . '/../../app/plugins/',
        'libraryDir'        => __DIR__ . '/../../app/library/',

        'abstractModelsDir' => __DIR__ . '/../../app/library/models/',

        'cacheDir'          => __DIR__ . '/../../app/cache/',
        'baseUri'           => '',
        'publicUrl' => 'http://hourses.local'
    ),
    'mail' => array(
        'fromName' => 'Интернет-магазин EUR@HORSE',
        'fromEmail' => 'eurohorse@local.com',
        'smtp' => array(
            'server'	=> 'smtp.gmail.com',
            'port' 		=> 465,
            'security' => 'ssl',
            'username' => 'bombascter@gmail.com',
            'password' => 'tsqzjhdpgicytwfa',
        )
    ),
));
