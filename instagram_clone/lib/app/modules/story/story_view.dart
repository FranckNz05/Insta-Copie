import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'story_controller.dart';
import '../../data/mock_data.dart';

class StoryView extends GetView<StoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) {
          final width = MediaQuery.of(context).size.width;
          if (details.globalPosition.dx < width / 2) {
            controller.previousStory();
          } else {
            controller.nextStory();
          }
        },
        onLongPressStart: (_) => controller.pauseStory(),
        onLongPressEnd: (_) => controller.resumeStory(),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          
          final currentStory = controller.stories[controller.currentStoryIndex.value];
          
          return Stack(
            children: [
              // Story Image
              CachedNetworkImage(
                imageUrl: currentStory['imageUrl'],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              
              // Progress Bar
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: List.generate(
                      controller.stories.length,
                      (index) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: LinearProgressIndicator(
                            value: index < controller.currentStoryIndex.value
                                ? 1.0
                                : index == controller.currentStoryIndex.value
                                    ? controller.progress.value
                                    : 0.0,
                            backgroundColor: Colors.grey[800],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              // User Info
              Positioned(
                top: MediaQuery.of(context).padding.top + 20,
                left: 16,
                right: 16,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: CachedNetworkImageProvider(
                        currentStory['userImage'],
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      currentStory['username'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      currentStory['timeAgo'],
                      style: TextStyle(color: Colors.white70),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              
              // Story Actions
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Envoyer un message',
                            hintStyle: TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white24,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Icons.favorite_border, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
