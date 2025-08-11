import 'package:fifth_ui/widgets/notifications_widget.dart';
import 'package:flutter/material.dart';
import '../models/notifications_model.dart';

class NotificationsViewModel {
  
  static List<NotificationsModel> getAllNotifications() {
    return [
      NotificationsModel(
        id: '1',
        name: 'John Doe 👨‍🏫',
        action: 'added a file to',
        targetName: 'HeathCare Product Dark V1',
        time: '5m ago',
        type: NotificationType.fileAdded,
        userAvatar: '',
        fileName: 'T2 Design system.fig',
        fileSize: '985.2 mb',
        isRead: false,
      ),
      NotificationsModel(
        id: '2',
        name: 'Kristin Watson ⭐',
        action: 'make you the editor of',
        targetName: 'Solah',
        time: '12m ago',
        type: NotificationType.editorInvitation,
        userAvatar: '',
        isRead: true,
      ),
      NotificationsModel(
        id: '3',
        name: 'Alex Adams 🔥',
        action: 'request edit access to',
        targetName: 'Design Audit File',
        time: '7h ago',
        type: NotificationType.accessRequest,
        userAvatar: '',
        hasActions: true,
        isRead: true,
      ),
      NotificationsModel(
        id: '4',
        name: 'Jones Smith 😇',
        action: '3 Comments on',
        targetName: 'HeathCare Product',
        time: 'Aug 30',
        type: NotificationType.comment,
        userAvatar: '',
        isRead: true,
      ),
      NotificationsModel(
        id: '5',
        name: 'Ralph Edwards 😎',
        action: 'invited you to',
        targetName: 'Mymanu - Omotive',
        time: 'Jul 21',
        type: NotificationType.projectInvitation,
        userAvatar: '',
        hasActions: true,
        isRead: true,
      ),
    ];
  }

  // Sample data for Mentioned tab
  static List<NotificationsModel> getMentionedNotifications() {
    return [
      NotificationsModel(
        id: '6',
        name: 'Sarah Johnson',
        action: 'mentioned you in',
        targetName: 'Design Review',
        time: '2h ago',
        type: NotificationType.comment,
        userAvatar: '',
        isRead: true,
      ),
      NotificationsModel(
        id: '7',
        name: 'Mike Chen',
        action: 'tagged you in',
        targetName: 'UI Components',
        time: '4h ago',
        type: NotificationType.comment,
        userAvatar: '',
        isRead: false,
      ),
    ];
  }

  // Sample data for Request tab
  static List<NotificationsModel> getRequestNotifications() {
    return [
      NotificationsModel(
        id: '8',
        name: 'Emma Wilson',
        action: 'wants to collaborate on',
        targetName: 'Mobile App Design',
        time: '1h ago',
        type: NotificationType.accessRequest,
        userAvatar: '',
        hasActions: true,
        isRead: false,
      ),
      NotificationsModel(
        id: '9',
        name: 'David Lee',
        action: 'requested access to',
        targetName: 'Brand Guidelines',
        time: '3h ago',
        type: NotificationType.accessRequest,
        userAvatar: '',
        hasActions: true,
        isRead: true,
      ),
    ];
  }
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> with SingleTickerProviderStateMixin {
  
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _getNotificationCount(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return NotificationsViewModel.getAllNotifications().length;
      case 1:
        return NotificationsViewModel.getMentionedNotifications().length;
      case 2:
        return NotificationsViewModel.getRequestNotifications().length;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
            color: Colors.black87
          ),
          ),
          actions: [
            IconButton(
          icon: Icon(
            Icons.close, 
            color: Colors.black87,
            size: 18.0,
            ),
          onPressed: () => Navigator.pop(context),
        ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade200, width: 1),
              ),
            ),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey.shade600,
            labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
            ),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.blue, width:2)
            ),
            tabs: [
              Tab(
                child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                    Text('View All'),
                    SizedBox(width: 6),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${_getNotificationCount(0)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                   ]
                )
              ),
              Tab(
                child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                    Text('Mentioned'),
                    SizedBox(width: 6),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${_getNotificationCount(1)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                   ]

                )
              ),
              Tab(
                child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                    Text('Request'),
                    SizedBox(width: 6),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${_getNotificationCount(2)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                   ]

                )
              ),
            ],
          ),
        ),
      ),
    ),
    body: Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
          color: Colors.grey.shade100,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
              GestureDetector(
              onTap: (){
                print('Mark all as read');
              }, 
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.blue,
                  ),
                  Text(
                    'Mark all as read',
                    style: TextStyle(
                      color: Colors.blueAccent.shade400,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              )
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView(
                children: NotificationsViewModel.getAllNotifications().map((notification)=> NotificationsWidget(notification: notification)).toList(),
              ),
              ListView(
                children: NotificationsViewModel.getMentionedNotifications()
                    .map((notification) => NotificationsWidget(notification: notification))
                    .toList(),
              ),
              
              // Tab 3: Request Notifications
              ListView(
                children: NotificationsViewModel.getRequestNotifications()
                    .map((notification) => NotificationsWidget(notification: notification))
                    .toList(),
              ),
            ]
          ),
        ),
      ],
    )
    );
  }
}