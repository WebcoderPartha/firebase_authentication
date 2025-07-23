import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseaut/pages/home.dart';
import 'package:firebaseaut/pages/login.dart';
import 'package:firebaseaut/service/database.dart';
import 'package:firebaseaut/service/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> registration() async {
    if(passwordController.text != '' && nameController.text != "" && emailController.text != ""){
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);

        String Id = randomNumeric(10);

        Map<String, dynamic> userInfoMap = {
          "Id": Id,
          "Name": nameController.text,
          "Email": emailController.text,
        };

        // Store data to locally shared preference throw
        await SharedPreference().setUserID(Id);
        await SharedPreference().setUserName(nameController.text);
        await SharedPreference().setUserEmail(emailController.text);
        // Store data to firebase database
        await Database().addUserDetails(userInfoMap, Id);
        // Redirect to page
        // Success message
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    Text('Sign up successfully'),
                  ],
                ),
              ],
            ),
          ),
        );

      } on FirebaseAuthException catch (e){
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text('Password provided is too weak!',
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text('Account already exists!',
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text('Error: ${e.message}',
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        }
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
                  Text('Register', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'Name',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person)
                      ),
                    ),
                  ),
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
                      registration();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text('Register', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
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
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text('Sign In', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),),
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
