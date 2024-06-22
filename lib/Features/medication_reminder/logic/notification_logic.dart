import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:gbsub/Core/services/notification_controller.dart';

setNotification(hour, minute, name, type) {
  AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod);
  AwesomeNotifications().createNotification(
    schedule: NotificationCalendar(hour: hour, minute: minute, repeats: true),
    content: NotificationContent(
      id: 1,
      channelKey: 'basicChannel',
      title: "تذكير بميعاد دواء",
      body: "لا تنسى تناول $type الدواء الخاص بك $name",
    ),
  );
}
