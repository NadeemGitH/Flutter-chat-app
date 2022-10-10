import 'dart:io';
import 'package:chatting_hub/controller/auth_controller.dart';
import 'package:chatting_hub/screens/login_or_signup_screen.dart';
import 'package:chatting_hub/utils/dimensions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'login_screen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  File? _image;
  var image;
  late String _uploadedFileURL;

  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future getImageGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image');
      }
    });
  }

  Future uploadFile() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref =
        storage.ref().child('chats/${Path.basename(_image!.path)}}');
    UploadTask uploadTask = ref.putFile(_image!);
    await uploadTask.whenComplete(
      () => print('file uploaded'),
    );
    uploadTask.then((res) {
      res.ref.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL = fileURL;
          print(_uploadedFileURL);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 12,
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
              GestureDetector(
                onTap: () {
                  getImageGallery();
                },
                child: Container(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 40,
                    backgroundImage:
                        _image != null ? FileImage(_image!.absolute) : null,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.image),
                label: Text('add Image'),
              ),
              SizedBox(
                height: Dimensions.height60,
              ),
              // Text(
              //   'Sign up ',
              //   style: TextStyle(
              //     fontSize: Dimensions.height28,
              //     color: Color(0xff26C2F0),
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // SizedBox(
              //   height: Dimensions.height12,
              // ),
              // Text(
              //   'Sign up to your account to see your chating ',
              //   style: TextStyle(
              //     fontSize: Dimensions.height12,
              //     color: Color(0xff999999),
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: Dimensions.height50,
                width: Dimensions.height200 + 150,
                child: TextField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height28,
              ),
              Container(
                height: Dimensions.height50,
                width: Dimensions.height200 + 150,
                child: TextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
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
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
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
                height: Dimensions.height28 + 4,
              ),
              Container(
                height: Dimensions.height50 - 10,
                width: Dimensions.height200 + 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height50 - 10),
                  color: Color(0xff26C2F0),
                ),
                child: TextButton(
                  onPressed: () async {
                    AuthController.instance.register(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      nameController.text.trim(),
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: Dimensions.height12 + 5,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w500,
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
                  Text('Already have an account?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: const Text(
                      'Login',
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
