// users.js

$(document).on('turbo:load', function() {
  $('#institutes-datatable').dataTable({
    'processing': true,
    'serverSide': true,
    'responsive': true,
    'ajax': {
      'url': $('#institutes-datatable').data('source'),
    },
    'pagingType': 'full_numbers',
    'columns': [
      {'data': 'id'},
      {'data': 'first_name'},
      {'data': 'last_name'},
      {'data': 'email'},
      {'data': 'org_code' , 'orderable': false},
    ],
  });
});
