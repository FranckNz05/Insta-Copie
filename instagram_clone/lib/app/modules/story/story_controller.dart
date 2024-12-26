import 'package:get/get.dart';
import '../../data/mock_data.dart';

class StoryController extends GetxController {
  final currentStoryIndex = 0.obs;
  final stories = [].obs;
  final isLoading = true.obs;
  final progress = 0.0.obs;
  
  final String username;
  
  StoryController(this.username);
  
  @override
  void onInit() {
    super.onInit();
    fetchStories();
    startStoryTimer();
  }
  
  Future<void> fetchStories() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 1)); // Simuler un délai réseau
      
      // Récupérer les stories de l'utilisateur
      stories.value = MockData.stories
          .where((story) => story['username'] == username)
          .toList();
          
      // Marquer comme vue
      final userStoryIndex = MockData.stories.indexWhere(
        (story) => story['username'] == username,
      );
      if (userStoryIndex != -1) {
        MockData.stories[userStoryIndex]['isViewed'] = true;
      }
    } finally {
      isLoading.value = false;
    }
  }
  
  void startStoryTimer() {
    const duration = Duration(seconds: 5);
    const interval = Duration(milliseconds: 50);
    
    Future.doWhile(() async {
      await Future.delayed(interval);
      progress.value += interval.inMilliseconds / duration.inMilliseconds;
      
      if (progress.value >= 1.0) {
        nextStory();
        return false;
      }
      return true;
    });
  }
  
  void nextStory() {
    if (currentStoryIndex.value < stories.length - 1) {
      currentStoryIndex.value++;
      progress.value = 0.0;
      startStoryTimer();
    } else {
      Get.back();
    }
  }
  
  void previousStory() {
    if (currentStoryIndex.value > 0) {
      currentStoryIndex.value--;
      progress.value = 0.0;
      startStoryTimer();
    }
  }
  
  void pauseStory() {
    // TODO: Implémenter la pause
  }
  
  void resumeStory() {
    // TODO: Implémenter la reprise
  }
}
