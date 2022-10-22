import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Myfield extends StatelessWidget {
  final String hinttext;
  final bool obscuretext;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType keyboardtype;

  Myfield(
      {Key? key,
      required this.hinttext,
      this.onChanged,
      this.controller,
      required this.keyboardtype,
      required this.obscuretext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscuretext,
      textAlign: TextAlign.center,
      cursorColor: const Color(0xFF692CC3),
      cursorWidth: 5,
      onChanged: onChanged,
      autocorrect: false,
      keyboardType: keyboardtype,
      showCursor: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFF692CC3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFF692CC3),
          ),
        ),
      ),
    );
  }
}
