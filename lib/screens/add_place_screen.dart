import 'package:flutter/material.dart';

import '../widgets/image_input_widget.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
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
                    const ImageInputWidet()
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.purple),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Place')),
        ],
      ),
    );
  }
}
