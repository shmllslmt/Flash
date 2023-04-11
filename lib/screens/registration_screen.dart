import 'package:flash/constants.dart';
import 'package:flash/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash/components/rounded_button.dart';
//TODO: Step 20 - Import firebase_auth.dart

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //TODO: Step 21 - Create a private FirebaseAuth instance
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
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              //TODO: Step 18 - Receive email value
              onChanged: (value) {},
              keyboardType: TextInputType.emailAddress,
              decoration: kTextInputFieldDecoration.copyWith(
                hintText: 'Enter your email'
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              //TODO: Step 19 - Receive password value
              onChanged: (value) {},
              obscureText: true,
              decoration: kTextInputFieldDecoration.copyWith(
                hintText: 'Enter your password'
              ),
            ),
            SizedBox(height: 24.0),
            RoundedButton(
              color: Colors.blueAccent,
              //TODO: Step 22 - Create User with Email and Password, then if successful, navigate to the ChatScreen
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id);
              },
              label: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
