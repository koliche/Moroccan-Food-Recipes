import 'package:flutter/material.dart';
import 'package:recipes_app/constants.dart';
import 'package:recipes_app/views/widgets/ProfielWidget.dart';

class ProfielScreen extends StatefulWidget {
  ProfielScreen({Key? key}) : super(key: key);

  @override
  State<ProfielScreen> createState() => _ProfielScreenState();
}

class _ProfielScreenState extends State<ProfielScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: ProfielWidget(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      // On Android it's false by default
      title: const Padding(
        padding: EdgeInsets.all(0.8),
        child: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {},
          child: const Text(
            "Edit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16, //16
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
