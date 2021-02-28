import 'package:flutter/material.dart';
import 'package:sim_identifier/screens/main_screen.dart';
import 'package:sim_identifier/style/style.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(MaterialApp(
    home: Splash(),
  ));
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.black,
      useLoader: false,
      seconds: 2,
      title: const Text("SIM IDENTIFIER", style: splashTitleStyle),
      loadingText: const Text("TcBello", style: loadingStyle,),
      navigateAfterSeconds: MainScreen(),
    );
  }
}