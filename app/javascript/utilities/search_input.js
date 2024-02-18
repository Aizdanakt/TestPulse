document.addEventListener('turbo:render', searchInput);
document.addEventListener('DOMContentLoaded', searchInput);

function searchInput() {
    const searchInput = document.getElementById('searchInput');
    const studentTable = document.getElementById('student-table')

    if (searchInput) {
        const rows = studentTable.querySelectorAll('tbody tr');
        searchInput.addEventListener('input', function() {
            const searchText = this.value.toLowerCase();

            rows.forEach(function(row) {
                const groupCell = row.querySelector('td:nth-child(2)');
                const groupText = groupCell.textContent.toLowerCase();

                if (groupText.includes(searchText)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    }
}

