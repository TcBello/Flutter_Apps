import 'package:flutter/material.dart';
import 'package:tap_in_3_seconds/style/style.dart';

class MainMenu extends StatelessWidget {

  Widget buttonsWidget(BuildContext context){
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 270,
            height: 65,
            child: FlatButton(
              color: color1,
              child: Text("PLAY", style: playStyle,),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              onPressed: (){
                Navigator.pushNamed(context, '/beforePlay');
              },
            ),
          ),
          SizedBox(
            width: 270,
            height: 65,
            child: FlatButton(
              color: color1,
              child: Text("LEADERBOARD", style: leaderboardStyle,),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              onPressed: (){
                Navigator.pushNamed(context, '/leaderboard');
              },
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: Center(
        child: Container(        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("   Taps in\n3 Seconds", style: titleStyle,),
              buttonsWidget(context)
            ],
          ),
        ),
      )
    );
  }
}