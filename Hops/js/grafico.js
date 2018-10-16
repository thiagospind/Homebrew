$(document).ready(function () {
    showGrafico();
});
function showGrafico() {
    {
        $.post("listaLupuloOleo.php", function (data) {
            console.log(data);
            var oleos = [];
            var lupulos = [];
            for (var i in data) {
                oleos.push(data[i].Myrcene);
                lupulos.push(data[i].nomeLup);
            }
            debugger;
            console.log(oleos);
            console.log(lupulos);
            var chartdata = {
                labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                datasets: [
                    {
                        labels: 'Oleos de Lúpulo',
                        backgroundColor: '#1aff68',
                        borderColor: '#69d169',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        borderWidth: 1,
                        data: oleos
                    }
                ]
            };

            var graphTarget = $("#radarGraph");
            var radar = new Chart(graphTarget, {
                type: 'radar',
                data: chartdata,
            });
        });
    }
}