import 'package:best_phone/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    App()
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}