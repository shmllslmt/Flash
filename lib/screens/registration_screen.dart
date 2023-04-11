import 'package:flash/constants.dart';
import 'package:flash/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash/components/rounded_button.dart';
//Import firebase_auth.dart
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? email;
  String? password;

  //Create a private FirebaseAuth instance
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              //Receive email value
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: kTextInputFieldDecoration.copyWith(
                  hintText: 'Enter your email'),
            ),
            SizedBox(height: 8.0),
            TextField(
              style: TextStyle(color: Colors.black),
              //Receive password value
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: kTextInputFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(height: 24.0),
            RoundedButton(
              color: Colors.blueAccent,
              //Create User with Email and Password, then if successful, navigate to the ChatScreen
              onPressed: () async {
                try {
                  var userRegistered = await _auth.createUserWithEmailAndPassword(email: email!, password: password!);

                  if(userRegistered != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch(e) {
                  print(e);
                }
              },
              label: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
