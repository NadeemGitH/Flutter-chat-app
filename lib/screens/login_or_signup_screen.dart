import 'package:chatting_hub/screens/login_screen.dart';
import 'package:chatting_hub/screens/signup_screen.dart';
import 'package:chatting_hub/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height12,
            ),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.height12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff999999),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: Dimensions.height12),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: Dimensions.height12,
                        color: Color(0xff999999),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height110,
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
              height: Dimensions.height60,
            ),
            Container(
              height: Dimensions.height50 - 10,
              width: Dimensions.height200 + 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height50 - 10),
                color: Color(0xff26C2F0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: Dimensions.height12 + 6,
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height12,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Signup()));
              },
              child: Container(
                height: Dimensions.height50 - 10,
                width: Dimensions.height264 + 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height50 - 10),
                  color: Color(0xffE4E4E4),
                ),
                child: TextButton(
                  onPressed: null,
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: Dimensions.height12 + 6,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height12,
            ),
          ],
        ),
      ),
    );
  }
}
