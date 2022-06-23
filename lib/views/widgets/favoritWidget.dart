// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipes_app/models/FavoriteManager.dart';
import 'package:recipes_app/models/data.dart';
import 'package:recipes_app/models/getRecipesData.dart';
import 'package:recipes_app/views/Detail.dart';
import 'package:recipes_app/views/details.dart';

import '../../models/favorite.dart';

class FavoritWidget extends StatefulWidget {
  const FavoritWidget({Key? key}) : super(key: key);
  @override
  State<FavoritWidget> createState() => _FavoritWidgetState();
}

class _FavoritWidgetState extends State<FavoritWidget> {
  List<Favorite> favoritList = [];
  String? name;
  String? subname;
  String? image;
  CollectionReference favoriteRecipes = FirebaseFirestore.instance
      .collection('favorite')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('favorite list');
  @override
  Widget build(BuildContext context) {
    var documentId = favIds;
    return ListView.builder(
      itemCount: favoritList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        var favEle = favoritList[index];
        return SafeArea(
          child: Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  SizedBox(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 130,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                // Recipes Images :::::::::::::::
                                SizedBox(
                                  height: 100,
                                  width: 110,
                                  child: Image.network(
                                    favEle.image.toString(),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.61, //16,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 1.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                // Recipes name ::::::::::::
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8.0,
                                                                  left: 8),
                                                          child: Text(
                                                            favEle.name
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 2),
                                                          child: Text(
                                                            favEle.subname
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "favorite")
                                                                .doc(FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid)
                                                                .collection(
                                                                    "favorite list")
                                                                .doc(favEle
                                                                    .favoriteId)
                                                                .delete();

                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    "Suprimer avec succés",
                                                                toastLength: Toast
                                                                    .LENGTH_SHORT,
                                                                gravity:
                                                                    ToastGravity
                                                                        .BOTTOM,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                fontSize: 16.0);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .delete_outline,
                                                            size: 40,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                // Recipes subname ::::::::::::
                                                // Favorite Icon To add recipes to the favorite liste ::::::
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
    /*Scaffold(
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
                            child: InkWell(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 80,
                                    child: Image.asset(
                                      fav.image,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        fav.name,
                                        style: const TextStyle(fontSize: 19.0),
                                      ),
                                      Text(
                                        fav.subname,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return Details(
                                      recipes: fav,
                                    );
                                  }),
                                );
                              },
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
    );*/
  }

  getFavData() async {
    try {
      FirebaseFirestore.instance
          .collection("favorite")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("favorite list")
          .get()
          .then((value) => value.docs.forEach((element) {
                Favorite f = Favorite();
                f.favoriteId = element.id;
                f.name = element['name'];
                f.subname = element['subname'];
                f.image = element['image'];
                print(element['name']);
                setState(() {
                  favoritList.add(f);
                  print(favoritList.length);
                });
              }));
    } catch (e) {
      Fluttertoast.showToast(msg: "favorite OK!");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavData();
  }
}
