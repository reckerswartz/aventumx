// users.js

$(document).on('turbo:load', function() {
  $('#staffs-datatable').dataTable({
    'processing': true,
    'serverSide': true,
    'responsive': true,
    'ajax': {
      'url': $('#staffs-datatable').data('source'),
    },
    'pagingType': 'full_numbers',
    'columns': [
      {'data': 'id'},
      {'data': 'first_name'},
      {'data': 'last_name'},
      {'data': 'email'},
      {'data': 'username'},
    ],
  });
});
