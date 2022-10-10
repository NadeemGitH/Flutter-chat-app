import 'package:chatting_hub/screens/chat_screen.dart';
import 'package:chatting_hub/screens/user_settings.dart';
import 'package:chatting_hub/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height50,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.height12, right: Dimensions.height12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chat',
                    style: TextStyle(
                      fontSize: Dimensions.height12 + 8,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.add_alert,
                    color: Color(0xff999999),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height12,
            ),
            Padding(
              padding: EdgeInsets.only(right: Dimensions.height130),
              child: Container(
                color: Color(0xffFFFFFF),
                height: Dimensions.height50 - 10,
                width: Dimensions.height200,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search your chat',
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: Dimensions.height12 - 2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height12,
            ),
            Container(
              width: Dimensions.height200 + 228,
              height: Dimensions.height100 - 2,
              color: Color(0x1b40d1f1),
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 10.0),
                  itemExtent: 60.0,
                  scrollDirection: Axis.horizontal,
                  itemCount: 200,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height50)),
                      child: Image.asset(
                        'assets/image/story1.png',
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: Dimensions.height12,
            ),
            Expanded(
              child: ListView.builder(
                  itemExtent: Dimensions.height100 - 10,
                  padding: EdgeInsets.only(top: Dimensions.height12 + 8),
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.height12 - 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/image/man1.png',
                              width: Dimensions.height50,
                              height: Dimensions.height50,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: Dimensions.height12,
                                  left: Dimensions.height12 - 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nadeem Khan',
                                    style: TextStyle(
                                      fontSize: Dimensions.height12 + 4,
                                      color: Color(0xff333333),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'text',
                                    style: TextStyle(
                                      fontSize: Dimensions.height12,
                                      color: Color(0xff999999),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Dimensions.height12 + 4,
                                left: Dimensions.height110,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '10m ago',
                                    style: TextStyle(
                                      fontSize: Dimensions.height12 + 4,
                                      color: Color(0xff999999),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.height12 + 4),
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: Dimensions.height12,
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: Dimensions.height60,
              width: double.maxFinite,
              color: Color(0xffF9F9F9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: Dimensions.height28 - 4,
                    width: Dimensions.height12 + 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.height50),
                    ),
                    child: Icon(
                      Icons.message,
                      color: Color(0xff26C2F0),
                    ),
                  ),
                  Container(
                    height: Dimensions.height28 + 3,
                    width: Dimensions.height28 + 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.height50),
                      border: Border.all(
                        width: Dimensions.height12 - 9,
                        color: Color(0xff999999),
                        style: BorderStyle.solid,
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserSettings()));
                    },
                    child: Container(
                      height: Dimensions.height28 - 4,
                      width: Dimensions.height12 + 8,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height50),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Color(0xff999999),
                      ),
                    ),
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
