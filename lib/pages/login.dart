import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseaut/pages/home.dart';
import 'package:firebaseaut/pages/register.dart';
import 'package:firebaseaut/service/database.dart';
import 'package:firebaseaut/service/shared_preference.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String? userId;
  bool isLoading = true;

  Future<void> isLoggedIn() async {
    userId = await SharedPreference().getUserId();
    if(userId != null && userId!.isNotEmpty){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }
    // print(userId);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoggedIn();
  }

  Future<void> loginUserMethod() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      // print(querySnapshot.docs[0]['Name']);
      QuerySnapshot querySnapshot = await Database().getUserDetailByEmail(emailController.text);
      // Save data to local shared preference
      await SharedPreference().setUserID(querySnapshot.docs[0]['Id']);
      await SharedPreference().setUserName(querySnapshot.docs[0]['Name']);
      await SharedPreference().setUserEmail(querySnapshot.docs[0]['Email']);
      // Redirect to home
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      // Success message
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  Text('Sign In successfully'),
                ],
              ),
            ],
          ),
        ),
      );

    } on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text('No user found for that email!',
            style: TextStyle(fontSize: 18.0),
          ),
        ));
      }else if(e.code == 'wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text('Wrong password provided by User!',
            style: TextStyle(fontSize: 18.0),
          ),
        ));
      }else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error: ${e.message}',
            style: TextStyle(fontSize: 18.0),
          ),
        ));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              color: Colors.blue,
              child: Column(
                children: [
                  Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock)
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      loginUserMethod();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text('SUBMIT', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      SizedBox(width: 5.0,),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Register()));
                        },
                        child: Text('Sign Up', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
