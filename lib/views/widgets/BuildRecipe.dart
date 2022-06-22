import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/models/shared.dart';
import 'package:recipes_app/views/details.dart';

class buildRecipe extends StatefulWidget {
  final String documentId;
  buildRecipe({required this.documentId});

  @override
  State<buildRecipe> createState() => _buildRecipeState();
}

class _buildRecipeState extends State<buildRecipe> {
  @override
  Widget build(BuildContext context) {
    String index;
    CollectionReference recipes =
        FirebaseFirestore.instance.collection('recipes');
    return FutureBuilder<DocumentSnapshot>(
        future: recipes.doc(widget.documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            index = widget.documentId;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(
                              recipeId: index,
                            )));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  //boxShadow: [kBoxShadow],
                ),
                margin:
                    EdgeInsets.only(right: 16, left: 16, bottom: 16, top: 8),
                padding: const EdgeInsets.all(16),
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Hero(
                        tag: data['image'],
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(data['image']),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    buildRecipeTitle(data['name']),
                    buildTextSubTitleVariation2(data['subname']),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildRating(data['calories']),

                        // ignore: unnecessary_new
                        new IconButton(
                          icon: new Icon(Icons.favorite_border),
                          hoverColor: Colors.black,
                          onPressed: _addFavorite(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Text(" data not found @!!!");
        }));
  }

  _addFavorite() {}
}
