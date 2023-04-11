import 'package:flash/screens/login_screen.dart';
import 'package:flash/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

//Add with SingleTickerProviderStateMixin to enable this state to act as the ticker provider for the AnimationController
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //Create an AnimationController object
  AnimationController? controller;
  //Create an Animation object
  Animation? animation;

  //Override the initState() method
  @override
  void initState() {
    super.initState();

    //Create an AnimationController, setting its duration and vsync
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    //Initialize the Animation object to a new CurvedAnimation()
    animation = CurvedAnimation(parent: controller!, curve: Curves.decelerate);
    
    //Call the forward() method - this is going to propel or start the animation
    controller!.forward();

    //Call the addListener() method, the setState() - this is the one that is going to update the animation of the UI
    controller!.addListener(() {
      setState(() {
      });
    });
  }

  //Override the dispose() method
  @override
  void dispose() {
    super.dispose();
    //Dispose the AnimationController object - to release the resources use for the animation
    controller!.dispose();
  }

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
                //Wrap the Container widget with a Hero widget, provide a tag
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    //Animate the size of the logo using the Animation object value
                    height: animation!.value * 100,
                  ),
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
            RoundedButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              label: 'Log In',
            ),
            RoundedButton(
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              label: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}