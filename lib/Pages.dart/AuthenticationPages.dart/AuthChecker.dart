import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'AuthProvider.dart';
import 'SigninPage.dart';
import 'RegistrationPage.dart';
import 'package:dimex/Pages.dart/HomePage.dart/homePage.dart';

class AuthChecker extends StatefulWidget {
  @override
  _AuthCheckerState createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {

@override
  void initState() {
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<User>(
      stream:  AuthService.auth.authStateChanges(),
      builder: (context, snapshot) {
        print(snapshot.data);
 if(snapshot.hasData){
   return HomePage();
 }
 else{
   return Scaffold(
     body: Center(child: Text('fuck off'),),
   );
 }

      },
      
    );
  }
}