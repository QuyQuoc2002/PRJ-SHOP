function showToast(type, title, msg, header) {
    const main = document.getElementById('liveToast');
    const icons = {
        success: 'fas fa-check-circle text-success me-2',
        info: 'fas fa-info-circle text-info me-2',
        warning: 'fas fa-exclamation-circle text-warning me-2',
        error: 'fa-solid fa-triangle-exclamation text-danger me-2'
    };
    const icon = icons[type];
    main.innerHTML = `
        <div class="toast-header">
            <i class="${icon}"></i>     
            <strong class="me-auto">${header}</strong>
            <small>${title}</small>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            ${msg}
        </div>
    `;
    const toast = new bootstrap.Toast(main);
    toast.show();
}