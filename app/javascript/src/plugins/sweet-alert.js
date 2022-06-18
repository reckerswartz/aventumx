// import sweetalert2 without inline styles
import Swal from 'sweetalert2/dist/sweetalert2.js';

window.Swal = Swal;

// Behavior after click to confirm button
const confirmed = (element, result) => {
  if (result.value) {
    if (!!element.getAttribute('action')) {
        element.removeAttribute('data-turbo-confirm');
        element.requestSubmit();
    } else {
      element.removeAttribute('data-turbo-confirm');
      element.click();
    }
  }
};

// Display the confirmation dialog
const showConfirmationDialog = (element) => {
  const message = element.getAttribute('data-turbo-confirm');
  const text = element.getAttribute('data-text');

  Swal.fire({
    title: message || 'Are you sure?',
    text: text || '',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Yes',
    cancelButtonText: 'Cancel',
  }).then((result) => confirmed(element, result));
};

const allowAction = (element) => {
  if (element.getAttribute('data-turbo-confirm') === null) {
    return true;
  }

  showConfirmationDialog(element);
  return false;
};

$(document).on('turbo:load', function() {
    $('[data-turbo-confirm]').click(function(event) {
        if (!allowAction(this)) {
            event.preventDefault();
        }
    });
});
