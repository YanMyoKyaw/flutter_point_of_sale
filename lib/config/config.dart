import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

const FILE_PATH = 'http://192.168.42.23:8080/content';

Future<File> pickAndCropImg() async {
  final picker = ImagePicker();
  final pickFile = await picker.getImage(source: ImageSource.gallery);
  File croppedFile = await ImageCropper.cropImage(
      sourcePath: pickFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'YMK Pos',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        title: 'YMK Pos',
        minimumAspectRatio: 1.0,
      ));
  return croppedFile;
}
