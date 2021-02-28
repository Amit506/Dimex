import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> anonymousSignIn() async {
    UserCredential userCredential = await AuthService.auth.signInAnonymously();

    return userCredential;
  }

  // Stream authState() async* {
  //   StreamSubscription<User> users =
  //       AuthService.auth.authStateChanges().listen((User user) {
  //     if (user == null) {
  //       print('User is currently signed out!');

  //       return null;
  //     } else {
  //       print('User is signed in!');
  //       return user;
  //     }
  //   });
  //   users.cancel();
  
  // }

  void signOut() async {
    await AuthService.auth.signOut();
  }
}
