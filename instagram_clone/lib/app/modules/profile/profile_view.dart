import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'thisisfranknz',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Info
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[800],
                    child: Icon(Icons.person, size: 40, color: Colors.grey[600]),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn('1', 'Publications'),
                        _buildStatColumn('1847', 'Abonnés'),
                        _buildStatColumn('949', 'Abonnements'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bio
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Franck Nz',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '05 May \nprogramming enthusiast \nMy  = Me + My goals.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            // Edit Profile Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Modifier le profil'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey[800]!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Stories Highlights
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[800],
                          child: Icon(Icons.add, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 4),
                        Text(
                          index == 0 ? 'Nouveau' : 'Story ${index}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Posts Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 9,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
