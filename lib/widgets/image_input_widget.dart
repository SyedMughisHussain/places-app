import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ImageInputWidet extends StatefulWidget {
  final Function onSelectImage;

  const ImageInputWidet(this.onSelectImage, {super.key});

  @override
  State<ImageInputWidet> createState() => _ImageInputWidetState();
}

class _ImageInputWidetState extends State<ImageInputWidet> {
  File? _storedImage;

  Future<void> pickAndSaveImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    setState(() {
      if (pickedImage == null) {
        return;
      }
      _storedImage = File(pickedImage.path);
    });
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = path.basename(pickedImage!.path);
    final savedImagePath = path.join(appDir.path, fileName);
    final imageFile = File(pickedImage.path);
    final savedImage = await imageFile.copy(savedImagePath);
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
          height: 100,
          width: 150,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                )
              : const Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: ElevatedButton.icon(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.purple)),
              onPressed: pickAndSaveImage,
              icon: const Icon(Icons.camera),
              label: const Text('Take Picture')),
        )
      ],
    );
  }
}
