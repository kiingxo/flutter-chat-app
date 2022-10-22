import 'package:chatapp/login.dart';
import 'package:chatapp/signup.dart';
import 'package:chatapp/widgets/globalbutton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const id = "home";

  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final String introtext =
      "Speedy Texts to Family and Friends around the Globe! 🌍";
  late AnimationController animationController;
  late AnimationController animationController2;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      upperBound: 100,
    );
    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      upperBound: 40,
    );
    animationController.forward();
    animationController2.forward();
    animationController.addListener(() {
      setState(() {});
      // print(animationController.value);
    });
    animationController2.addListener(() {
      setState(() {});
      // print(animationController2.value);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        250,
        248,
        248,
      ),
      // .withOpacity(animationController.value),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Spacer(
          //   flex: 2,
          // ),

          // const Spacer(),
          // //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "animationtag",
                child: Image.asset(
                  "images/chatlogo.jpg",
                  height: animationController.value,
                ),
              ),
              Text(
                'Extra',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: animationController2.value),
              ),
            ],
          ),

          //
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60, top: 5),
            child: Text(
              introtext,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  height: 2.5,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 31, 31, 31),
                  fontSize: 16),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 40, top: 50),
            child: Button(
                whathappenswhenpressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
                buttontext: "Login"),
          ),

          Button(
              whathappenswhenpressed: () {
                Navigator.pushNamed(context, SignupPage.id);
              },
              buttontext: "Signup"),
        ],
      ),
    );
  }
}
