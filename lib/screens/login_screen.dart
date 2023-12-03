import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/screens/main_job_searching_screen.dart';
import 'package:talentsync/screens/signup_screen.dart';
import '../models/colors.dart' as custom_colors;

import '../auth.dart';

class loginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  late String? _errorMessage = '';
  bool _isLogin = true;
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth()
          .signInWithEmailAndPassword(
            _controllerEmail.text,
            _controllerPassword.text,
          )
          .then((value) =>
              Navigator.of(context).pushNamed(MainJobSearch.routeName));
    } on FirebaseAuthException catch (e) {
      setState(
        () {
          _errorMessage = e.message;
        },
      );
    }
  }

  Widget _entryField(String hint, TextEditingController controller) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.08,
      child: TextField(
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.015,
        ),
        obscureText: controller == _controllerEmail ? false : !_passwordVisible,
        obscuringCharacter: '*',
        cursorColor: custom_colors.primaryBlue,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.02,
            ),
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.015,
                fontWeight: FontWeight.w400,
                color: custom_colors.primaryBlue.withOpacity(0.2)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * 0.015,
            )),
            suffixIcon: IconButton(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.02,
                MediaQuery.of(context).size.width * 0.012,
                MediaQuery.of(context).size.width * 0.025,
                MediaQuery.of(context).size.width * 0.2,
              ),
              icon: Icon(
                controller == _controllerEmail
                    ? Icons.email_outlined
                    : (_passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                color: custom_colors.secondaryBlue,
                size: MediaQuery.of(context).size.width * 0.022,
              ),
              onPressed: (() {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              }),
            )),
      ),
    );
  }

  Widget errorMessage() {
    return Text(
      _errorMessage == '' ? '' : 'Hmm? $_errorMessage',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: custom_colors.primaryBlue,
        fontSize: MediaQuery.of(context).size.width * 0.015,
      ),
    );
  }

  Widget _submitButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        MediaQuery.of(context).size.width * 0.015,
      ),
      child: Container(
        decoration: const BoxDecoration(),
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.width * 0.05,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: custom_colors.secondaryBlue),
          onPressed: (() {
            signInWithEmailAndPassword();
          }),
          child: Text(
            'LOG IN',
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.015,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: (() {
        setState(() {
          _isLogin = !_isLogin;
          Navigator.of(context).pushNamed(RegisterScreen.routeName);
        });
      }),
      child: Text(
        _isLogin ? 'SIGN UP' : 'LOGIN',
        style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: MediaQuery.of(context).size.width * 0.012,
            color: custom_colors.secondaryDarkBlue,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          width: 1000,
          height: double.infinity,
          decoration: BoxDecoration(
            color: custom_colors.backgroundWhite,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: custom_colors.secondaryDarkBlue.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Text(
                "LOG IN",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.020,
                    color: custom_colors.primaryBlue),
              ),
            ),
            Text(
              'Email',
              style: TextStyle(
                  color: custom_colors.primaryBlue,
                  fontSize: MediaQuery.of(context).size.width * 0.015,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 16,
            ),
            _entryField(
              'Enter your email address...',
              _controllerEmail,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Password',
              style: TextStyle(
                  color: custom_colors.primaryBlue,
                  fontSize: MediaQuery.of(context).size.width * 0.015,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            _entryField(
              'Enter your password...',
              _controllerPassword,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: errorMessage(),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: _submitButton(),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isLogin ? 'Don\'t have an account?' : 'Already a user?',
                  style: TextStyle(
                      color: custom_colors.primaryBlue,
                      fontSize: MediaQuery.of(context).size.width * 0.012),
                ),
                const SizedBox(
                  width: 20,
                ),
                _loginOrRegisterButton(),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
