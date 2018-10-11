<?php
/**
 * Created by PhpStorm.
 * User: 00660
 * Date: 10/10/2018
 * Time: 08:49
 */

spl_autoload_register(function($class_name){
    $filename = "class".DIRECTORY_SEPARATOR.$class_name.".php";

    if (file_exists($filename)){
        require_once ($filename);
    }
});