import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'offer_card.dart';
import 'offer_card_data.dart';

class offerCardBuilder extends StatefulWidget {
  @override
  _offerCardBuilderState createState() => _offerCardBuilderState();
}

class _offerCardBuilderState extends State<offerCardBuilder> {
  @override
  List<List<String>> splashData = cardData;
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: width,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: SecondaryColor1.withOpacity(0.5)),
          child: CarouselSlider.builder(
              options: CarouselOptions(
                enlargeCenterPage: true,
                initialPage: 1,
                enableInfiniteScroll: false,
                viewportFraction: 0.33,
                height: 120,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: splashData.length,
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) =>
                      splashData[index][0] == "discount"
                          ? offerCard.discountCard(
                              splashData[index][1],
                              splashData[index][2],
                            )
                          : splashData[index][0] == "text"
                              ? offerCard.textCard(
                                  splashData[index][1],
                                )
                              : offerCard.imageCard(splashData[index][1])),
        ),
      ],
    );
  }
}
