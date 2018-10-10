<?php
/**
 * Created by PhpStorm.
 * User: 00660
 * Date: 10/10/2018
 * Time: 08:47
 */

class Sql extends PDO {
    private $conn;

    public function __construct()
    {
        $this->conn = new PDO("mysql:host=localhost;dbname=cervejeiro","root","aapvr",array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\''));
        //$this->conn->query("SET NAMES utf8;");
    }

    public function setParams($statement, $parameters = array()){

        foreach ($parameters as $key => $value){
            $this->setParam($statement,$key,$value);
        }
    }

    public function setParam($statement, $key, $value){
        $statement->bindParam($key, $value);
    }

    public function query($rawQuery, $params = array()){
        $stmt = $this->conn->prepare($rawQuery);
        $this->setParams($stmt, $params);
        $stmt->execute();
        return $stmt;
    }

    public function select($rawQuery, $params = array()){
        $stmt = $this->query($rawQuery,$params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}