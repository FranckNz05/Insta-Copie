import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'feed_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FeedView extends GetView<FeedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Instagram_logo.png/1200px-Instagram_logo.png',
          height: 32,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        
        return CustomScrollView(
          slivers: [
            // Stories
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.stories.length,
                  itemBuilder: (context, index) {
                    final story = controller.stories[index];
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: story['isViewed']
                                    ? [Colors.grey, Colors.grey]
                                    : [Colors.purple, Colors.orange],
                              ),
                            ),
                            padding: EdgeInsets.all(2),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundImage: CachedNetworkImageProvider(
                                story['imageUrl'],
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            story['username'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Divider
            SliverToBoxAdapter(
              child: Divider(color: Colors.grey[800]),
            ),
            
            // Posts
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final post = controller.posts[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            post['userImage'],
                          ),
                        ),
                        title: Text(
                          post['username'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          post['location'],
                          style: TextStyle(color: Colors.white70),
                        ),
                        trailing: Icon(Icons.more_horiz, color: Colors.white),
                      ),
                      
                      // Image
                      CachedNetworkImage(
                        imageUrl: post['imageUrl'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      
                      // Actions
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              post['isLiked'] ?? false
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: post['isLiked'] ?? false
                                  ? Colors.red
                                  : Colors.white,
                            ),
                            onPressed: () => controller.likePost(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.chat_bubble_outline),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.send),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              post['isBookmarked'] ?? false
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: Colors.white,
                            ),
                            onPressed: () => controller.bookmarkPost(index),
                          ),
                        ],
                      ),
                      
                      // Likes
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '${post['likes']} J\'aime',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                      // Caption
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: post['username'] + ' ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: post['caption']),
                            ],
                          ),
                        ),
                      ),
                      
                      // Comments
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Voir les ${post['comments']} commentaires',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      
                      // Time
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          'Il y a ${post['timeAgo']}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                childCount: controller.posts.length,
              ),
            ),
          ],
        );
      }),
    );
  }
}
