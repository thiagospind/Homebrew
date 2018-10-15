<?php
/**
 * Created by PhpStorm.
 * User: thiag
 * Date: 14/10/2018
 * Time: 18:17
 */

class LupuloOleo{
    private $idLupOleo;
    private $quantOleo;

    public function getIdLupOleo()
    {
        return $this->idLupOleo;
    }

    public function setIdLupOleo($idLupOleo): void
    {
        $this->idLupOleo = $idLupOleo;
    }

    public function getQuantOleo()
    {
        return $this->quantOleo;
    }

    public function setQuantOleo($quantOleo): void
    {
        $this->quantOleo = $quantOleo;
    }

    public function insertLupOleo($idLup, $idOleo){
        $sql = new Sql();
        $sql->select("insert into lupulo_oleo (idLup, idOleo, quantOleo) values (:idLup, :idOleo, :quantOleo)",
            array(
                ":idLup"=>$idLup,
                ":idOleo"=>$idOleo,
                ":quantOleo"=>$this->getQuantOleo()
            ));
    }

    public function deleteLupOleo(){
        $sql = new Sql();
        $sql->select("delete from lupulo_oleo where idLupOleo = :idlupoleo",array(
            ":idlupoleo"=>$this->getIdLupOleo()
        ));
    }

    public function updateLupOleo($idLup,$idOleo){
        $sql = new Sql();
        $sql->select("update lupulo_oleo set quantOleo = :quantoleo where idLup = :idlup and idOleo = :idoleo",
            array(
                ":quantoleo"=>$this->getQuantOleo(),
                ":idlup"=>$this->$idLup,
                ":idoleo"=>$idOleo
            ));
    }

    public function getListaLupOleo(){
        $sql = new Sql();
        return $sql->select("")
    }
}