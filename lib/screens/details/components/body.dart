import 'package:carousel_slider/carousel_controller.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/details/components/product_image_slider.dart';
import 'package:e_commerce/screens/details/components/sliding_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.product, required this.constraintsHeight})
      : super(key: key);
  final Product product;
  final double constraintsHeight;
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      renderPanelSheet: false,
      minHeight: constraintsHeight - width + 25,
      maxHeight: constraintsHeight,
      panel: SlidingUpPanel_Panel(
        product: product,
        buttonCarouselController: buttonCarouselController,
      ),
      body: ProductImageSlider(
        product: product,
        buttonCarouselController: buttonCarouselController,
      ),
    );
  }
}
