document.addEventListener('turbo:render', disableButtonIfNotStarted);
document.addEventListener('DOMContentLoaded', disableButtonIfNotStarted);

function disableButtonIfNotStarted(qualifiedName, value) {
    const currentTime = new Date().getTime();
    const startTime = document.getElementById('start-time');
    if (startTime) {
        const startTimeData = new Date(startTime.getAttribute('data-start-time')).getTime();
        if (startTimeData > currentTime) {
            const showButton = document.querySelector('#show-link');
            showButton.style.cursor = 'not-allowed';
            showButton.addEventListener('click', function (e) {
                e.preventDefault();
            });
        }
    }
}
