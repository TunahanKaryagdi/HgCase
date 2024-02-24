import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_information.dart';
import '../utils/firebase_collections.dart';

class LoginViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference instance = FirebaseCollections.users.reference;

  Future<bool> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user == null) return false;
      return true;
    } catch (e) {
      return false;
    }
  }
}
