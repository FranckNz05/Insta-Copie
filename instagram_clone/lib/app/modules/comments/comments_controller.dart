import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/mock_data.dart';

class CommentsController extends GetxController {
  final String postId;
  final commentController = TextEditingController();
  final comments = [].obs;
  final isLoading = true.obs;

  CommentsController(this.postId);

  @override
  void onInit() {
    super.onInit();
    fetchComments();
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }

  Future<void> fetchComments() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 1)); // Simuler un délai réseau
      comments.value = MockData.comments
          .where((comment) => comment['postId'] == postId)
          .toList();
    } finally {
      isLoading.value = false;
    }
  }

  void addComment(String text) {
    if (text.isEmpty) return;

    final newComment = {
      'id': 'comment${comments.length + 1}',
      'postId': postId,
      'username': MockData.currentUser['username'],
      'userImage': MockData.currentUser['profileImage'],
      'text': text,
      'likes': 0,
      'timeAgo': 'À l\'instant',
      'isLiked': false,
    };

    comments.insert(0, newComment);
    commentController.clear();
  }

  void likeComment(int index) {
    final comment = comments[index];
    comment['isLiked'] = !(comment['isLiked'] ?? false);
    comment['likes'] += comment['isLiked'] ? 1 : -1;
    comments[index] = comment;
  }
}
