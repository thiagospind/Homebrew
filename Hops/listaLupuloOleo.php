<?php
/**
 * Created by PhpStorm.
 * User: 00660
 * Date: 16/10/2018
 * Time: 09:53
 */

require_once("config.php");

$lupOleo = new LupuloOleo();
$listaLupOleo = $lupOleo->getListaLupOleo();
foreach($listaLupOleo as )
echo json_encode($listaLupOleo);