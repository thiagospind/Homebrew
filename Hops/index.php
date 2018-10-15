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
        <script src="js/jquery-3.3.1.js"></script>
        <script src="js/Chart.bundle.js"></script>
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
            <div class="container-fluid w-50">
                <canvas id="myChart" width="400" height="400"></canvas>
                <script>
                    var ctx = document.getElementById("myChart");
                    var myChart = new Chart(ctx, {
                        type: 'radar',
                        data: {
                            labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                            datasets: [{
                                label: '# of Votes',
                                data: [12, 19, 3, 5, 2, 3],
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero:true
                                    }
                                }]
                            }
                        }
                    });
                </script>
            </div>
        </div>
        <script src="js/bootstrap.js"></script>
    </body>
</html>