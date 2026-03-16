import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_profile_app/pages/home_page.dart';
import 'package:social_profile_app/pages/signup.dart';

class AuthFlowPage extends StatelessWidget {
  const AuthFlowPage({super.key});
  static String id = 'main screen';

  @override
  Widget build(Object context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return SignUpPage();
          }
        },
      ),
    );
  }
}
