document.addEventListener('turbo:render', checkIfAtLeastOneChecked);
document.addEventListener('DOMContentLoaded', checkIfAtLeastOneChecked);


function checkIfAtLeastOneChecked() {
    const checkboxes = document.querySelectorAll('.checkbox-js');
    const submitBtn = document.querySelector('input[type="submit"]');
    let atLeastOneChecked = false;

    if (checkboxes.length > 0) {
        checkboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                atLeastOneChecked = true;
            }
        });
        submitBtn.disabled = !atLeastOneChecked;
    }

    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', checkIfAtLeastOneChecked);
    });
}
