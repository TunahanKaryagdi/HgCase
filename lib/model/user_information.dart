import 'package:cloud_firestore/cloud_firestore.dart';

class UserInformation {
  final String id;
  final String nameSurname;
  final String email;
  final Timestamp date;
  final String bio;
  final List<String> hobbies;

  UserInformation(
      this.id, this.nameSurname, this.email, this.date, this.bio, this.hobbies);

  Map<String, dynamic> toMap() {
    return {
      'nameSurname': nameSurname,
      'email': email,
      'date': date,
      'bio': bio,
      'hobbies': hobbies
    };
  }

  factory UserInformation.fromSnapshot(DocumentSnapshot snapshot) {
    return UserInformation(
      snapshot.id,
      snapshot["nameSurname"],
      snapshot["email"],
      snapshot["date"],
      snapshot["bio"],
      (snapshot['hobbies'] as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }
}
