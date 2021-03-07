import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tap_in_3_seconds/style/style.dart';
import 'package:supercharged/supercharged.dart';
import 'package:tap_in_3_seconds/database/database.dart';

class Play extends StatefulWidget {
  final double deviceWidth;
  Play(this.deviceWidth);

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> with AnimationMixin{
  DatabaseService db = DatabaseService();
  TextEditingController nameController = TextEditingController();
  ConfettiController confettiController;
  Animation<double> widthAnimation;
  Animation<double> opacityAnimation;
  AnimationController opacityController;
  int time = 3;
  int tap = 0;
  bool isTimesUp = false;
  int highScore = 0;
  String message = "TAP NOW!";

  @override
  void initState() {
    super.initState();
    opacityController = createController();
    confettiController = ConfettiController(duration: Duration(seconds: 1));
    widthAnimation = widget.deviceWidth.tweenTo(0.0).animatedBy(controller);
    opacityAnimation = 0.0.tweenTo(1.0).animatedBy(opacityController);
    getHighScore();
    startTimer();
  }

  Future<bool> onWillPop(){
    return Future.value(false);
  }

  void getHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentHighScore = prefs.getInt('highscore');

    if(currentHighScore != null){
      setState(() {
        highScore = currentHighScore;
      });
    }
  }

  void setHighScore() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(tap > highScore){
      await prefs.setInt('highscore', tap);
    }
  }

  void showScore() async{
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context){
        return WillPopScope(
          onWillPop: onWillPop,
          child: Dialog(
            backgroundColor: color3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConfettiWidget(
                    confettiController: confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    numberOfParticles: 20,
                    gravity: 0.05,
                    shouldLoop: false,
                    colors: [
                      Colors.green,
                      Colors.red,
                      Colors.blue
                    ],
                  ),
                  SizedBox(height: 30,),
                  tap > highScore
                    ? Text("New HighScore", style: newHighscoreStyle,)
                    : Text("Your Score", style: newHighscoreStyle),
                  Container(child: Text(tap.toString(), style: scoreStyle,)),
                  SizedBox(height: 20,),
                  Container(
                    width: 230,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3, left: 10, right: 10),
                      child: TextField(
                        controller: nameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Enter your name",
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          hintStyle: hintStyle,                       
                        ),
                        style: inputStyle,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: color1,
                          borderRadius: BorderRadiusDirectional.circular(30.0)
                        ),
                        child: IconButton(
                          color: white,
                          icon: Icon(Icons.replay),
                          onPressed: (){
                            setHighScore();

                            if(nameController.text == "" || nameController.text == null){
                              db.insertDataInDatabase("Guest", tap).whenComplete((){
                                Navigator.pop(context);
                                Navigator.popAndPushNamed(context, '/beforePlay');
                              });
                            }
                            else{
                              db.insertDataInDatabase(nameController.text, tap).whenComplete((){
                                Navigator.pop(context);
                                Navigator.popAndPushNamed(context, '/beforePlay');
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: color1,
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: IconButton(
                          color: white,
                          icon: Icon(Icons.menu),
                          onPressed: (){
                            setHighScore();
                            
                            if(nameController.text == "" || nameController.text == null){
                              db.insertDataInDatabase("Guest", tap).whenComplete((){
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                            }
                            else{
                              db.insertDataInDatabase(nameController.text, tap).whenComplete((){
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                            }
                          },
                        ),
                      ), 
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  void startTimer(){
    Future.delayed(Duration(milliseconds: 300), (){
      controller.play(duration: Duration(seconds: 3));

      Future.delayed(Duration(seconds: 1),(){
        setState(() {
          time -= 1;
        });
      });

      Future.delayed(Duration(seconds: 2),(){
        setState(() {
          time -= 1;
        });
      });

      Future.delayed(Duration(seconds: 3),(){
        setState(() {
          time -= 1;
        });
      }).whenComplete((){
        setState(() {
          isTimesUp = true;
          message = "Times Up!";
        });
        opacityController.play();

        Future.delayed(Duration(seconds: 1), (){
          if(tap > highScore){
            confettiController.play();
          }

          showScore();
        });
      });
    });
  }

  Widget timerAndScoreWidget(){
    return Center(
      child: Container(
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.alarm, size: 30, color: white,),
                SizedBox(width: 15,),
                Text(time.toString(), style: timerAndScoreStyle,)
              ],
            ),
            Row(
              children: [
                Icon(Icons.touch_app_outlined, size: 30, color: white,),
                SizedBox(width: 15,),
                Text(tap.toString(), style: timerAndScoreStyle,)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: InkWell(
          splashColor: color3,
          highlightColor: color1,
          onTap: (){
            if(!isTimesUp){
              setState(() {
                tap += 1;
              });
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: widthAnimation.value,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: gradientColor
                  ),
                  borderRadius: BorderRadius.circular(10.0)
                ),
              ),
              SizedBox(height: 10,),
              timerAndScoreWidget(),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                  child: Opacity(
                    opacity: !isTimesUp
                      ? 1.0
                      : opacityAnimation.value,
                    child: Text(message, style: tapNowStyle,),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}