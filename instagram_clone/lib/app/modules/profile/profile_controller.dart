import 'package:get/get.dart';

class ProfileController extends GetxController {
  final user = Rxn<Map<String, dynamic>>();
  final posts = [].obs;
  final followers = [].obs;
  final following = [].obs;
  final isLoading = true.obs;
  final isGridView = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    try {
      isLoading.value = true;
      
      // Temporary mock data
      user.value = {
        'username': 'test_user',
        'fullName': 'Test User',
        'bio': 'This is a test bio',
        'profileImage': 'https://via.placeholder.com/150',
      };

      // Mock posts data
      posts.value = List.generate(9, (index) => {
        'imageUrl': 'https://via.placeholder.com/300',
        'caption': 'Post caption $index',
        'likes': index * 10,
        'timestamp': DateTime.now().subtract(Duration(days: index)).toString(),
      });

      // Mock followers and following
      followers.value = List.generate(15, (index) => 'follower_$index');
      following.value = List.generate(20, (index) => 'following_$index');

    } catch (e) {
      print('Error loading profile: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleViewMode() {
    isGridView.value = !isGridView.value;
  }

  void editProfile() {
    // TODO: Implement edit profile
  }

  Future<void> signOut() async {
    // Removed Firebase sign out
    Get.offAllNamed('/auth');
  }
}
