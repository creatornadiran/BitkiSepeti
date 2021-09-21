import 'package:carousel_slider/carousel_controller.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/details/components/review_box.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'all_reviews_screen.dart';

class SlidingUpPanel_Panel extends StatefulWidget {
  SlidingUpPanel_Panel(
      {Key? key, required this.product, required this.buttonCarouselController})
      : super(key: key);
  final Product product;
  CarouselController buttonCarouselController;
  @override
  _SlidingUpPanel_PanelState createState() => _SlidingUpPanel_PanelState();
}

class _SlidingUpPanel_PanelState extends State<SlidingUpPanel_Panel> {
  int colorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              SecondaryColor2,
              Colors.white,
            ]),
      ),
      child: Column(
        children: [
          Container(
            height: 10,
            width: 60,
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0))),
            ),
          ),
          buildDescriptionBox([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width / 2,
                  child: Text(
                    widget.product.title,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(children: [
                  ...List.generate(
                      widget.product.colors.length,
                      (index) => ColorBuilder(
                            index,
                          ))
                ]),
              ],
            ),
            Divider(
              height: 40,
              thickness: 5,
            ),
            Text(
              "Açıklama",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              widget.product.description,
              textAlign: TextAlign.center,
            )
          ], CrossAxisAlignment.center),
          buildDescriptionBox([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Değerlendirmeler",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Column(
                  children: [
                    Text(
                      "${widget.product.rating} / 5",
                      style: TextStyle(fontSize: height * 0.025),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ...List.generate(5, (index) => StarBuilder(index)),
                    ]),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Column(
              children: widget.product.reviews!.length == 0
                  ? [Text("Hiç değerlendirme yok.")]
                  : [
                      ...List.generate(
                          widget.product.reviews!.length >= 3
                              ? 3
                              : widget.product.reviews!.length,
                          (index) =>
                              reviewBox(product: widget.product, index: index))
                    ],
            ),
            TextButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) =>
                      allReviews(product: widget.product),
                );
              },
              child: Text(
                "Tüm Değerlendirmeler(${widget.product.reviews == null ? 0 : widget.product.reviews!.length})",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.02,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ], CrossAxisAlignment.center),
        ],
      ),
    );
  }

  Padding buildDescriptionBox(
      List<Widget> childList, CrossAxisAlignment alignment) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: alignment,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: childList,
          ),
        ),
      ),
    );
  }

  Icon StarBuilder(int index) {
    return Icon(
      widget.product.rating >= index + 0.1
          ? widget.product.rating >= index + 0.6
              ? Icons.star_rounded
              : Icons.star_half_rounded
          : Icons.star_border_rounded,
    );
  }

  Padding ColorBuilder(int index) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            colorIndex = index;
            widget.buttonCarouselController.jumpToPage(
              index,
            );
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: index == colorIndex ? Colors.green : Colors.black,
                  width: 1)),
          child: Icon(
            Icons.circle,
            color: widget.product.colors[index],
            size: 35,
          ),
        ),
      ),
    );
  }
}
