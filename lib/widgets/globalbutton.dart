import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback whathappenswhenpressed;
  final String buttontext;

  const Button(
      {required this.whathappenswhenpressed,
      required this.buttontext,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 4,
      minWidth: 336.84,
      onPressed: whathappenswhenpressed,
      color: Colors.purple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 30),
      child: SizedBox(
        child: Text(
          buttontext,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
