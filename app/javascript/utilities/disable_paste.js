document.addEventListener('turbo:render', disablePaste);
document.addEventListener('DOMContentLoaded', disablePaste);

function disablePaste() {
    const textArea = document.getElementById('essay_answer');

    if(textArea){
        textArea.addEventListener('paste', function (e) {
            e.preventDefault();
        });
    }
}
