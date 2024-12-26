import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'messages_controller.dart';
import '../../data/mock_data.dart';

class MessagesView extends GetView<MessagesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text(
              MockData.currentUser['username'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.video_call_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Barre de recherche
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Rechercher',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          
          // Liste des messages
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              
              return ListView.builder(
                itemCount: controller.conversations.length,
                itemBuilder: (context, index) {
                  final conversation = controller.conversations[index];
                  final otherUser = conversation['participants']
                      .firstWhere((username) => username != MockData.currentUser['username']);
                  final otherUserData = MockData.users
                      .firstWhere((user) => user['username'] == otherUser);
                  
                  return ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: CachedNetworkImageProvider(
                            otherUserData['profileImage'],
                          ),
                        ),
                        if (otherUserData['isOnline'])
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    title: Text(
                      otherUserData['username'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: Text(
                            conversation['lastMessage'],
                            style: TextStyle(
                              color: conversation['unreadCount'] > 0
                                  ? Colors.white
                                  : Colors.grey,
                              fontWeight: conversation['unreadCount'] > 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          ' · ${conversation['lastMessageTime']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: conversation['unreadCount'] > 0
                        ? Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          )
                        : null,
                    onTap: () {
                      // Ouvrir la conversation
                      Get.toNamed(
                        '/chat',
                        arguments: {
                          'conversationId': conversation['id'],
                          'otherUser': otherUserData,
                        },
                      );
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
