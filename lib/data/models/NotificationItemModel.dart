class NotificationItem {
  final String id;
  final String name;
  final String message;
  final String category;
  final String timestamp;
  final String imagePath;
  final String? voicePath;

  NotificationItem({
    required this.id,
    required this.message,
    required this.category,
    required this.timestamp, required this.imagePath, required this.name, this.voicePath,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      message: json['message'],
      category: json['category'],
      timestamp: json['timestamp'], imagePath: 'imagePath', name: 'name',
    );
  }
}
