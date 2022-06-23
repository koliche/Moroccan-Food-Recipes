import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/models/data.dart';
import 'package:recipes_app/models/shared.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  final String recipeId;

  Detail({required this.recipeId});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    CollectionReference recipes =
        FirebaseFirestore.instance.collection('recipes');
    return FutureBuilder<DocumentSnapshot>(
        future: recipes.doc(widget.recipeId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Scaffold(
              backgroundColor: Colors.grey[50],
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                brightness: Brightness.light,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextTitleVariation1(data['name']),
                          buildTextSubTitleVariation1(data['subname']),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 310,
                      padding: EdgeInsets.only(left: 16),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildTextTitleVariation2('Nutritions', false),
                              SizedBox(
                                height: 16,
                              ),
                              buildNutrition(
                                  data['calories'], "Calories", "Kcal"),
                              SizedBox(
                                height: 16,
                              ),
                              buildNutrition(data["carbo"], "Carbo", "g"),
                              SizedBox(
                                height: 16,
                              ),
                              buildNutrition(data["protein"], "Protein", "g"),
                            ],
                          ),
                          Positioned(
                            right: -100,
                            child: Hero(
                              tag: data['image'],
                              child: Container(
                                height: 310,
                                width: 310,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(data['image']),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // The last part of the view ::::::::::::::
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextTitleVariation2('Ingredients', false),
                          for (var i in data['Ingrediant'])
                            buildTextSubTitleVariation1(i.toString()),
                          SizedBox(
                            height: 16,
                          ),
                          buildTextTitleVariation2('Recipe preparation', false),
                          for (var i in data['Recipe preparation'])
                            buildTextSubTitleVariation1(i.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: InkWell(
                child: FloatingActionButton.extended(
                    onPressed: () {
                      print(data['videoUrl']);
                      launchUrl(Uri.parse(data['videoUrl']));
                    },
                    backgroundColor: Colors.greenAccent,
                    icon: Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 32,
                    ),
                    label: Text(
                      "Watch Video",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            );
          }
          return Center(
            child: Container(
              height: 20,
              child: CircularProgressIndicator(backgroundColor: Colors.white),
            ),
          );
        }));
  }
}

Widget buildNutrition(String value, String title, String subTitle) {
  return Container(
    height: 60,
    width: 150,
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.grey[50],
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 8,
          offset: Offset(0, 0),
        )
      ],
    ),
    child: Row(
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: Center(
            child: Text(
              value.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

getAngri(Map<String, dynamic> data) {
  for (var el in data["Ingrediant"]) {
    return Text(el.toString());
  }
}
