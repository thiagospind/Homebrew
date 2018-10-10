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

    function __toString()
    {
        return json_encode(array(
            "idOleo"=>$this->getIdOleo(),
            "nomeOleo"=>$this->getNomeOleo(),
            "caracteristicaOleo"=>$this->getCaracteristicaOleo()
        ));
    }
}