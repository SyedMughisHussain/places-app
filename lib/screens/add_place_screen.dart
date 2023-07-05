//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:places_app/providers/user_places.dart';

import '../widgets/image_input_widget.dart';
import 'package:provider/provider.dart';
//import '../models/place.dart';
import 'dart:io';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File? pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    //print("save button pressed");
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<UserPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        // enabledBorder: OutlineInputBorder(
                        //     borderSide:
                        //         BorderSide(width: 3, color: Colors.purple)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        hintText: 'Title',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ImageInputWidet(_selectImage)
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.purple),
              ),
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place')),
        ],
      ),
    );
  }
}
