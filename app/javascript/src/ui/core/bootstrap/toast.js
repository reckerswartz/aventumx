$(document).on('turbolinks:load', function() {
  if (typeof $('#toast-content').data('toast-notice') !== 'undefined') {
    debugger
    const toastContent = '<div class=\'toast #{type}\' role=\'alert\' aria-live=\'assertive\' aria-atomic=\'true\'>\n' +
    '        <div class=\'toast-header\'>\n' +
    '          <img src=\'...\' class=\'rounded me-2\' alt=\'...\'>\n' +
    '          <strong class=\'me-auto\'>Bootstrap</strong> <small class=\'text-muted\'>just now</small> \n' +
    '          <button type=\'button\' class=\'btn-close\' data-bs-dismiss=\'toast\' aria-label=\'Close\'></button>\n' +
    '        </div><div class=\'toast-body\'>'+$('#toast-content').data('toast-notice')+'</div>\n' +
    '      </div>';
    if ($('#toast-container').length) {
      $('#toast-container').append(toastContent);
    }
  }
});
