$('#message').html("<%= escape_javascript(render 'modal') %>")
$('#message .modal').modal('show')
