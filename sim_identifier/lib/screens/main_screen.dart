import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:sim_identifier/constants/sim.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sim_identifier/style/style.dart';
import 'package:supercharged/supercharged.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AnimationMixin {
  TextEditingController numController = TextEditingController();
  String sim = "Enter first 4 numbers";
  Animation<double> opacityValue;
  bool isIdentified = false;

  @override
  void initState() {
    super.initState();
    opacityValue = 0.0.tweenTo(1.0).animatedBy(controller);
  }

  void onSubmit() {
    String value = numController.text;

    setState(() {
      isIdentified = true;
    });

    controller.play(duration: Duration(milliseconds: 500)).then((value){
      controller.reset();
      setState(() {
        isIdentified = false;
      });
    });

    try{
      if (Sim.sun.contains(int.parse(value))) {
        setState(() {
          sim = "Sun";
        });
      } else if (Sim.globeTm.contains(int.parse(value))) {
        setState(() {
          sim = "Globe/TM";
        });
      } else if (Sim.smartTnt.contains(int.parse(value))) {
        setState(() {
          sim = "Smart/TNT";
        });
      } else if (Sim.abscbn.contains(int.parse(value))) {
        setState(() {
          sim = "ABS-CBN";
        });
      } else {
        setState(() {
          sim = "Can't Identify";
        });
      }
    }catch(e){
      print(e);
      setState(() {
        sim = "Can't Identify";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(52, 78, 92, 1.0),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Opacity(
                  opacity: !isIdentified ? 1.0 : opacityValue.value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: AutoSizeText(
                      sim,
                      style: simStyle,
                      minFontSize: 20,
                      maxFontSize: 35,
                      maxLines: 1,
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: PinCodeTextField(
                    backgroundColor: Color.fromRGBO(52, 78, 92, 1.0),
                    appContext: context,
                    length: 4,
                    onChanged: null,
                    controller: numController,
                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 200),
                    textStyle: pinStyle,
                    pinTheme: pinTheme,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      color: Color.fromRGBO(239, 61, 89, 1.0),
                      child: Text("Identify", style: identifyStyle,),
                      onPressed: onSubmit),
                ),
              ],
            ),
          ),
        ));
  }
}
