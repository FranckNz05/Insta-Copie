import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_photo_alternate,
              size: 100,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  // TODO: Handle image selection
                  print('Selected image: ${image.path}');
                }
              },
              child: Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }
}
