import 'package:flutter/material.dart';
import 'package:my_app/models/learning_material.dart';

class LearningMaterialDetailScreen extends StatelessWidget {
  final LearningMaterial material;

  const LearningMaterialDetailScreen({Key? key, required this.material})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(material.title),
      ),
      body: Center(
        child: Text(material.description),
      ),
    );
  }
}
