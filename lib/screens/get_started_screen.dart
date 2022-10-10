import 'package:chatting_hub/screens/login_or_signup_screen.dart';
import 'package:chatting_hub/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height130,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.height82,
                  right: Dimensions.height82,
                ),
                child: Image.asset(
                  'assets/image/getstarted1.png',
                  width: Dimensions.height264,
                  height: Dimensions.height200,
                ),
              ),
              SizedBox(
                height: Dimensions.height12,
              ),
              Center(
                child: Text(
                  "Easily connect with  freind",
                  style: TextStyle(
                    fontSize: Dimensions.height12 * 2,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "in Chat",
                  style: TextStyle(
                    fontSize: Dimensions.height12 * 2,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height110,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginSignup()));
                },
                child: Container(
                  height: Dimensions.height50,
                  width: Dimensions.height200,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.height28 + 12),
                    color: Color(0xff26C2F0),
                  ),
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Lets started',
                      style: TextStyle(
                        fontSize: Dimensions.height12 * 2,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height12,
              ),
              Text(
                'Terms and  pravicy policy',
                style: TextStyle(
                  fontSize: Dimensions.height12,
                  color: Color(0xff695C5C),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
