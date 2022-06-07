import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  RoundedPasswordField(
      {Key? key,
      this.hintText,
      this.icon = Icons.person,
      required this.controller})
      : super(key: key);
  final String? hintText;
  final IconData icon;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Color.fromARGB(255, 26, 126, 78),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontFamily: 'OpenSans'),
            suffixIcon: Icon(
              Icons.visibility,
              color: Color.fromARGB(255, 26, 126, 78),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
