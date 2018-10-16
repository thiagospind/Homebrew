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
    private $idLup;
    private $idOleo;

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

    public function getIdLup()
    {
        return $this->idLup;
    }

    public function setIdLup($idLup): void
    {
        $this->idLup = $idLup;
    }

    public function getIdOleo()
    {
        return $this->idOleo;
    }

    public function setIdOleo($idOleo): void
    {
        $this->idOleo = $idOleo;
    }


    public function insertLupOleo(){
        $sql = new Sql();
        $sql->select("insert into lupulo_oleo (idLup, idOleo, quantOleo) values (:idLup, :idOleo, :quantOleo)",
            array(
                ":idLup"=>$this->getIdLup(),
                ":idOleo"=>$this->getIdOleo(),
                ":quantOleo"=>$this->getQuantOleo()
            ));
    }

    public function deleteLupOleo(){
        $sql = new Sql();
        $sql->select("delete from lupulo_oleo where idLupOleo = :idlupoleo",array(
            ":idlupoleo"=>$this->getIdLupOleo()
        ));
    }

    public function updateLupOleo(){
        $sql = new Sql();
        $sql->select("update lupulo_oleo set quantOleo = :quantoleo where idLup = :idlup and idOleo = :idoleo",
            array(
                ":quantoleo"=>$this->getQuantOleo(),
                ":idlup"=>$this->getIdLup(),
                ":idoleo"=>$this->getIdOleo()
            ));
    }

    public function getListaLupOleo(){
        $sql = new Sql();
        $result = $sql->select("call SP_LUPOLEO()");

        if (count($result)>0){

        }
    }

    public function setDados($dados){
        $this->setIdLupOleo()
    }

    public function __toString()
    {
        return json_encode(array(
            "idLupOleo"=>$this->getIdLupOleo(),
            "idLup"=>$this->getIdLup(),
            "idOleo"=>$this->getIdOleo(),
            "quantOleo"=>$this->getQuantOleo()
        ));
    }
}