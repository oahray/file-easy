//Override the default confirm dialog by rails
$('.alert').alert()

$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}

//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}

//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
  var message = link.data("confirm");
  swal({
    title: message,
    type: 'warning',
    confirmButtonText: 'Sure',
    confirmButtonColor: '#2acbb3',
    showCancelButton: true
  }).then(function(e){
    $.rails.confirmed(link);
  });
};

$(() => {
  $('[data-toggle="tooltip"]').tooltip()
})
