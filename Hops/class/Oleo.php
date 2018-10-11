<?php
/**
 * Created by PhpStorm.
 * User: 00660
 * Date: 10/10/2018
 * Time: 11:21
 */

class Oleo{
    private $idOleo;
    private $nomeOleo;
    private  $caracteristicaOleo;


    public function getIdOleo()
    {
        return $this->idOleo;
    }

    public function setIdOleo($idOleo)
    {
        $this->idOleo = $idOleo;
    }

    public function getNomeOleo()
    {
        return $this->nomeOleo;
    }

    public function setNomeOleo($nomeOleo)
    {
        $this->nomeOleo = $nomeOleo;
    }

    public function getCaracteristicaOleo()
    {
        return $this->caracteristicaOleo;
    }

    public function setCaracteristicaOleo($caracteristicaOleo)
    {
        $this->caracteristicaOleo = $caracteristicaOleo;
    }

    public function getListaOleo()
    {
        $sql = new Sql();

        return $sql->select("select * from oleo order by nomeoleo");
    }

    public function getOleoPorNome($oleo)
    {
        $sql = new Sql();
        return $sql->select("select * from oleo where nomeOleo like :nome order by nomeOleo", array(
            ":nome" => $oleo . "%"
        ));
    }

    public function getOleoPorId($id)
    {
        $sql = new Sql();
        $result = $sql->select("select * from oleo where idOleo = :id", array(
            ":id" => $id
        ));

        if (count($result) > 0) {
            $this->setDados($result[0]);
        }
    }

    public function insertOleo()
    {
        $sql = new Sql();

        $sql->select("insert into oleo (nomeOleo, caracteristicaOleo) values (:nomeOleo, 
        :caracteristicaOleo)",array(
            ":nomeOleo"=>$this->getNomeOleo(),
            ":caracteristicaOleo"=>$this->getCaracteristicaOleo()
        ));
    }

    public function updateOleo($id)
    {
        $sql = new Sql();

        $sql->select("update oleo set nomeOleo = :nomeOleo, caracteristicaOleo = :caracteristicaOleo 
        where idOleo = :idOleo",array(
            ":idOleo"=>$id,
            ":nomeOleo"=>$this->getNomeOleo(),
            ":caracteristicaOleo"=>$this->getCaracteristicaOleo()
        ));
    }

    public function deleteOleo($id)
    {
        $sql = new Sql();
        $sql->select("delete from oleo where idOleo = :id",array(
            ":id"=>$id
        ));
    }

    public function setDados($dados)
    {
        $this->setIdOleo($dados['idOleo']);
        $this->setNomeOleo($dados['nomeOleo']);
        $this->setCaracteristicaOleo($dados['caracteristicaOleo']);
    }

    function __toString()
    {
        return json_encode(array(
            "idOleo"=>$this->getIdOleo(),
            "nomeOleo"=>$this->getNomeOleo(),
            "caracteristicaOleo"=>$this->getCaracteristicaOleo()
        ));
    }
}