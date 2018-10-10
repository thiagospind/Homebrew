<?php
/**
 * Created by PhpStorm.
 * User: thiag
 * Date: 05/10/2018
 * Time: 22:39
 */

class Lupulo{

    private $idLup;
    private $nomeLup;
    private $paisLup;
    private $tipoLup;
    private $AALup;
    private $safraLup;
    private $BALup;
    private $estilosLup;
    private $perfilAromaLup;


    public function getIdLup()
    {
        return $this->idLup;
    }

    public function setIdLup($idLup)
    {
        $this->idLup = $idLup;
    }

    public function getNomeLup()
    {
        return $this->nomeLup;
    }

    public function setNomeLup($nomeLup)
    {
        $this->nomeLup = $nomeLup;
    }

    public function getPaisLup()
    {
        return $this->paisLup;
    }

    public function setPaisLup($paisLup)
    {
        $this->paisLup = $paisLup;
    }

    public function getTipoLup()
    {
        return $this->tipoLup;
    }

    public function setTipoLup($tipoLup)
    {
        $this->tipoLup = $tipoLup;
    }

    public function getAALup()
    {
        return $this->AALup;
    }

    public function setAALup($AALup)
    {
        $this->AALup = $AALup;
    }

    public function getSafraLup()
    {
        return $this->safraLup;
    }

    public function setSafraLup($safraLup)
    {
        $this->safraLup = $safraLup;
    }

    public function getBALup()
    {
        return $this->BALup;
    }

    public function setBALup($BALup)
    {
        $this->BALup = $BALup;
    }

    public function getEstilosLup()
    {
        return $this->estilosLup;
    }

    public function setEstilosLup($estilosLup)
    {
        $this->estilosLup = $estilosLup;
    }

    public function getPerfilAromaLup()
    {
        return $this->perfilAromaLup;
    }

    public function setPerfilAromaLup($perfilAromaLup)
    {
        $this->perfilAromaLup = $perfilAromaLup;
    }


    public function getListaLupulo(){
        $sql = new Sql();

        return $sql->select("select * from lupulo order by nomeLup");
    }

    public function getLupuloPorNome($lupulo){
        $sql = new Sql();
        return $sql->select("select * from lupulo where nomeLup like :nome order by nomeLup",array(
            ":nome"=>$lupulo."%"
        ));
    }

    public function getLupuloPorId($id){
        $sql = new Sql();
        $result = $sql->select("select * from lupulo where idLup = :id",array(
            ":id"=>$id
        ));

        if (count($result) > 0) {
            $this->setDados($result[0]);
        }
    }

    public function insertLupulo(){
        $sql = new Sql();
        $result =
    }

    public function setDados($dados){
        $this->setIdLup($dados['idLup']);
        $this->setNomeLup($dados['nomeLup']);
        $this->setPaisLup($dados['paisLup']);
        $this->setTipoLup($dados['tipoLup']);
        $this->setAALup($dados['AALup']);
        $this->setSafraLup($dados['safraLup']);
        $this->setBALup($dados['BALup']);
        $this->setEstilosLup($dados['estilosLup']);
        $this->setPerfilAromaLup($dados['idLup']);
    }

    public function __toString()
    {
        return json_encode(array(
            "idLup"=>$this->getIdLup(),
            "nomeLup"=>$this->getNomeLup(),
            "paisLup"=>$this->getPaisLup(),
            "tipoLup"=>$this->getTipoLup(),
            "AALup"=>$this->getAALup(),
            "safraLup"=>$this->getSafraLup(),
            "BALup"=>$this->getBALup(),
            "estilosLup"=>$this->getEstilosLup(),
            "perfilAromaLup"=>$this->getPerfilAromaLup()
        ));
    }

}

