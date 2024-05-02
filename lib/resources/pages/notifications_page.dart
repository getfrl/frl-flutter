import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '/bootstrap/helpers.dart';
import 'package:frl_flutter/resources/widgets/custom_bottom_nav_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class NotificationsPage extends NyStatefulWidget {
  static const path = '/notifications';
  NotificationsPage() : super(path, child: _NotificationsPageState());
}

class _NotificationsPageState extends NyState<NotificationsPage> {
  List<Notification> notifications = [];

  @override
  init() async {
    // Simulate fetching notifications from an API
    await fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    // Simulated API call to fetch notifications
    await Future.delayed(Duration(seconds: 1));

    // Update the notifications list with the fetched data
    setState(() {
      notifications = [
        Notification(
          type: NotificationType.listFollow,
          username: "kkornievskaya",
          listTitle: "Quality Coffee Equipment",
        ),
        Notification(
          type: NotificationType.productRequestApproved,
          productTitle: "Dual Boiler™",
          listTitle: "Quality Coffee Equipment",
        ),
        Notification(
          type: NotificationType.userFollow,
          username: "itsahmad",
        ),
        Notification(
          type: NotificationType.votedProductList,
          username: "jb",
          listTitle: "Quality Coffee Equipment",
        ),
        // Add more notifications...
      ];
    });
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Activity")),
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(12),
                child: ListView.separated(
                  itemCount: notifications.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return _buildNotificationItem(notification);
                  },
                ),
              ),
            ),
          ),
          CustomBottomNav(currentIndex: 3),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(Notification notification) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFF262626).withOpacity(1.0),
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _buildNotificationContent(notification),
          ),
          if (notification.type == NotificationType.userFollow)
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Follow",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColor.get(context).primaryAccent,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationContent(Notification notification) {
    switch (notification.type) {
      case NotificationType.listFollow:
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "@${notification.username}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigate to the user's profile page
                    // Replace 'UserProfilePage' with the actual profile page widget
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UserProfilePage(
                    //       username: notification.username!,
                    //     ),
                    //   ),
                    // );
                  },
              ),
              TextSpan(
                text: " followed your list ",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: notification.listTitle!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigate to the list page
                    // Replace 'ListPage' with the actual list page widget
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ListPage(
                    //       listTitle: notification.listTitle!,
                    //     ),
                    //   ),
                    // );
                  },
              ),
            ],
          ),
        );
      case NotificationType.productRequestApproved:
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Your added product ",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: notification.productTitle!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigate to the product page
                    // Replace 'ProductPage' with the actual product page widget
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ProductPage(
                    //       productTitle: notification.productTitle!,
                    //     ),
                    //   ),
                    // );
                  },
              ),
              TextSpan(
                text: " has been approved and is added to your list ",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: notification.listTitle!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigate to the list page
                    // Replace 'ListPage' with the actual list page widget
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ListPage(
                    //       listTitle: notification.listTitle!,
                    //     ),
                    //   ),
                    // );
                  },
              ),
            ],
          ),
        );
      case NotificationType.userFollow:
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "@${notification.username}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigate to the user's profile page
                    // Replace 'UserProfilePage' with the actual profile page widget
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UserProfilePage(
                    //       username: notification.username!,
                    //     ),
                    //   ),
                    // );
                  },
              ),
              TextSpan(
                text: " started following you",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      case NotificationType.votedProductList:
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "@${notification.username}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigate to the user's profile page
                    // Replace 'UserProfilePage' with the actual profile page widget
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UserProfilePage(
                    //       username: notification.username!,
                    //     ),
                    //   ),
                    // );
                  },
              ),
              TextSpan(
                text: " voted a product in your list ",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: notification.listTitle!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigate to the list page
                    // Replace 'ListPage' with the actual list page widget
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ListPage(
                    //       listTitle: notification.listTitle!,
                    //     ),
                    //   ),
                    // );
                  },
              ),
            ],
          ),
        );
      default:
        return Text(
          "Unknown notification type",
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 14,
          ),
        );
    }
  }
}

enum NotificationType {
  listFollow,
  productRequestApproved,
  userFollow,
  votedProductList,
}

class Notification {
  final NotificationType type;
  final String? username;
  final String? listTitle;
  final String? productTitle;

  Notification({
    required this.type,
    this.username,
    this.listTitle,
    this.productTitle,
  });
}
