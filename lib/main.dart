import 'package:chatapp/chat.dart';
import 'package:chatapp/home.dart';
import 'package:chatapp/login.dart';
import 'package:chatapp/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        LoginPage.id: (context) => const LoginPage(),
        ChatPage.id: (context) => const ChatPage(),
        SignupPage.id: (context) => const SignupPage(),
      },
    );
  }
}
