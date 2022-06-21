import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior_demo/sign_in_up/rounded_button.dart';

import 'LoginScreen.dart';
import 'RegistrationScreen.dart';

const colorizeColors = [
  Colors.black,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff550062),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0xff550062), const Color(0xffef007e)],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                stops: [0.5, 1],
                tileMode: TileMode.mirror)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('assets/logo.png'),
                  height: 90.0,
                ),
              ),
              Row(
                children: <Widget>[
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Song Generator App',
                        textStyle: TextStyle(
                          fontSize: 36.9,
                        ),
                        colors: colorizeColors,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              RoundedButton(
                  title: 'Log In',
                  color: Color(0xffef007e),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
              RoundedButton(
                title: 'Register ',
                color: Color(0xffef007e),
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
