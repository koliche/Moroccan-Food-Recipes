import 'package:flutter/material.dart';
import 'package:recipes_app/views/widgets/favoritWidget.dart';

import '../constants.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        // On Android it's false by default
        title: const Padding(
          padding: EdgeInsets.all(0.8),
          child: Text(
            "Favorite",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(child: FavoritWidget()),
    );
  }
}
