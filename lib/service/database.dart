import 'package:cloud_firestore/cloud_firestore.dart';

class Database{

  // Add user to firebase database
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async{
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  Future<QuerySnapshot> getUserDetailByEmail(String email) async {
    return await FirebaseFirestore.instance.collection('users').where('Email', isEqualTo: email).get();
  }

}