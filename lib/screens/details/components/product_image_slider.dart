import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductImageSlider extends StatefulWidget {
  ProductImageSlider(
      {Key? key, required this.product, required this.buttonCarouselController})
      : super(key: key);
  final Product product;
  CarouselController buttonCarouselController;
  @override
  _ProductImageSliderState createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int Pageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider.builder(
          carouselController: widget.buttonCarouselController,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                Pageindex = index;
              });
            },
            initialPage: 0,
            height: width,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: widget.product.images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) =>
              Container(
                width: width,
                height: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.product.images[index]),
                        fit: BoxFit.cover)),
              )),
      Positioned(
        top: width - 40,
        left: 25,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                widget.product.images.length, (index) => buildDot(index))),
      ),
    ]);
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: Pageindex == index ? 20 : 10,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Pageindex == index ? PrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
