import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/sign_in_up/sign_in_screen.dart';
import 'package:e_commerce/screens/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<SplashBody> {
  List<Map<String, String>> splashData = [
    {
      "text": "BitkiSepeti'ne Hoş Geldiniz",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "Süper Fiyat, Süper Teklif",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Yüzlerce farklı tür çiçek BitkiSepeti'nde!",
      "image": "assets/images/splash_3.png"
    }
  ];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 6,
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"]!,
                    text: splashData[index]["text"]!,
                    height: height,
                  ),
                )),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDot(index))),
                  SizedBox(height: 0.1 * height),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: SecondaryColor1,
                            ),
                          ),
                        ),
                        DefaultButton(
                            text: "Devam Et",
                            press: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  SignScreen.routeName,
                                  ModalRoute.withName('/'));
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? PrimaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
