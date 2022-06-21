// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:recipes_app/models/FavoriteManager.dart';
import 'package:recipes_app/models/data.dart';

class FavoritWidget extends StatefulWidget {
  const FavoritWidget({Key? key}) : super(key: key);
  @override
  State<FavoritWidget> createState() => _FavoritWidgetState();
}

class _FavoritWidgetState extends State<FavoritWidget> {
  bool favListTest = FavoriteManager.favoriteDataList.isEmpty;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: favListTest
            ? Padding(
                padding: const EdgeInsets.only(top: 80),
                child: const Center(
                  child: Text(
                    'There are no favorites yet!',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: FavoriteManager.favoriteDataList.length,
                itemBuilder: (context, index) {
                  final fav = FavoriteManager.favoriteDataList[index];
                  return Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              fav.name,
                              style: const TextStyle(fontSize: 19.0),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              FavoriteManager.favoriteDataList.remove(
                                  FavoriteManager.favoriteDataList[index]);
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple,
                            ),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
