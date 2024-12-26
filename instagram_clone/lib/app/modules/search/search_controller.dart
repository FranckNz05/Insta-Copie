import 'package:get/get.dart';

class SearchController extends GetxController {
  final searchResults = [].obs;
  final isLoading = false.obs;
  final searchQuery = ''.obs;

  // Mock data
  final List<Map<String, dynamic>> mockUsers = List.generate(
    10,
    (index) => {
      'username': 'user_$index',
      'fullName': 'User $index',
      'profileImage': 'https://via.placeholder.com/150',
      'type': 'user',
      'id': 'user_id_$index',
    },
  );

  final List<Map<String, dynamic>> mockPosts = List.generate(
    20,
    (index) => {
      'imageUrl': 'https://via.placeholder.com/300',
      'caption': 'Post caption $index #trending',
      'likes': index * 10,
      'type': 'post',
      'id': 'post_id_$index',
      'hashtags': ['trending', 'instagram', 'photo'],
    },
  );

  void onSearchChanged(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }
    performSearch();
  }

  Future<void> performSearch() async {
    try {
      isLoading.value = true;
      
      final query = searchQuery.value.toLowerCase();
      
      // Filter mock users
      final users = mockUsers.where((user) =>
          user['username'].toLowerCase().contains(query) ||
          user['fullName'].toLowerCase().contains(query)).toList();

      // Filter mock posts
      final posts = mockPosts.where((post) =>
          post['caption'].toLowerCase().contains(query) ||
          (post['hashtags'] as List).any((tag) => tag.toLowerCase().contains(query))).toList();

      searchResults.value = [...users, ...posts];
    } catch (e) {
      print('Error performing search: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
