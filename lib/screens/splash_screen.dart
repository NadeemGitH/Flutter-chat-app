import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import 'get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GetStarted()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height100,
            ),
            Center(
              child: Image.asset(
                'assets/image/splash1.png',
                height: Dimensions.height100,
                width: Dimensions.height100,
              ),
            ),
            SizedBox(
              height: Dimensions.height12,
            ),
            Text(
              'Chating Hub',
              style: TextStyle(
                fontSize: Dimensions.height28,
                color: Color(0xff26C2F0),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: Dimensions.height200,
            ),
          ],
        ),
      ),
    );
  }
}
