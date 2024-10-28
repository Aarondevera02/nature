import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, String>> notifications = [
    {
      "title": "View Aaron's feedback",
      "time": "3 hours ago",
      "icon": Icons.feedback_outlined.codePoint.toString(),
      "route": "feedbackPage",
    },
    {
      "title": "View 1 request plant",
      "time": "22 minutes ago",
      "icon": Icons.nature_outlined.codePoint.toString(),
      "route": "requestPlantPage",
    },
  ];

  void _navigateToPage(String route) {
    if (route == "feedbackPage") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FeedbackPage()),
      );
    } else if (route == "requestPlantPage") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RequestPlantPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: 800,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.teal,
                      child: Icon(
                        IconData(
                          int.parse(notification["icon"]!),
                          fontFamily: 'MaterialIcons',
                        ),
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      notification["title"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(notification["time"]!),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          notifications.removeAt(index);
                        });
                      },
                    ),
                    onTap: () {
                      _navigateToPage(notification["route"]!);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Dummy pages for feedback and request plant for notification neggaaa
class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Aaron's Feedback")),
      body: const Center(child: Text("Feedback details go here.")),
    );
  }
}

class RequestPlantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Request Plant")),
      body:const Center(child: Text("Request plant details go here.")),
    );
  }
}
