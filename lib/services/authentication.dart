import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_profile_app/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // SIGN UP/CREATE USER
  Future<UserModel?> signUpUser(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName ?? '',
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }

  //SIGN OUT USER
  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }

  // LOGIN USER

  Future<UserModel?> loginUser(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        print("Login Sucessfuly");
        return UserModel(id: firebaseUser.uid, email: firebaseUser.email ?? '');
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
    return null;
  }
}
