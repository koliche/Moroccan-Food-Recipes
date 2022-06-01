import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String image;
  final String name;
  final String subname;

  const RecipeCard({
    Key? key,
    required this.image,
    required this.name,
    required this.subname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              SizedBox(
                height: 130,
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
                            Container(
                              height: 120,
                              width: 110,
                              child: Image.asset(
                                image,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, left: 8),
                                              child: Text(
                                                name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                subname,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                            ),
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
              Positioned(
                  right: 15,
                  bottom: 20,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text("50 min")
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.black,
                              ),
                              Text("4.3")
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
