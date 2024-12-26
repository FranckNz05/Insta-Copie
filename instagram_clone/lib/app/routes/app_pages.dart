import 'package:get/get.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import '../modules/auth/auth_binding.dart';
import '../modules/auth/auth_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/feed/feed_binding.dart';
import '../modules/feed/feed_view.dart';
import '../modules/search/search_binding.dart';
import '../modules/search/search_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import '../modules/comments/comments_binding.dart';
import '../modules/comments/comments_view.dart';
import '../modules/messages/messages_binding.dart';
import '../modules/messages/messages_view.dart';
import '../modules/story/story_binding.dart';
import '../modules/story/story_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.FEED,
      page: () => FeedView(),
      binding: FeedBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.COMMENTS,
      page: () => CommentsView(),
      binding: CommentsBinding(),
    ),
    GetPage(
      name: Routes.MESSAGES,
      page: () => MessagesView(),
      binding: MessagesBinding(),
    ),
    GetPage(
      name: Routes.STORY_VIEW,
      page: () => StoryView(),
      binding: StoryBinding(),
    ),
  ];
}
