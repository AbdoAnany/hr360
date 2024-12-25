
import 'dart:convert';
import 'dart:html' as html;
import 'dart:js' as js;

class WebNotificationService {
  Future<void> showNotification({
    required String title,
    String? body,
    String? icon,
    String? tag,
    Map<String, dynamic>? data,
  }) async {
    try {
      // Check if notification is supported
      if (!html.Notification.supported) {
        print('Notifications not supported');
        return;
      }

      // Request permission first
      final permission = await html.Notification.requestPermission();

      if (permission == 'granted') {
        // Method 1: Using dart:html
        try {
          final notification = html.Notification(
            title,
            body: body,
            icon: icon,
            tag: tag,
          );

          notification.onClick.listen((event) {
            print('Notification clicked');
            if (data != null) {
              print('Notification data: $data');
            }
          });
        } catch (e) {
          print('Native notification failed, falling back to JS: $e');
          // Method 2: Fallback to JavaScript implementation
          js.context.callMethod('showNotification', [title, body]);
        }

        // Set up callback function for JavaScript
        js.context['myFunc'] = () {
          print('Notification clicked from JavaScript');
          print('Title: $title');
          print('Body: $body');
          if (data != null) {
            print('Data: $data');
          }
        };
      } else {
        print('Notification permission denied');
      }
    } catch (e) {
      print('Error showing notification: $e');
    }
  }
}

// Usage example:
final notificationService = WebNotificationService();

void showWebInWindowNotification({
  String? title,
  String? message,
  String? tag,
  Map<String, dynamic>? data,
  String? icon,
}) async {
  await notificationService.showNotification(
    title: title ?? 'Notification',
    body: message ?? '',
    tag: tag,
    data: data,
    icon: icon,
  );
}