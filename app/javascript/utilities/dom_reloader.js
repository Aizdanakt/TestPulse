import Cookies from 'js-cookie';

document.addEventListener('turbo:render', domReload);
document.addEventListener('DOMContentLoaded', domReload);

function domReload() {
    const themeLinks = document.querySelectorAll('.theme-link');
    if (themeLinks) {
        themeLinks.forEach(function (link) {
            link.addEventListener('click', function (event) {
                event.preventDefault();
                const currentTheme = document.cookie.replace(/(?:(?:^|.*;\s*)theme\s*\=\s*([^;]*).*$)|^.*$/, "$1");
                window.location.href = link.href;
                const newTheme = document.cookie.replace(/(?:(?:^|.*;\s*)theme\s*\=\s*([^;]*).*$)|^.*$/, "$1");

                if (currentTheme !== newTheme) {
                    location.reload();
                }
            });
        });
    }
}
