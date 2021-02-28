import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const String font = "Montserrat";

const TextStyle simStyle = TextStyle(
  color: Colors.white,
  fontFamily: font,
  fontWeight: FontWeight.w600,
  fontSize: 35
);

const TextStyle identifyStyle = TextStyle(
  color: Colors.white,
  fontFamily: font,
  letterSpacing: 3.0,
  fontWeight: FontWeight.bold,
  fontSize: 20
);

PinTheme pinTheme = PinTheme(
  shape: PinCodeFieldShape.circle,
  inactiveColor: Color.fromRGBO(225, 122, 71, 1.0),
  selectedColor: Color.fromRGBO(239, 201, 88, 1.0),
  fieldHeight: 60.0,
  fieldWidth: 60.0,
);

const TextStyle pinStyle = TextStyle(
  color: Colors.white,
  fontFamily: font,
  fontSize: 25
);

const TextStyle splashTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: font,
  fontWeight: FontWeight.w600,
  letterSpacing: 2.0,
  fontSize: 30
);

const TextStyle loadingStyle = TextStyle(
  color: Colors.white,
  fontFamily: font,
  fontStyle: FontStyle.italic,
  letterSpacing: 2.0,
  fontSize: 20
);