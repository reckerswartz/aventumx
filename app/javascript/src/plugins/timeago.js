import 'timeago';

// when the document is ready turbo
document.addEventListener('turbo:load', () => {
    jQuery(".timeago").timeago();
})