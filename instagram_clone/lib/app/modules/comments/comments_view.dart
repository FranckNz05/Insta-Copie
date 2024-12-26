import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'comments_controller.dart';
import '../../data/mock_data.dart';

class CommentsView extends GetView<CommentsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Commentaires'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              
              return ListView.builder(
                itemCount: controller.comments.length,
                itemBuilder: (context, index) {
                  final comment = controller.comments[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: CachedNetworkImageProvider(
                            comment['userImage'],
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: comment['username'] + ' ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: comment['text']),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    comment['timeAgo'],
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    '${comment['likes']} J\'aime',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    'Répondre',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            comment['isLiked'] ?? false
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 16,
                            color: comment['isLiked'] ?? false
                                ? Colors.red
                                : Colors.grey,
                          ),
                          onPressed: () => controller.likeComment(index),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: CachedNetworkImageProvider(
                    MockData.currentUser['profileImage'],
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: controller.commentController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Ajouter un commentaire...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => controller.addComment(
                    controller.commentController.text,
                  ),
                  child: Text(
                    'Publier',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
