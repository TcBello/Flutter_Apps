import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tap_in_3_seconds/style/style.dart';
import 'package:supercharged/supercharged.dart';

class BeforePlay extends StatefulWidget{
  @override
  _BeforePlayState createState() => _BeforePlayState();
}

class _BeforePlayState extends State<BeforePlay> with AnimationMixin{
  int timer = 3;
  Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    sizeAnimation = 400.0.tweenTo(200.0).animatedBy(controller);
    playAnimation();
  }

  void playAnimation() async {
    controller.play();

    Future.delayed(Duration(seconds: 1), (){
      controller.reset();

      setState(() {
        timer -= 1;
      });

      controller.play();
    });

    Future.delayed(Duration(seconds: 2), (){
      controller.reset();

      setState(() {
        timer -= 1;
      });

      controller.play().whenComplete(() => Navigator.popAndPushNamed(context, '/play'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("THE GAME\nSTARTS IN", style: gameStyle),
              Container(
                height: 400,
                child: Text(timer.toString(), style: timerBeforeStyle(sizeAnimation.value),),
              )
            ],
          ),
        ),
      ),
    );
  }
}