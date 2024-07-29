import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

import '../theme/app_theme.dart';

class ImageDialog extends StatelessWidget {
  final File imageFile;
  final Function(File) onSave;

  const ImageDialog({
    Key? key,
    required this.imageFile,
    required this.onSave,
  }) : super(key: key);

  Future<void> _cropImage(BuildContext context) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Kırp',
          toolbarColor: customBlue,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: customBlue,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      ],
    );
    if (croppedFile != null) {
      onSave(File(croppedFile.path));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Resmi Düzenle',
        style: TextStyle(color: customBlue),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => _cropImage(context),
            child: Image.file(
              imageFile,
              fit: BoxFit.contain,
              height: 200,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _cropImage(context),
            child: const Text(
              'Kırp ve Kaydet',
              style: TextStyle(color: customBlue),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'İptal',
            style: TextStyle(color: customBlue),
          ),
        ),
      ],
    );
  }
}
