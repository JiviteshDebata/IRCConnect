import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irc_connect_app/pages/LoginPage.dart';

// A better approach would be to redo the flare
// animation with the text and use Spalshscreen.navigate

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(
            flex: 2,
          ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              child: FlareActor(
                "assets/animations/rotating_gear_irc.flr",
                alignment: Alignment.center,
                animation: "rotate_gear",
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          TypewriterAnimatedTextKit(
            onFinished: () => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()))
            },
            text: ["We Learn,We Build,We Share"],
            textStyle: TextStyle(
                fontFamily: "BreeSerif",
                fontSize: 24.0,
                color: CupertinoColors.systemGrey),
            textAlign: TextAlign.start,
            alignment: AlignmentDirectional.topStart,
            isRepeatingAnimation: false,
            speed: Duration(milliseconds: 300),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
