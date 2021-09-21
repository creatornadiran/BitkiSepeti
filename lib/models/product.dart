import 'package:flutter/material.dart';

class Review {
  final String review, username;
  final double rating;
  Review({
    required this.review,
    required this.username,
    required this.rating,
  });
}

class Product extends ChangeNotifier {
  final List<String> images;
  final List<Color> colors;
  final List<Review>? reviews;
  final double price;
  late double rating;
  late bool isFavourite, isPopular;
  final String title, description;
  Product(
      {required this.images,
      required this.colors,
      required this.title,
      required this.price,
      required this.description,
      this.reviews,
      this.isFavourite = false,
      this.isPopular = false}) {
    if (reviews!.length == 0) {
      this.rating = 0;
    } else {
      double sumRating = 0;
      for (int i = 0; i < reviews!.length; i++) {
        sumRating += reviews![i].rating;
      }
      this.rating =
          double.parse((sumRating / reviews!.length).toStringAsFixed(1));
    }
  }
}

List<Product> products = [
  Product(
      reviews: [
        Review(rating: 4.5, review: "Cok begendim", username: "Hasan"),
        Review(rating: 4, review: "Hizli geldi", username: "Mustafa"),
        Review(
            rating: 4.5,
            review: "Rengi tam istedigim gibi",
            username: "Mahmut"),
      ],
      images: [
        "assets/images/stone_face_white.jpg",
        "assets/images/stone_face_black.jpg"
      ],
      colors: [
        Colors.white,
        Colors.black
      ],
      price: 17.9,
      title: 'Stoneface',
      description:
          "Ürün taş tozundan imal edilmiştir İçi boş ve vazo olarak kullanılabilir",
      isPopular: true),
  Product(
      reviews: [],
      images: [
        "assets/images/rose_pink.jpg",
        "assets/images/rose_purple.jpg",
        "assets/images/rose_red.jpg"
      ],
      colors: [
        Color(0xfffb46a6),
        Color(0xff92468c),
        Color(0xffd4192c),
      ],
      title: 'Gül',
      price: 5.90,
      description:
          "En iyi çiçekli bitkilerden biridir, açık bahçe ve güneşli balkon için mükemmel bitki.",
      isPopular: true),
  Product(
      reviews: [],
      images: [
        "assets/images/carrot_seed_carrot.jpg",
        "assets/images/carrot_seed_seed.jpg"
      ],
      colors: [],
      title: 'Havuç Tohumu',
      price: 9.95,
      description:
          "Havuç, sağlıklı beslenmenin bir parçası olduğu için çok sevilir. Bu tohum paketi yaklaşık 35 tohum içerir.",
      isPopular: true),
  Product(
      reviews: [],
      images: [
        "assets/images/bunny_ear_cac_1.jpg",
        "assets/images/bunny_ear_cac_2.jpg"
      ],
      colors: [],
      title: 'Tavşan Kulağı Kaktüs',
      price: 29.95,
      description:
          "Opuntia microdasys, güzellik katan dekoratif bir kaktüstür.",
      isPopular: true),
];
