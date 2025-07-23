import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  getCurrentUser(){
    return firebaseAuth.currentUser;
  }

  signOut(){
    return firebaseAuth.signOut();
  }

  deleteAccount(){
    User? user = firebaseAuth.currentUser;
    return user?.delete();
  }

}