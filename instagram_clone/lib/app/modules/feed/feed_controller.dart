import 'package:get/get.dart';
import '../../data/mock_data.dart';

class FeedController extends GetxController {
  final stories = [].obs;
  final posts = [].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStories();
    fetchPosts();
  }

  Future<void> fetchStories() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 1)); // Simuler un délai réseau
      stories.value = MockData.stories;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 1)); // Simuler un délai réseau
      posts.value = MockData.posts;
    } finally {
      isLoading.value = false;
    }
  }

  void likePost(int index) {
    final post = posts[index];
    if (post['isLiked'] ?? false) {
      post['likes']--;
      post['isLiked'] = false;
    } else {
      post['likes']++;
      post['isLiked'] = true;
    }
    posts[index] = post;
  }

  void bookmarkPost(int index) {
    final post = posts[index];
    post['isBookmarked'] = !(post['isBookmarked'] ?? false);
    posts[index] = post;
  }
}
