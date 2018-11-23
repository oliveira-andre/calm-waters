//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery.mask

$(document).on("turbolinks:load", function () {
    $(".date").datepicker({
        format: "dd/mm/yyyy",
        language: "pt-BR",
        autoclose: true,
        todayHighlight: true
    });

    $(".cpf").mask("000.000.000-00", {reverse: true});
    $(".btn-login").click(function () {
        $(".cpf").unmask();
    });

});
