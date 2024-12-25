function showNotification(title, message) {
    if (!("Notification" in window)) {
        console.log("This browser does not support notifications");
        return;
    }

    Notification.requestPermission().then(function(permission) {
        if (permission === "granted") {
            var notification = new Notification(title, {
                body: message,
//                icon: '/your-icon-path.png'  // Optional
            });

            notification.onclick = function() {
                window.focus();
                notification.close();
                // Call back to Dart if needed
                if (typeof window.myFunc === 'function') {
                    window.myFunc();
                }
            };
        }
    });
}