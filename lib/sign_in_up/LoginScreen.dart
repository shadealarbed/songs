
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:senior_demo/sign_in_up/rounded_button.dart';
import 'package:senior_demo/sign_in_up/userDatabase.dart';


import '../../main.dart';
import 'constants1.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State {
  final formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  Size? size;
  bool showSpinner = false;
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
      appBar: AppBar(title: Text("welcome"),backgroundColor: Color(0xff550062),),
      backgroundColor: Color(0xff550062),
      key: scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Hero(
                          tag: 'logo',
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Color(0xffef007e).withOpacity(0.05),
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                            ]),
                            child: Image.asset('logos/logo1.png'),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Color(0xffef007e),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          focusNode: _emailFocus,
                          onFieldSubmitted: (term) {
                            FocusScope.of(context).requestFocus(_passwordFocus);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter an email";
                            }
                            return null;
                          },
                          decoration: KTextFieldDecoration.copyWith(
                              hintText: 'Enter your email'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Color(0xffef007e),
                            obscureText: _isVisible ? false : true,
                            textInputAction: TextInputAction.done,
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            focusNode: _passwordFocus,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Password";
                              }
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
                            )),
                        SizedBox(
                          height: 24,
                        ),
                        RoundedButton(
                          title: 'Log In ',
                          color: Color(0xffef007e),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                showSpinner = true;
                              });
                              UserDatabase.instance
                                  .checkUserLogin(_emailController.text,
                                      _passwordController.text)
                                  .then((result) {
                                if (result == null) {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  scaffoldKey.currentState?.showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Please enter valid details")));
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IntroScreen()),
                                  );
                                }
                                setState(() {
                                  showSpinner = false;
                                });
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
