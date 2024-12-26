import 'package:get/get.dart';
import 'home_controller.dart';
import '../feed/feed_controller.dart';
import '../search/search_controller.dart';
import '../profile/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FeedController>(() => FeedController());
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
