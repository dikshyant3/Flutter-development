import 'package:fifth_ui/models/notifications_model.dart';
import 'package:flutter/material.dart';

class NotificationsWidget extends StatelessWidget {

  final NotificationsModel notification;
  const NotificationsWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200)
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Unread indicator
          Container(
            width: 20,
            child: !notification.isRead 
              ? Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                )
              : SizedBox.shrink(),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue.shade100,
            backgroundImage: notification.userAvatar.isNotEmpty ? AssetImage('/assets/profile.jpg') : null,
            child: Text(
              notification.name[0].toUpperCase(),
              style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 12.0),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: notification.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0
                        ),
                      ),
                      TextSpan(
                        text: ' ${notification.action} ',
                        style: TextStyle(
                          fontSize: 14.0,
                        )
                      ),
                      TextSpan(
                        text: notification.targetName,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        )
                      )
                    ]
                  )
                ),
                SizedBox(height: 8.0,),
                Text(
                  notification.time,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                  ),
                ),
                if(notification.fileName != null) ...[
                  SizedBox(height: 16.0),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.insert_drive_file,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                        SizedBox(width: 8.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification.fileName!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                              ),
                              if(notification.fileSize != null)
                              Text(
                                notification.fileSize!,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          )
                        ),
                        Icon(
                          Icons.download_for_offline_rounded,
                          size: 20.0,
                          color: Colors.grey.shade600,
                        )
                      ],
                    ),
                  )
                ],
                // Action buttons for requests
                if(notification.hasActions) ...[
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: (){
                          print('Declined ${notification.name}');
                        }, 
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.grey.shade700,
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        child: Text('Decline'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          print('Accepted ${notification.name}');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Accept'),
                      ),
                    ],
                  )
                ]
              ],
            ),
          ),          
        ],
      ),
    );
  }
}