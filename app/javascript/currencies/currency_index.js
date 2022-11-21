
$(document).ready(function() {
    $('#currency_list').DataTable();
});


$("tr[data-link]").click(function() {
    window.location = $(this).data("link")
})