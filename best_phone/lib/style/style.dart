import 'package:flutter/material.dart';

const TextStyle categoryHeaderStyle = TextStyle(
  color: Colors.blue,
  fontSize: 30,
  fontWeight: FontWeight.bold,
  letterSpacing: 2
);

TextStyle categoryTextStyle(bool isActive){
  return TextStyle(
    color: isActive ? Colors.white : Colors.black,
    fontSize: 20
  );
}

const TextStyle nameBannerStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 25,
  letterSpacing: 2.0
);

const TextStyle rankBannerStyle =  TextStyle(
  color: Colors.orange,
  fontStyle: FontStyle.italic,
  fontSize: 16
);

const TextStyle reviewTitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
);

const TextStyle reviewHeaderStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 22
);

const TextStyle specStyle = TextStyle(
  color: Colors.black,
  fontSize: 18
);