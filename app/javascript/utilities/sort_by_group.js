document.addEventListener('turbo:render', sortTableByGroup);
document.addEventListener('DOMContentLoaded', sortTableByGroup);


function sortTableByGroup() {
    const sortableColumn = document.querySelector('.sortable');
    if (sortableColumn){
        sortableColumn.addEventListener('click', function() {
            let rows = document.querySelectorAll('tbody > tr');
            const ascending = !this.classList.contains('asc');

            const headers = document.querySelectorAll('th');
            headers.forEach(function(header) {
                header.classList.remove('asc');
            });

            if (ascending) {
                this.classList.add('asc');
            } else {
                this.classList.remove('asc');
            }

            rows = Array.from(rows);

            rows.sort(function(row1, row2) {
                const group1 = row1.children[1].textContent;
                const group2 = row2.children[1].textContent;

                if (ascending) {
                    return group1.localeCompare(group2);
                } else {
                    return group2.localeCompare(group1);
                }
            });

            const tbody = document.querySelector('tbody');
            rows.forEach(function(row) {
                tbody.appendChild(row);
            });
        });
    }
}
