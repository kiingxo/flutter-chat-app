import 'package:chatapp/chat.dart';
import 'package:chatapp/widgets/buttons.dart';
import 'package:chatapp/widgets/textfield%20copy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignupPage extends StatefulWidget {
  static const id = "signup";
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey _formkey = GlobalKey();
  late bool _sucess;
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final FirebaseAuth _authentication = FirebaseAuth.instance;
  late String username;
  late String password;
  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  void _printLatestValue2() {
    print('Second text field: ${myController2.text}');
  }

  @override
  void initState() {
    myController.addListener(_printLatestValue);
    myController2.addListener(_printLatestValue2);
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 250, 248, 248),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, bottom: 1, left: 20, right: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  children: [
                    Hero(
                      tag: "animationtag",
                      child: Image.asset(
                        "images/chatlogo.jpg",
                        height: 110,
                      ),
                    ),
                    const Text(
                      'Extra',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF692CC3),
                          fontSize: 50),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'New to Extra?...Create and account',
                style: TextStyle(
                    height: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
              const SizedBox(height: 30),
              Myfield(
                keyboardtype: TextInputType.emailAddress,
                obscuretext: false,
                controller: myController,
                hinttext: "Username",
                // onChanged: ((p0) {
                //   username = p0;
                // }),
              ),
              const SizedBox(
                height: 15,
              ),
              Myfield(
                keyboardtype: TextInputType.text,
                obscuretext: true,
                hinttext: "Password",
                controller: myController2,
                // onChanged: ((p0) {
                //   password = p0;
                // }),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text("OR"),
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sigup in with Google",
                    style: TextStyle(
                        color: Color(0xFF692CC3),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Center(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: //button,
                      PurpleButton(
                          text: "Sign up",
                          onPressed: () async {
                            try {
                              final user = await _authentication
                                  .createUserWithEmailAndPassword(
                                      email: username, password: password);
                              if (user != null) {
                                Navigator.pushNamed(context, ChatPage.id);
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          buttonColor: Colors.purple),
                ),
              ),
              const SizedBox(height: 15),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Color(0xFF692CC3),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
