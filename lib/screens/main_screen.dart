import 'package:flutter/material.dart';
import 'package:my_app/screens/learning_material_list_screen.dart';
import 'package:my_app/screens/learning_material_upload_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LearningMaterialListScreen()),
                );
              },
              child: const Text('Learning Materials'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LearningMaterialUploadScreen()),
                );
              },
              child: const Text('Upload Material'),
            ),
          ],
        ),
      ),
    );
  }
}
