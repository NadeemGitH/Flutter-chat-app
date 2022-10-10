import 'package:chatting_hub/controller/auth_controller.dart';
import 'package:chatting_hub/screens/login_or_signup_screen.dart';
import 'package:chatting_hub/screens/signup_screen.dart';
import 'package:chatting_hub/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginSignup()));
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xff999999),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height110,
              ),
              Text(
                'Login ',
                style: TextStyle(
                  fontSize: Dimensions.height28,
                  color: Color(0xff26C2F0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: Dimensions.height12,
              ),
              Text(
                'Sign in to your account to see your chating ',
                style: TextStyle(
                  fontSize: Dimensions.height12,
                  color: Color(0xff999999),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: Dimensions.height60,
              ),
              Container(
                height: Dimensions.height50,
                width: Dimensions.height200 + 150,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height12 * 2,
              ),
              Container(
                height: Dimensions.height50,
                width: Dimensions.height200 + 150,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height12,
              ),
              Text(
                'Forgget your password?',
                style: TextStyle(
                  fontSize: Dimensions.height12 + 4,
                  color: Color(0xff26C2F0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: Dimensions.height50,
              ),
              Container(
                height: Dimensions.height50 - 10,
                width: Dimensions.height200 + 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height50 - 10),
                  color: Color(0xff26C2F0),
                ),
                child: TextButton(
                  onPressed: () {
                    AuthController.instance.login(emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: Dimensions.height12 + 5,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Do have an account?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Color(0xff26C2F0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
