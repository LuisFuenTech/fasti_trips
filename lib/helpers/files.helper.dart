import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FilesHelper {
  Future<String> getFilePath() async {
    return (await getApplicationDocumentsDirectory()).path;
    //return appDocumentDirector.path; // /data/user/0/com.luisfuentech.fasti_trips/app_flutter
  }

  Future<void> saveFile(
      {required File file,
      required String type,
      required String fileName,
      String text = ""}) async {
    String path = await getFilePath();
    String defaultFileName =
        fileName.isEmpty ? DateTime.now().toString() : fileName;

    switch (type) {
      case "image":
        await _saveImageFile(file: file, path: "$path/$defaultFileName");
        break;
      case 'text':
        await _saveTextFile(
            file: file, path: "$path/$defaultFileName", text: text);
        break;
      default:
        break;
    }
  }

  ImageProvider pictureValidation(String pathImage, bool internet) {
    if (internet) {
      return CachedNetworkImageProvider(pathImage);
    } else if (pathImage.contains('http')) {
      return NetworkImage(pathImage);
    } else if (pathImage.contains("assets")) {
      return AssetImage(pathImage);
    } else {
      return FileImage(File(pathImage));
    }
  }

  Future<void> _saveImageFile(
      {required File file, required String path}) async {
    await file.copy(path);
  }

  Future<void> _saveTextFile(
      {required File file, required String path, required String text}) async {
    await file.copy(path);
  }
}
