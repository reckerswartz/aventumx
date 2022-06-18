// users.js

$(document).on('turbo:load', function() {
  $('#students-datatable').dataTable({
    'processing': true,
    'serverSide': true,
    'responsive': true,
    'ajax': {
      'url': $('#students-datatable').data('source'),
    },
    'pagingType': 'full_numbers',
    'columns': [
      {'data': 'id'},
      {'data': 'first_name'},
      {'data': 'last_name'},
      {'data': 'email'},
      {'data': 'status', 'orderable': false}
    ],
  });
});
