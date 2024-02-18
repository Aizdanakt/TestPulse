Turbo.setConfirmMethod(() => {
    let dialog = document.getElementById("turbo-confirm");
    if (dialog) {
        dialog.showModal();

        return new Promise((resolve, reject) => {
            dialog.addEventListener("close", () => {
                resolve(dialog.returnValue === "confirm");
            }, { once: true });
        });
    }
});
