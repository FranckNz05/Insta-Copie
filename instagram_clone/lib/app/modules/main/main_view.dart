import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/main_controller.dart';
import '../home/home_view.dart';
import '../search/search_view.dart';
import '../profile/profile_view.dart';

class MainView extends GetView<MainController> {
  final List<Widget> pages = [
    HomeView(),
    SearchView(),
    Container(), // Add Post Page
    Container(), // Reels Page
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              activeIcon: Icon(Icons.add_box),
              label: 'Add Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              activeIcon: Icon(Icons.video_library),
              label: 'Reels',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
