import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hg_task/model/user_information.dart';

import '../utils/firebase_collections.dart';

class HomeViewModel {
  final CollectionReference instance = FirebaseCollections.users.reference;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserInformation?> getUserInfos(String email) async {
    final snapshots = await instance.get();
    for (var element in snapshots.docs) {
      if (element["email"] == email) {
        return UserInformation.fromSnapshot(element);
      }
    }
    return null;
  }

  Future<void> addNewHobby(UserInformation user, String newHobby) async {
    List<String> newHobbies = user.hobbies;
    newHobbies.add(newHobby);
    await instance.doc(user.id).update({"hobbies": newHobbies});
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
