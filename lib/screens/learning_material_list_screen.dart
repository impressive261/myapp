// screens/learning_material_list_screen.dart
import 'package:flutter/material.dart';
import 'package:my_app/models/learning_material.dart';
import 'package:my_app/screens/learning_material_detail_screen.dart';

class LearningMaterialListScreen extends StatelessWidget {
  final List<LearningMaterial> learningMaterials = [
    LearningMaterial(
      id: '1',
      title: 'Introduction to Flutter',
      description: 'Learn the basics of Flutter development',
      // ... other properties
    ),
    LearningMaterial(
      id: '2',
      title: 'Dart Programming Language',
      description: 'Master the Dart programming language',
      // ... other properties
    ),
    // Add more learning materials
  ];

  LearningMaterialListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Materials'),
      ),
      body: ListView.builder(
        itemCount: learningMaterials.length,
        itemBuilder: (context, index) {
          final material = learningMaterials[index];
          return ListTile(
            title: Text(material.title),
            subtitle: Text(material.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LearningMaterialDetailScreen(material: material),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
