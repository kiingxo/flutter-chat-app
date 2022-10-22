import 'package:chatapp/widgets/buttons.dart';
import 'package:chatapp/widgets/textfield%20copy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const id = "login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myController = TextEditingController();
  final _authentication = FirebaseAuth.instance;
  late String username;
  late String password;
  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  void initState() {
    myController.addListener(_printLatestValue);
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();

    super.dispose();
  }

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
                'Already have an account?...Signin!',
                style: TextStyle(
                    height: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
              const SizedBox(height: 30),
              Myfield(
                keyboardtype: TextInputType.emailAddress,
                controller: myController,
                hinttext: "Username", obscuretext: false,
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
                onChanged: ((p0) {
                  password = p0;
                }),
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
                    "Sign in with Google",
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
                          text: "Login",
                          onPressed: () async {
                            print(password);

                            final user = await _authentication
                                .createUserWithEmailAndPassword(
                                    email: username, password: password);
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
                      "Don't have an accout?",
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

class HttpClient {
  static var url = "";
  static var apikey = "";
  static var apiurl = url + apikey;
}
