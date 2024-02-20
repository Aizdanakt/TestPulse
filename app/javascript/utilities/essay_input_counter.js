document.addEventListener('turbo:render', essayInputCounter);
document.addEventListener('DOMContentLoaded', essayInputCounter);

function essayInputCounter() {
    const textarea = document.getElementById('essay_answer');
    const charCount = document.getElementById('char_count');

    if (textarea) {
        const savedText = localStorage.getItem('saved_essay');
        if (savedText) {
            textarea.value = savedText;
        }
        textarea.addEventListener('input', function() {
            const count = textarea.value.replace(/\s/g, '').length;
            charCount.textContent = 'Количество символов: ' + count;

            localStorage.setItem('saved_essay', textarea.value);
        });

        const form = document.querySelector('form');
        form.addEventListener('submit', function() {
            localStorage.removeItem('saved_essay');
        });
    }
}
