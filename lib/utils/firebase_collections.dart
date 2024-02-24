import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  users,
  hobbies;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
