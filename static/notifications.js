document.addEventListener('DOMContentLoaded', () => {
    const bell = document.getElementById('notif-bell');
    const overlay = document.getElementById('notif-overlay');
    const indicator = document.getElementById('notif-indicator');
    const list = document.getElementById('notif-list');

    if (!bell) return;

    function fetchNotifications() {
        fetch('/notifications')
            .then(res => res.json())
            .then(data => {
                indicator.classList.toggle('active', data.unread_count > 0);
                list.innerHTML = '';
                if (data.notifications.length === 0) {
                    list.innerHTML = '<p class="no-notif">No new notifications</p>';
                } else {
                    data.notifications.forEach(n => {
                        const item = document.createElement('div');
                        item.className = 'notif-item' + (n.is_read ? '' : ' unread');
                        item.innerHTML = `<p>${n.message}</p><span class="notif-time">${n.created_at}</span>`;
                        list.appendChild(item);
                    });
                }
            });
    }

    bell.addEventListener('click', () => {
        const isOpen = overlay.classList.contains('open');
        overlay.classList.toggle('open', !isOpen);
        if (!isOpen) {
            fetch('/notifications/read', { method: 'POST' }).then(fetchNotifications);
        }
    });

    fetchNotifications();
    setInterval(fetchNotifications, 15000); // refresh every 15 seconds
});