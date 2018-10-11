<?php
/**
 * Created by PhpStorm.
 * User: 00660
 * Date: 10/10/2018
 * Time: 15:29
 */

require_once ("config.php");

$lupulos = new Lupulo();
$listaLup = $lupulos->getListaLupulo();
?>
<!DOCTYPE HTML>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="icon" type="image/png" href="imagens/hop_edit.png">
        <title>Lupulando - Ferramenta Para Cervejeiros Caseiros</title>
    </head>
    <body>
        <nav class="navbar navbar-light" style="background-color: #32b344;">
            <a class="navbar-brand" href="#">
                <img src="imagens/hop_edit.png" width="30" height="30" class="d-inline-block align-top" alt="">
                Lupulando
            </a>
        </nav>
        <div class="container-fluid">
            <h4 class="text-center">Ferramenta para comparação gráfica dos óleos essenciais de lúpulos!</h4>

            <fieldset class="container form-group border rounded">
                <div class="row">
                    <div class="col">
                        <label class="font-weight-bold">Lúpulo</label>
                    </div>
                    <div class="col">
                        <label class="font-weight-bold">País de Origem</label>
                    </div>
                    <div class="col">
                        <label class="font-weight-bold">Uso</label>
                    </div>
                    <div class="col">
                        <label class="font-weight-bold">%A. Ácido</label>
                    </div>
                </div>
                <?php
                foreach ($listaLup as $lupulo) { ?>
                <div class="row">
                    <div class="col">
                        <label><input type="checkbox" value=""> <?php echo $lupulo['nomeLup']?></label>
                    </div>
                    <div class="col">
                        <label><?php echo $lupulo['paisLup']?></label>
                    </div>
                    <div class="col">
                        <label><?php echo $lupulo['tipoLup']?></label>
                    </div>
                    <div class="col">
                        <label><?php echo $lupulo['AALup']?></label>
                    </div>
                </div>
                <?php } ?>
            </fieldset>
        </div>
        <script src="js/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>