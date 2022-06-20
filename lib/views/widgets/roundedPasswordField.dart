import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
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
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isHidden = true;
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
        controller: widget.controller,
        obscureText: isHidden,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Color.fromARGB(255, 26, 126, 78),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontFamily: 'OpenSans'),
            suffixIcon: InkWell(
              child: Icon(
                Icons.visibility,
                color: Color.fromARGB(255, 26, 126, 78),
              ),
              onTap: _togglePasswordView,
            ),
            border: InputBorder.none),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
