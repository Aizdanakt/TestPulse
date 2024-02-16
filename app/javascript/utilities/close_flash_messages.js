document.addEventListener('turbo:render', close_flash);
document.addEventListener('DOMContentLoaded', close_flash);

function close_flash() {
    const flashMessage = document.getElementById("flash");

    if (flashMessage) {
        setTimeout(() => {
            flashMessage.remove();
        }, 5000);
    }
}
