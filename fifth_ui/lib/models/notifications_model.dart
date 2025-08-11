class NotificationsModel {
  final String id;
  final String name;
  final String targetName;
  final String userAvatar;
  final String time;
  final NotificationType type;
  final String action;
  final String? fileName;
  final String? fileSize;
  final bool hasActions; 
  final bool isRead;

  NotificationsModel({
    required this.id,
    required this.name,
    required this.targetName,
    required this.userAvatar,
    required this.time,
    required this.type,
    required this.action,
    this.fileName,
    this.fileSize,
    this.hasActions = false,
    this.isRead = false,
  });
}

enum NotificationType {
  fileAdded,
  editorInvitation,
  accessRequest,
  comment,
  projectInvitation,
}