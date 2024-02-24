import 'package:firebase_auth/firebase_auth.dart';

class SplashViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? isLogged() {
    return _auth.currentUser;
  }
}
