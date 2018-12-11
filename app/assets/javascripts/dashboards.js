$(document).on("turbolinks:load", function () {
    checkAlarms();
    $("Knock-Knock").click();
    var PolarAreaChart = new Chart(polar_area_chart, {
        type: 'polarArea',
        data: {
            labels: ["PH", "Acidez", "Amonia", "Oxigenio", "Temperature"],
            datasets: [{
                label: 'Primeira Condição ambiental',
                data: AmbientalCondition(),
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    var radar_chart = $("#radar_chart");
    var RadarChart = new Chart(radar_chart, {
        type: 'radar',
        data: {
            labels: ["PH", "Acidez", "Amonia", "Oxigenio", "Temperature"],
            datasets: [{
                label: 'Quantidade',
                data: Tanks(),
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    var line_chart = $("#line_chart");
    var LineChart = new Chart(line_chart, {
        type: 'line',
        data: {
            labels: ["PH", "Acidez", "Amonia", "Oxigenio", "Temperature"],
            datasets: [{
                label: 'Diferença entre os valores',
                data: differenceTankAndAmbiental(),
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
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    var pie_chart = $("#pie_chart");
    var PieChart = new Chart(pie_chart, {
        type: 'pie',
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
                        beginAtZero: true
                    }
                }]
            }
        }
    });
});

function AmbientalCondition() {
    var ph = 0;
    var acidity = 0;
    var ammonia = 0;
    var oxigen = 0;
    var temperature = 0;
    $.ajax({
        url: "/dashboards/ambiental_condition_values",
        type: 'POST',
        async: false,
        dataType: 'json',
        beforeSend: function(xhr){
            xhr.setRequestHeader( 'X-CSRF-Token', $( 'meta[name="csrf-token"]' ).attr( 'content' ) );
        },
        success: function (json) {
            acidity = json.ambiental_condition.ideal_acidity;
            ammonia = json.ambiental_condition.ideal_ammonia;
            oxigen = json.ambiental_condition.ideal_oxigen;
            temperature = json.ambiental_condition.ideal_temperature;
            ph = json.ambiental_condition.ideal_ph;
        }
    });
    return [ph, acidity, ammonia, oxigen, temperature];
}

function Tanks() {
    var ph = 0;
    var acidity = 0;
    var ammonia = 0;
    var oxigen = 0;
    var temperature = 0;
    $.ajax({
        url: "/dashboards/tank_values",
        type: 'POST',
        async: false,
        dataType: 'json',
        beforeSend: function(xhr){
            xhr.setRequestHeader( 'X-CSRF-Token', $( 'meta[name="csrf-token"]' ).attr( 'content' ) );
        },
        success: function (json) {
            acidity = json.tank.acidity;
            ammonia = json.tank.ammonia;
            oxigen = json.tank.oxigen;
            temperature = json.tank.temperature;
            ph = json.tank.ph;
        }
    });
    return [ph, acidity, ammonia, oxigen, temperature];
}

function differenceTankAndAmbiental() {
    var ph = 0;
    var acidity = 0;
    var ammonia = 0;
    var oxigen = 0;
    var temperature = 0;
    $.ajax({
        url: "/dashboards/ambiental_and_tank_values",
        type: 'POST',
        async: false,
        dataType: 'json',
        beforeSend: function(xhr){
            xhr.setRequestHeader( 'X-CSRF-Token', $( 'meta[name="csrf-token"]' ).attr( 'content' ) );
        },
        success: function (json) {
            acidity = json.tank.acidity - json.ambiental_condition.ideal_acidity;
            ammonia = json.tank.ammonia - json.ambiental_condition.ideal_ammonia;
            oxigen = json.tank.oxigen - json.ambiental_condition.ideal_oxigen;
            temperature = json.tank.temperature - json.ambiental_condition.ideal_temperature;
            ph = json.tank.ph - json.ambiental_condition.ideal_ph;
        }
    });
    return [ph, acidity, ammonia, oxigen, temperature];
}

function checkAlarms() {
    $.ajax({
        url: "/check_alarms",
        type: 'POST',
        async: false,
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
        },
        success: function (json) {
            if (json.alarm != 0){
                swal({
                    icon: 'warning',
                    title: 'cheque a '+json.alarm_type,
                    text: json.alarm.message,
                });
            }
        }
    });
}

