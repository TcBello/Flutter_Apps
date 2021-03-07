import 'package:flutter/material.dart';
import 'package:tap_in_3_seconds/database/database.dart';
import 'package:tap_in_3_seconds/style/style.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  DatabaseService db = DatabaseService();
  List<Map<String, dynamic>> leaderboard = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var data = await db.getLeaderboardInDatabase();

    if(data.isNotEmpty){
      setState(() {
        leaderboard = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("LEADERBOARD", style: leaderboardHeaderStyle,),
              SizedBox(height: 20),
              Column(
                children: List.generate(leaderboard.length, (index){
                  String name = leaderboard[index]['Name'];
                  String score = leaderboard[index]['Score'].toString();
                  String rank = (index + 1).toString();

                  return ListTile(
                    leading: Text(rank, style: rankLeaderboardStyle,),
                    title: Text(name, style: nameLeaderboardStyle,),
                    subtitle: Text("Score: $score", style: scoreLeaderboardStyle,),
                    trailing: Container(
                          height: 40,
                          width: 40,
                          child: index == 0 ? Image.asset('assets/imgs/crown.png', fit: BoxFit.cover,) : Container()
                        )
                  );
                }),
              )
            ],
          ),
        ),
      )
    );
  }
}