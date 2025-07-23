import 'package:firebaseaut/pages/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock)
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text('Register', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
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
