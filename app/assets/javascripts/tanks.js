// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function FeedFishes(id) {
    $.ajax({
        url: "/feed/"+id,
        type: 'POST',
        async: false,
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
        },
        success: function (json) {
            if (json.success){
                location.reload();
            } else {
                swal({
                    icon: 'warning',
                    title: "Erro",
                    text: "Você não pode alimentar mais",
                });
            }
        }
    });
}