// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:frontend/configs/colors.dart';
import 'package:frontend/ui/screens/signin/widgets/custom_circle_button.dart';

import '../../../routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen();

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // text field state
  String email = '';
  String password = '';
  String error = '';
  bool _passwordIsHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteGrey,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 45,
                      ),
                      Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      // Email Text field
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Email address'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      // Password Text Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: GestureDetector(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordIsHidden = !_passwordIsHidden;
                                });
                              },
                              icon: Icon(
                                _passwordIsHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        obscureText: _passwordIsHidden,
                        validator: (val) => val.length < 8
                            ? 'Enter a password 8+ characters long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      const SizedBox(
                        height: 66,
                      ),
                      CustomCircleButton(
                        onPressed: () async {
                          await AppNavigator.replaceWith(Routes.home);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Need to create an account?',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.lightRed),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                ContinuousRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0)))),
                        onPressed: () async {
                          await AppNavigator.replaceWith(Routes.signup);
                        },
                        child: const Text(
                          'Signup',
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
