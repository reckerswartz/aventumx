// used to set the banner from data-bg-banner attribute
// document onload event
document.addEventListener('turbo:load', function() {
    var banner = document.querySelector('[data-bg-banner]');
    if (banner) {
    banner.style.backgroundImage = 'url(' + banner.dataset.bgBanner + ')';
    }
})