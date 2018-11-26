//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery.mask
var notification_class = document.getElementsByClassName('notification');
$(document).on("turbolinks:load", function () {
    $(".date").datepicker({
        format: "dd/mm/yyyy",
        language: "pt-BR",
        autoclose: true,
        todayHighlight: true
    });

    $('.money').maskMoney({prefix: 'R$', thousands: '.', decimal: ','}).trigger("mask.maskMoney");

    $(".date_mask").mask("00/00/0000");
    $(".cpf").mask("000.000.000-00", {reverse: true});
    $(".btn-login").click(function () {
        $(".cpf").unmask();
    });

    //notification
    for (var i = 0 ; i < notification_class.length; i++) {
        notification_class[i].addEventListener("click", notificationDismiss);
        return false
    };
});


//notification
function notification(type, text){
    for (i = 0, notification_class.length; i < notification_class.length; i++) {
        if (type == 'success') {
            notification_class[i].style.backgroundColor = '#34bfa3';
        } else if (type == 'error') {
            notification_class[i].style.backgroundColor = '#f4516c';
        } else if (type == 'warning') {
            notification_class[i].style.backgroundColor = '#ffb822';
        } else if (type == 'info') {
            notification_class[i].style.backgroundColor = '#36a3f7';
        }
        notification_class[i].style.visibility = 'visible';
        notification_class[i].innerHTML = text;
        notification_class[i].style.animation = 'fadein 0.5s, fadeout 0.5s 2.5s';
        setTimeout(function () {
            notificationDismiss();
        }, 2700);

    }

}

function notificationDismiss(){
    for (i = 0, notification_class.length; i < notification_class.length; i++) {
        notification_class[i].style.visibility = 'hidden';
        notification_class[i].style.animation = '';
    }

}