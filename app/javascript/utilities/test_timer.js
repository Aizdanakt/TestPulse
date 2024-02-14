document.addEventListener('turbo:render', test_timer);
document.addEventListener('DOMContentLoaded', test_timer);

function test_timer() {
    const timeLeftElement = document.getElementById('time-left');
    if (timeLeftElement) {
        let timeLeftInSeconds = parseInt(timeLeftElement.getAttribute('data-time-left'), 10);

        function updateTimer() {
            if (timeLeftInSeconds <= 0) {
                document.querySelector('form').submit();
            } else {
                const minutes = Math.floor(timeLeftInSeconds / 60);
                const seconds = timeLeftInSeconds % 60;

                const formattedTime = `${minutes} минут ${seconds} секунд`;

                timeLeftElement.textContent = 'Оставшееся время: ' + formattedTime;
                timeLeftInSeconds -= 1;

                setTimeout(updateTimer, 1000);
            }
        }

        updateTimer();
    }
}
