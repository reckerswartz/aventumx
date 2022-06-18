import '@client-side-validations/client-side-validations/src';

window.ClientSideValidations.formBuilders['ActionView::Helpers::FormBuilder'] = {
    add: function(element, settings, message) {
        let form; let labelErrorField; let label; let inputErrorField;
        form = $(element[0].form);
        // remove the error message if it already exists
        let elementClassErrorMessage = element.attr('id').concat('-error-message')
        let errorDiv = form.find('.' + elementClassErrorMessage)
        if (errorDiv.length > 0) {
            errorDiv.remove()
        }
        labelErrorField = $(settings.label_tag);

        label = form.find("label[for=\"".concat(element.attr('id'), "\"]:not(.message)"));

        if (element.attr('autofocus')) {
            element.attr('autofocus', false);
        }

        if (label.length) {
            if (label.parent().hasClass('floating-label')) {
                // show error message div after label if it is floating
                label.after(labelErrorField);
                labelErrorField.addClass(element.attr('id').concat('-error-message'));
                labelErrorField.text(message).addClass('text-punch');
                //$labelErrorField.addClass('mt-0');
                element.addClass('is-invalid');
            } else {
                // TODO: show error message div after label if it is not floating
                element.removeClass('is-valid').addClass('is-invalid');
            }
        }

        form.find("label.message[for=\"".concat(element.attr('id'), "\"]")).text(message);
    },
    remove: function(element, settings) {
        let form; let labelErrorField; let label; let inputErrorField; let inputErrorFieldClass;
        let labelErrorFieldClass;
        form = $(element[0].form);
        inputErrorFieldClass = $(settings.input_tag).attr('class');
        inputErrorField = element.closest(".".concat(inputErrorFieldClass.replace(/ /g, '.')));
        label = form.find("label[for=\"".concat(element.attr('id'), "\"]:not(.message)"));
        labelErrorFieldClass = $(settings.label_tag).attr('class');
        labelErrorField = label.closest(".".concat(labelErrorFieldClass.replace(/ /g, '.')));

        if (label.length) {
            if (label.parent().hasClass('floating-label')) {
                // remove error message div after label if it is floating
                let errorDivClass = ".".concat(element.attr('id')).concat('-error-message')
                $(errorDivClass).remove();
                element.removeClass('is-invalid');
            } else {
                // TODO: remove error message div after label if it is not floating
            }
        }
    },
};