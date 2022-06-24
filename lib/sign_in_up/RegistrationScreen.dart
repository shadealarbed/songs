import 'package:flutter/material.dart';
import 'package:senior_demo/audioPlayerPage/albumart.dart';
import 'package:senior_demo/sign_in_up/rounded_button.dart';
import 'package:senior_demo/sign_in_up/user.dart';
import 'package:senior_demo/sign_in_up/userDatabase.dart';

import '../../main.dart';
import 'LoginScreen.dart';
import 'constants1.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  State createState() {
    // TODO: implement createState
    return SignUpState();
  }
}

class SignUpState extends State {
  final formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameEditController = TextEditingController();
  final _emailEditController = TextEditingController();
  final _mobileEditController = TextEditingController();
  final _passwordEditController = TextEditingController();
  String email_pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String password_pattern = r'^[a-zA-Z0-9]{6,}$';
  String mobile_pattern = r'^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$';
  Size? size;
  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome"),
        backgroundColor: Color(0xff550062),
      ),
      backgroundColor: Color(0xff550062),
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [const Color(0xff550062), const Color(0xffef007e)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    stops: [0.5, 1],
                    tileMode: TileMode.mirror)),
            child: Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Hero(
                              tag: 'logo',
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffef007e).withOpacity(0.05),
                                    offset: const Offset(4, 4),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                ]),
                                height: 300.0,
                                child: Image.asset('logos/logo1.png'),
                              ),
                            ),
                            SizedBox(
                              height: 48,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              cursorColor: Color(0xffef007e),
                              controller: _nameEditController,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Name";
                                }
                                return null;
                              },
                              decoration: KTextFieldDecoration.copyWith(
                                  hintText: 'Enter your name'),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              cursorColor: Color(0xffef007e),
                              controller: _emailEditController,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                RegExp regex = RegExp(email_pattern);
                                if (!regex.hasMatch(value!))
                                  return 'Enter Valid Email';
                                else
                                  return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: KTextFieldDecoration.copyWith(
                                  hintText: 'Enter your email'),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              cursorColor: Color(0xffef007e),
                              controller: _mobileEditController,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                RegExp regex = RegExp(mobile_pattern);
                                if (!regex.hasMatch(value!))
                                  return 'Enter valid mobile number';
                                else
                                  return null;
                              },
                              keyboardType: TextInputType.number,
                              decoration: KTextFieldDecoration.copyWith(
                                  hintText: 'Enter your mobile number'),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              cursorColor: Color(0xffef007e),
                              obscureText: _isVisible ? false : true,
                              controller: _passwordEditController,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                RegExp regex = RegExp(password_pattern);
                                if (!regex.hasMatch(value!))
                                  return 'Password should be in alphanumaric with 6 characters';
                                else
                                  return null;
                              },
                              decoration: KPasswordTextFieldDecoration.copyWith(
                                hintText: 'Enter your password',
                                suffixIcon: IconButton(
                                  color: Color(0xffef007e),
                                  onPressed: () => updateStatus(),
                                  icon: Icon(_isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            RoundedButton(
                              title: 'Sign Up ',
                              color: Color(0xffef007e),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  UserDatabase.instance
                                      .insertUser(User(
                                          _nameEditController.text,
                                          _emailEditController.text,
                                          _passwordEditController.text,
                                          _mobileEditController.text))
                                      .then((result) {
                                    if (result == -1) {
                                      scaffoldKey.currentState?.showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'User with same number already existed $result')));
                                    } else {
                                      scaffoldKey.currentState?.showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'User Registered Succesfully $result')));
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                IntroScreen()),
                                      );
                                    }
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }

  TextStyle getTextStyle() {
    return TextStyle(fontSize: 18, color: Colors.pink);
  }

  InputDecoration customInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.teal),
      contentPadding: EdgeInsets.all(10),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.pink)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.pink)),
    );
  }
}
