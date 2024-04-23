// screens/learning_material_upload_screen.dart
import 'package:flutter/material.dart';
import 'package:my_app/services/learning_material_service.dart';
import 'package:my_app/models/learning_material.dart';

class LearningMaterialUploadScreen extends StatefulWidget {
  const LearningMaterialUploadScreen({super.key});

  @override
  _LearningMaterialUploadScreenState createState() =>
      _LearningMaterialUploadScreenState();
}

class _LearningMaterialUploadScreenState
    extends State<LearningMaterialUploadScreen> {
  final LearningMaterialService _learningMaterialService =
      LearningMaterialService();
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  // ... other form fields

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // 추가 코드 시작
      final material = LearningMaterial(
        title: _title,
        description: _description,
        id: '',
      );

      _learningMaterialService.uploadMaterial(material).then((_) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Learning material uploaded successfully')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to upload learning material')),
        );
      });
      // 추가 코드 끝
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Learning Material'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              // Add other form fields for learning material properties
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
