class NotificationEntity {
  final String id;
  final String userId;
  final String title;
  final String message;
  final String type; // 'general','booking','payment','promotion','system'
  final bool isRead;

  NotificationEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    this.type = 'general',
    this.isRead = false,
  });
}
