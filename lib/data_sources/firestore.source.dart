import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreSource {
  //Firestore Database
  static String users = "users";
  static String get places => "places";
  static FirebaseFirestore db = FirebaseFirestore.instance;

  //Firestore Storage
  static Reference get storageReference => FirebaseStorage.instance.ref();
}
