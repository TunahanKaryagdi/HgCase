import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_information.dart';
import '../utils/firebase_collections.dart';

class RegisterViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference instance = FirebaseCollections.users.reference;

  Future<bool> register(UserInformation userInfo, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userInfo.email, password: password);

      if (userCredential.user == null) return false;
      await instance.add(userInfo.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
