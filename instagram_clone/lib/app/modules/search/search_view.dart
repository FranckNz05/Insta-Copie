import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'search_controller.dart' as local;
import '../../global_widgets/post_card.dart';

class SearchView extends GetView<local.SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Rechercher',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            ),
            onChanged: controller.onSearchChanged,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.searchQuery.isEmpty
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.grey[800],
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey[600],
                          ),
                        ),
                      );
                    },
                  )
                : _buildSearchResults(),
      ),
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: controller.searchResults.length,
      itemBuilder: (context, index) {
        final result = controller.searchResults[index];
        if (result['type'] == 'user') {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(result['profileImage'] ?? ''),
            ),
            title: Text(result['username'] ?? ''),
            subtitle: Text(result['bio'] ?? ''),
            onTap: () {
              // TODO: Navigate to user profile
            },
          );
        } else {
          return PostCard(post: result);
        }
      },
    );
  }
}
