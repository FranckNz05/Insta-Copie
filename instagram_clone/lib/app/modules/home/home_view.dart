import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import '../feed/feed_view.dart';
import '../search/search_view.dart';
import '../profile/profile_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            FeedView(), // Page d'accueil avec les stories et posts
            SearchView(), // Page de recherche
            Container(
              color: Colors.black,
              child: Center(
                child: Text(
                  'Créer un post',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ), // Page de création de post
            Container(
              color: Colors.black,
              child: Center(
                child: Text(
                  'Activités',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ), // Page d'activités
            ProfileView(), // Page de profil
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Rechercher',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              activeIcon: Icon(Icons.add_box),
              label: 'Créer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: 'Activités',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
