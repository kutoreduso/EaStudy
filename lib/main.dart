import 'package:eastudy/resetpass.dart';
import 'package:flutter/material.dart';
import 'ForgetPassword.dart';
import 'loadingScreen.dart';
import 'LoginScreen.dart';
import 'welcomeScreen.dart';
import 'signupScreen.dart';
import 'dashBoard.dart';
import 'quizzesScreen.dart';
import 'resetpass.dart';

void main() {
  runApp(SmartGrocelistApp());
}

class SmartGrocelistApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Grocelist App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/dashBoard': (context) => dashBoard(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/quizzes': (context) => quizzesScreen(),
        '/forgetpass': (context) => ForgetPassword(),
        '/resetpass': (context) => Resetpass(),
      },
    );
  }
}
