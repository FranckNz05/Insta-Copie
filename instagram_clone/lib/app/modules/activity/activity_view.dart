import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock activity data
    final activities = List.generate(
      20,
      (index) => {
        'username': 'user_$index',
        'action': index % 3 == 0
            ? 'liked your post'
            : index % 3 == 1
                ? 'commented on your post'
                : 'started following you',
        'time': '${index}h ago',
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Activity'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/50'),
            ),
            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: activity['username'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' ${activity['action']}'),
                ],
              ),
            ),
            subtitle: Text(activity['time']!),
            trailing: activity['action'] == 'started following you'
                ? ElevatedButton(
                    onPressed: () {},
                    child: Text('Follow'),
                  )
                : null,
          );
        },
      ),
    );
  }
}
