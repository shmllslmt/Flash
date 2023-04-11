import 'package:flash/constants.dart';
import 'package:flash/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;

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
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              //Use the copyWith() method to customise the hintText
              decoration: kTextInputFieldDecoration.copyWith(
                hintText: 'Enter your email'
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: kTextInputFieldDecoration.copyWith(
                hintText: 'Enter your password'
              ),
            ),
            SizedBox(height: 24.0),
            RoundedButton(
              color: Colors.lightBlueAccent,
              //Sign In with Email and Password, then if successful, navigate to the ChatScreen
              onPressed: () async {
                try {
                  var userLoggedIn = await _auth.signInWithEmailAndPassword(
                      email: email!, password: password!);

                  if (userLoggedIn != null)
                    Navigator.pushNamed(context, ChatScreen.id);
                } catch(e) {
                  print(e);
                }
              },
              label: 'Log In',
            ),
          ],
        ),
      ),
    );
  }
}
