import 'package:e_commerce/screens/home/components/section_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class NewAdded extends StatelessWidget {
  const NewAdded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Yeni Gelenler", press: () {}),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            BoxCategories(
              image: "assets/images/plants.jpg",
              category: "Bitkiler",
              press: () {},
            ),
            BoxCategories(
              image: "assets/images/vases.jpg",
              category: "Saksılar",
              press: () {},
            ),
            BoxCategories(
              image: "assets/images/seeds.jpg",
              category: "Tohumlar",
              press: () {},
            ),
          ]),
        ),
      ],
    );
  }
}

class BoxCategories extends StatelessWidget {
  const BoxCategories({
    Key? key,
    required this.category,
    required this.image,
    required this.press,
  }) : super(key: key);
  final String category, image;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.05),
      child: SizedBox(
        width: width * 0.55,
        height: height * 0.15,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black54, Colors.black12],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter))),
              Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category,
                        style: TextStyle(
                            fontSize: width * 0.10, color: Colors.white)),
                    Text("daha fazla gör",
                        style: TextStyle(
                            fontSize: width * 0.03, color: Colors.white)),
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
