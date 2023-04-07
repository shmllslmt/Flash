import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

//TODO: Step 7 - Add with SingleTickerProviderStateMixin to enable this state to act as the ticker provider for the AnimationController
class _WelcomeScreenState extends State<WelcomeScreen> {
  //TODO: Step 4 - Create an AnimationController object
  //TODO: Step 10 - Create an Animation object

  //TODO: Step 5 - Override the initState() method
  //TODO: Step 6 - Create an AnimationController, setting its duration and vsync
  //TODO: Step 11 - Initialize the Animation object to a new CurvedAnimation()
  //TODO: Step 8 - Call the forward() method - this is going to propel or start the animation
  //TODO: Step 9 - Call the addListener() method, the setState() - this is the one that is going to update the animation of the UI

  //TODO: Step 13 - Override the dispose() method
  //TODO: Step 14 - Dispose the AnimationController object - to release the resources use for the animation
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
            Row(
              children: [
                //TODO: Step 3 - Wrap the Container widget with a Hero widget, provide a tag
                Container(
                  child: Image.asset('images/logo.png'),
                  //TODO: Step 12 - Animate the size of the logo using the Animation object value
                  height: 60.0,
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            //TODO: Step 15 - Refactor the Padding widget into a new widget named RoundedButton, making sure, the color, onPressed and text values are mutable
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //TODO: Step 1 - Navigate to LoginScreen
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text('Log In'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //TODO: Step 2 - Navigate to RegistrationScreen
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text('Register'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
