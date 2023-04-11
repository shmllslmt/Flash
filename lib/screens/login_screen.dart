import 'package:flash/constants.dart';
import 'package:flash/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash/components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              onChanged: (value) {},
              keyboardType: TextInputType.emailAddress,
              //Use the copyWith() method to customise the hintText
              decoration: kTextInputFieldDecoration.copyWith(
                hintText: 'Enter your email'
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) {},
              obscureText: true,
              decoration: kTextInputFieldDecoration.copyWith(
                hintText: 'Enter your password'
              ),
            ),
            SizedBox(height: 24.0),
            RoundedButton(
              color: Colors.lightBlueAccent,
              //TODO: Step 26 - Sign In with Email and Password, then if successful, navigate to the ChatScreen
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id);
              },
              label: 'Log In',
            ),
          ],
        ),
      ),
    );
  }
}
