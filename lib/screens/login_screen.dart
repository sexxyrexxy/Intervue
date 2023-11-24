import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginscreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:talentsync/navigation.dart';
// import 'package:talentsync/screens/login_screen.dart';
// import '../models/colors.dart' as custom_colors;

// import '../auth.dart';

// class RegisterScreen extends StatefulWidget {
//   static const routeName = '/registerScreen';
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   late String? _errorMessage = '';
//   bool _isLogin = false;
//   bool _passwordVisible = false;

//   @override
//   void initState() {
//     _passwordVisible = false;
//     super.initState();
//   }

//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();

//   Future<void> signInWithEmailAndPassword() async {
//     try {
//       await Auth()
//           .signInWithEmailAndPassword(
//             _controllerEmail.text,
//             _controllerPassword.text,
//           )
//           .then(
//               (value) => Navigator.of(context).pushNamed(Navigation.routeName));
//     } on FirebaseAuthException catch (e) {
//       setState(
//         () {
//           _errorMessage = e.message;
//         },
//       );
//     }
//   }

//   Widget _entryField(String hint, TextEditingController controller) {
//     return Container(
//       width: 840,
//       child: TextField(
//         obscureText: controller == _controllerEmail ? false : !_passwordVisible,
//         obscuringCharacter: '*',
//         cursorColor: custom_colors.primaryBlue,
//         controller: controller,
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.fromLTRB(60, 60, 60, 60),
//             hintText: hint,
//             hintStyle: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.w400,
//                 color: custom_colors.primaryBlue.withOpacity(0.2)),
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
//             suffixIcon: IconButton(
//               padding: EdgeInsets.all(60),
//               icon: Icon(
//                 controller == _controllerEmail
//                     ? Icons.email_outlined
//                     : (_passwordVisible
//                         ? Icons.visibility_outlined
//                         : Icons.visibility_off_outlined),
//                 color: custom_colors.secondaryBlue,
//                 size: 40,
//               ),
//               onPressed: (() {
//                 setState(() {
//                   _passwordVisible = !_passwordVisible;
//                 });
//               }),
//             )),
//       ),
//     );
//   }

//   Widget errorMessage() {
//     return Text(
//       _errorMessage == '' ? '' : 'Hmm? $_errorMessage',
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         color: custom_colors.primaryBlue,
//         fontSize: 14,
//       ),
//     );
//   }

//   Widget _submitButton() {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         decoration: const BoxDecoration(),
//         width: 220,
//         height: 50,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//               backgroundColor: custom_colors.secondaryBlue),
//           onPressed: (() => signInWithEmailAndPassword()),
//           child: Text(
//             'SIGN UP',
//             style: const TextStyle(
//                 color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _loginOrRegisterButton() {
//     return TextButton(
//       onPressed: (() {
//         setState(() {
//           _isLogin = !_isLogin;
//           Navigator.of(context).pop();
//         });
//       }),
//       child: Text(
//         _isLogin ? 'SIGN UP' : 'LOGIN',
//         style: TextStyle(
//             decoration: TextDecoration.underline,
//             fontSize: 14,
//             color: custom_colors.primaryBlue,
//             fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(200.0),
//         child: Container(
//           padding: EdgeInsets.all(120),
//           width: double.infinity,
//           height: 800,
//           decoration: BoxDecoration(
//             color: custom_colors.backgroundWhite,
//             borderRadius: BorderRadius.circular(60),
//             boxShadow: [
//               BoxShadow(
//                 color: custom_colors.secondaryDarkBlue.withOpacity(0.3),
//                 spreadRadius: 5,
//                 blurRadius: 10,
//                 offset: const Offset(0, -3),
//               ),
//             ],
//           ),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(
//               'Email',
//               style: TextStyle(
//                   color: custom_colors.primaryBlue,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             _entryField(
//               'Enter your email address...',
//               _controllerEmail,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             Text(
//               'Password',
//               style: TextStyle(
//                   color: custom_colors.primaryBlue,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             _entryField(
//               'Enter your password...',
//               _controllerPassword,
//             ),
//             const SizedBox(
//               height: 32,
//             ),
//             Center(
//               child: errorMessage(),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Center(
//               child: _submitButton(),
//             ),
//             const SizedBox(
//               height: 32,
//             ),
//           ]),
//         ),
//       ),
//       // body: GestureDetector(
//       //   child: Container(
//       //     width: double.infinity,
//       //     height: double.infinity,
//       //     color: custom_colors.backgroundWhite,
//       //     child: Column(
//       //       children: [
//       //         Container(
//       //           padding: EdgeInsets.only(
//       //               top: MediaQuery.of(context).viewPadding.top, left: 32),
//       //           height: 160,
//       //           width: double.infinity,
//       //           alignment: Alignment.centerLeft,
//       //           child: Text(
//       //             _isLogin ? "LOG IN" : 'SIGN UP',
//       //             style: const TextStyle(
//       //                 color: custom_colors.secondaryDarkBlue,
//       //                 fontSize: 32,
//       //                 fontWeight: FontWeight.bold),
//       //           ),
//       //         ),
//       //         Column(
//       //           crossAxisAlignment: CrossAxisAlignment.start,
//       //           children: [
//       //             Text(
//       //               'Email',
//       //               style: TextStyle(
//       //                   color: custom_colors.primaryBlue,
//       //                   fontSize: 18,
//       //                   fontWeight: FontWeight.bold),
//       //             ),
//       //             const SizedBox(
//       //               height: 8,
//       //             ),
//       //             _entryField(
//       //               'email address...',
//       //               _controllerEmail,
//       //             ),
//       //             const SizedBox(
//       //               height: 32,
//       //             ),
//       //             Text(
//       //               'Password',
//       //               style: TextStyle(
//       //                   color: custom_colors.primaryBlue,
//       //                   fontSize: 18,
//       //                   fontWeight: FontWeight.bold),
//       //             ),
//       //             const SizedBox(height: 8),
//       //             _entryField(
//       //               'your password...',
//       //               _controllerPassword,
//       //             ),
//       //             const SizedBox(
//       //               height: 32,
//       //             ),
//       //             Center(
//       //               child: errorMessage(),
//       //             ),
//       //             const SizedBox(
//       //               height: 8,
//       //             ),
//       //             Center(
//       //               child: _submitButton(),
//       //             ),
//       //             const SizedBox(
//       //               height: 32,
//       //             ),
//       //             Row(
//       //               children: [
//       //                 Expanded(
//       //                   child: Padding(
//       //                     padding: const EdgeInsets.only(right: 10.0),
//       //                     child: Container(
//       //                       height: 1,
//       //                       color: custom_colors.primaryBlue,
//       //                     ),
//       //                   ),
//       //                 ),
//       //                 Text(
//       //                   'OR',
//       //                   style: TextStyle(
//       //                     fontSize: 18,
//       //                     color: custom_colors.primaryBlue,
//       //                   ),
//       //                 ),
//       //                 Expanded(
//       //                   child: Padding(
//       //                     padding: const EdgeInsets.only(left: 10.0),
//       //                     child: Container(
//       //                       height: 1,
//       //                       color: custom_colors.primaryBlue,
//       //                     ),
//       //                   ),
//       //                 )
//       //               ],
//       //             ),
//       //             const SizedBox(
//       //               height: 32,
//       //             ),
//       //             GestureDetector(
//       //               onTap: () => Auth().signInWithGoogle(),
//       //               child: Container(
//       //                 padding: const EdgeInsets.all(10),
//       //                 width: double.infinity,
//       //                 height: 50,
//       //                 decoration: BoxDecoration(
//       //                     color: Colors.white,
//       //                     border: Border.all(
//       //                         color: custom_colors.secondaryDarkBlue, width: 2),
//       //                     borderRadius: BorderRadius.circular(20)),
//       //                 child: Row(
//       //                   children: [
//       //                     Image.asset(
//       //                       'lib/assets/images/google-logo.png',
//       //                       fit: BoxFit.cover,
//       //                     ),
//       //                     const SizedBox(
//       //                       width: 20,
//       //                     ),
//       //                     Text(
//       //                       'Sign In With Google',
//       //                       style: TextStyle(
//       //                         fontSize: 14,
//       //                         color: custom_colors.primaryBlue,
//       //                       ),
//       //                     )
//       //                   ],
//       //                 ),
//       //               ),
//       //             ),
//       //             const Spacer(),
//       //             Row(
//       //               mainAxisAlignment: MainAxisAlignment.center,
//       //               children: [
//       //                 Text(
//       //                   _isLogin
//       //                       ? 'Don\'t have an account?'
//       //                       : 'Already a user?',
//       //                   style: TextStyle(
//       //                       color: custom_colors.primaryBlue, fontSize: 14),
//       //                 ),
//       //                 const SizedBox(
//       //                   width: 20,
//       //                 ),
//       //                 _loginOrRegisterButton(),
//       //               ],
//       //             ),
//       //           ],
//       //         )
//       //       ],
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }

