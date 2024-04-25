import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_place/provider/user_places.dart';
import 'package:your_place/widget/image_input.dart';
import 'package:your_place/widget/location_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || _selectedImage == null) {
      showDialog(
        context: context,
        builder: (ctx) => const Text('Add something'),
      );
      return;
    }
    ref
        .read(userPlaceProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
                controller: _titleController),
            const SizedBox(
              height: 10,
            ),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(height: 10),
            LocationInput(),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
