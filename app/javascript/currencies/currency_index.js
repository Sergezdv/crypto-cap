
$(document).ready(function() {
    $('#currency_list').DataTable({
        "bLengthChange" : false,
        "bInfo":false,
        "paging": false
    });
});


$("tr[data-link]").click(function() {
    window.location = $(this).data("link")
})