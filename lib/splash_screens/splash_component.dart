import 'package:flutter/material.dart';
import 'package:housing_society/constants/colors_const.dart';
import 'package:housing_society/constants/size_config.dart';

class SplashContent extends StatelessWidget {
  final String text, image;
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          '------',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(28),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        const Spacer(),
        Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(text),
        )),
      ],
    );
  }
}
