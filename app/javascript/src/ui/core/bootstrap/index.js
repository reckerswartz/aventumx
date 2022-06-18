// You can specify which plugins you need
import * as Popper from '@popperjs/core';
import {Button, Dropdown, Popover, Toast, Tooltip, Modal} from 'bootstrap';
import './toast';

$(document).on('turbo:load', function() {
  const popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
  const popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
    return new Popover(popoverTriggerEl, {
      trigger: 'focus'
    });
  });


  document.querySelectorAll('.toast').forEach((toastTarget) => {
    return new Toast(toastTarget).show();
  });
});


