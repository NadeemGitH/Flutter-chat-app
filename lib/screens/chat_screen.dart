import 'package:chatting_hub/utils/dimensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height28,
            ),
            Container(
              height: Dimensions.height100 - 10,
              width: Dimensions.height200 + 228,
              color: Color(0xffF8F8F8),
              child: Padding(
                padding: EdgeInsets.only(left: Dimensions.height12 - 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                    ),
                    CircleAvatar(
                      child: Image.asset(
                        height: 80,
                        width: 80,
                        'assets/image/story1.png',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.height28, left: Dimensions.height12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(right: Dimensions.height12 + 4),
                            child: Text(
                              loggedInUser.displayName!,
                              style: TextStyle(
                                fontSize: Dimensions.height12 + 4,
                                color: const Color(0xff333333),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            'typing...',
                            style: TextStyle(
                              fontSize: Dimensions.height12 + 2,
                              color: Color(0xff999999),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MessageStream(),
            Container(
              height: Dimensions.height60,
              width: double.maxFinite,
              color: Color(0xffF9F9F9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: Dimensions.height28 - 4,
                    width: Dimensions.height12 + 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.height50),
                    ),
                    child: Icon(
                      Icons.mic,
                      color: Color(0xff26C2F0),
                    ),
                  ),
                  Container(
                    height: Dimensions.height50 - 4,
                    width: Dimensions.height200 + 50,
                    color: Color(0xffF9F9F9),
                    child: Row(
                      children: [
                        Container(
                          height: Dimensions.height12 + 12,
                          width: Dimensions.height12 + 12,
                          color: Color(0xffF9F9F9),
                          child: Icon(Icons.emoji_emotions),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: Dimensions.height12 - 4),
                            child: TextField(
                              controller: messageTextController,
                              onChanged: (value) {
                                messageText = value;
                              },
                              decoration: InputDecoration(
                                hintText: "type message",
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            messageTextController.clear();
                            _firestore.collection('messages').add({
                              'text': messageText,
                              'sender': loggedInUser.displayName,
                              'timestamp': FieldValue.serverTimestamp(),
                            });
                          },
                          child: Icon(Icons.send),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Dimensions.height28 - 4,
                    width: Dimensions.height12 + 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.height50),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.camera_alt,
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

class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        final messages = snapshot.data?.docs;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages!) {
          final messageText = message['text'];
          final messageSender = message['sender'];
          final currentUser = loggedInUser.displayName;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
            reverse: true,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;
  const MessageBubble(
      {Key? key, required this.text, required this.sender, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
