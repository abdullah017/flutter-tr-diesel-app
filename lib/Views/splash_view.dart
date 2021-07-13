import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:turkish_gasoline_and_diesel_price_app/Views/helper/size_helper.dart';
import 'package:turkish_gasoline_and_diesel_price_app/Views/home.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: HomeView(),
        duration: 3000,
        imageSize: displayHeight(context) * 0.9,
        imageSrc: "assets/images/logo.png",
        backgroundColor: Colors.black,
      ),
    );
  }
}
