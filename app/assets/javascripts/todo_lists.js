$(document).on('click', 'form .remove_fields', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('fieldset').hide();
  return event.preventDefault();
});


$(document).on('click', 'form .add_fields', function(event) {
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $('#tasks').append($(this).data('fields').replace(regexp, time));
  return event.preventDefault();
});

$(document).on('submit', '#todo-modal-content form', function(event) {
  $('form')[0].reset();
  $('#tasks').empty();
  $('#todolist-modal').modal('hide');
  return false;
});
