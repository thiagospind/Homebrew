<?php
/**
 * Created by PhpStorm.
 * User: 00660
 * Date: 10/10/2018
 * Time: 15:29
 */

require_once ("config.php");

//$lupulo = new Lupulo();
//$lista = $lupulo->getListaLupulo();
//echo json_encode($lista);

$oleo = new Oleo();
$listaOleo = $oleo->getListaOleo();
echo json_encode($listaOleo);