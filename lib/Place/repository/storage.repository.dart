import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:travel_platzi/data_sources/firestore.source.dart';

class StorageRepository {
  final Reference storage = FirestoreSource.storageReference;

  Future<TaskSnapshot> uploadFile(String path, File file) async {
    return await storage.child(path).putFile(file); //.whenComplete(() => null);
  }
}
