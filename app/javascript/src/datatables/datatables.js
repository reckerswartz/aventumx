import 'datatables.net-bs5/js/dataTables.bootstrap5.js';

export function dataTableGenericInit(tableList) {
  if (tableList.length === 0) return;
  tableList.forEach( (table) => {
    uninstall(table);
    install(table);
  });
  function uninstall(table) {
    // turbolinks cache fix
    document.addEventListener('turbo:before-cache', () => {
      if ($.fn.dataTable.isDataTable(table)) {
        jQuery(table).DataTable().destroy();
      }
    });
  }
  function install(table) {
    jQuery(table).DataTable({
      destroy: true, // Stop turbolinks errors
      // your other options
    });
  }
}

import './student';
import './institutes';
import './staffs';
// Global setting and initializer

$.extend($.fn.dataTable.defaults, {
  'responsive': true,
  'pagingType': 'full_numbers',
  'serverSide': true,
  'processing': true,
  'dom':
    '<\'row\'<\'col-sm-12 col-md-6\'Ql><\'col-sm-12 col-md-6\'f>>' +
    '<\'row\'<\'col-sm-12\'tr>>' +
    '<\'row\'<\'col-sm-12 col-md-5\'i><\'col-sm-12 col-md-7\'p>>',
});
