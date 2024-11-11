import 'package:flutter/material.dart';
import 'welcomeScreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 5 seconds before navigating to the WelcomeScreen
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Align(
              alignment: Alignment(-2.20, 1.35),
              child: Container(
                width: 230,
                height: 230,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFC0B283),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-1.05, -1.25),
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFC0B283),
                ),
              ),
            ),
            Align(
              alignment: Alignment(1.75, -0.90),
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFC0B283),
                ),
              ),
            ),
            Align(
              alignment: Alignment(1.25, -1.15),
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF404A42),
                ),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                SizedBox(height: 20),
                 Align(
                  alignment: Alignment(-0.0, 1.0),
                  child: Text(
                    'Eastudy',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
