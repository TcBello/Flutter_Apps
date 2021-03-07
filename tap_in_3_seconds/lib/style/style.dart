import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color white = Colors.white;
const Color color1 = Color(0xFF223745);
const Color color2 = Color(0xFF95ABAC);
const List<Color> gradientColor = [Color(0xFFB46D81), Color(0xFFD8737F)];
const Color color3 = Color(0xFFD8737F);

TextStyle titleStyle = GoogleFonts.raleway(
  color: white,
  fontSize: 50,
  fontWeight: FontWeight.w500
);

TextStyle playStyle = GoogleFonts.raleway(
  color: white,
  fontSize: 20,
  letterSpacing: 5.0
);

TextStyle leaderboardStyle = GoogleFonts.raleway(
  color: white,
  fontSize: 20,
  letterSpacing: 5.0
);

TextStyle gameStyle = GoogleFonts.raleway(
  color: white,
  fontSize: 40,
  letterSpacing: 2.0,
  fontWeight: FontWeight.w600
);

TextStyle timerBeforeStyle(double size){
  return GoogleFonts.raleway(
    color: white,
    fontSize: size,
    fontWeight: FontWeight.bold
  );
}

TextStyle timerAndScoreStyle = GoogleFonts.raleway(
  color: white,
  fontSize: 30,
  fontWeight: FontWeight.w300
);

TextStyle tapNowStyle = GoogleFonts.raleway(
  color: white,
  fontSize: 50,
  fontWeight: FontWeight.bold
);

TextStyle newHighscoreStyle = GoogleFonts.raleway(
  color: white,
  fontSize: 35,
  fontWeight: FontWeight.w600
);

TextStyle scoreStyle = GoogleFonts.raleway(
  color: white,
  fontSize: 130,
  fontWeight: FontWeight.bold
);

TextStyle hintStyle = GoogleFonts.raleway(
  color: color3,
  fontWeight: FontWeight.w400
);

TextStyle inputStyle = GoogleFonts.raleway(
  color: Colors.black,
  fontWeight: FontWeight.w600
);

TextStyle leaderboardHeaderStyle = GoogleFonts.raleway(
  color: white,
  letterSpacing: 5,
  fontSize: 30,
  fontWeight: FontWeight.w600
);

TextStyle rankLeaderboardStyle = GoogleFonts.raleway(
  color: white,
  fontWeight: FontWeight.bold,
  fontSize: 30
);

TextStyle nameLeaderboardStyle = GoogleFonts.raleway(
  color: white,
  fontWeight: FontWeight.w600,
  fontSize: 20
);

TextStyle scoreLeaderboardStyle = GoogleFonts.raleway(
  color: white,
);