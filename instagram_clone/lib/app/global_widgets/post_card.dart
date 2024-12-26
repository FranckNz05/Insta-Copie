import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                post['userProfileImage'] ?? '',
              ),
            ),
            title: Text(
              post['username'] ?? '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(post['location'] ?? ''),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // TODO: Implement post options
              },
            ),
          ),
          // Post Image
          CachedNetworkImage(
            imageUrl: post['imageUrl'] ?? '',
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
          ),
          // Post Actions
          Row(
            children: [
              IconButton(
                icon: Icon(
                  post['isLiked'] ?? false
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: post['isLiked'] ?? false ? Colors.red : null,
                ),
                onPressed: () {
                  // TODO: Implement like functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.comment_outlined),
                onPressed: () {
                  // TODO: Implement comment functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.send_outlined),
                onPressed: () {
                  // TODO: Implement share functionality
                },
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  post['isSaved'] ?? false
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                ),
                onPressed: () {
                  // TODO: Implement save functionality
                },
              ),
            ],
          ),
          // Likes Count
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '${post['likes']?.length ?? 0} likes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Caption
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: '${post['username']} ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: post['caption'] ?? ''),
                ],
              ),
            ),
          ),
          // Timestamp
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              timeago.format(
                (post['timestamp'] as dynamic)?.toDate() ?? DateTime.now(),
              ),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
