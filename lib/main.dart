import 'package:e_commerce/routs.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserCart>(
          create: (_) => UserCart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: SplashScreen.routName,
        routes: routes,
      ),
    );
  }
}
