import 'package:flutter/material.dart';
import 'package:tap_in_3_seconds/database/database.dart';
import 'package:tap_in_3_seconds/screens/before_play.dart';
import 'package:tap_in_3_seconds/screens/leader_board.dart';
import 'package:tap_in_3_seconds/screens/main_menu.dart';
import 'package:tap_in_3_seconds/screens/play.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseService().initDatabase();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => MainMenu(),
        '/beforePlay':(context) => BeforePlay(),
        '/play':(context) => Play(MediaQuery.of(context).size.width),
        '/leaderboard':(context) => LeaderBoard()
      },
    );
  }
}