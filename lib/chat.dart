import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late FirebaseAuth loggedinuser;
final _firestore = FirebaseFirestore.instance;

class ChatPage extends StatefulWidget {
  static const id = "chat";
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _authentication = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  late String messages;

  void getCurrentUser() async {
    try {
      final user = await _authentication.currentUser;
      if (user != null) {
        loggedinuser = user as FirebaseAuth;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _authentication.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Chats'),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
