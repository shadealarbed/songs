import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_demo/audioPlayerPage/myaudio.dart';

import 'colors.dart';

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width -10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black26,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Controls(
                  icon: Icons.repeat,
                ),
                Controls(
                  icon: Icons.skip_previous,
                ),
                PlayControl(),
                Controls(
                  icon: Icons.skip_next,
                ),
                Controls(
                  icon: Icons.shuffle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyAudio>(
      builder: (_, myAudioModel, child) => GestureDetector(
        onTap: () {
          myAudioModel.audioState == "Playing"
              ? myAudioModel.pauseAudio()
              : myAudioModel.playAudio();
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xff550062),
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    )]
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: primaryColor, shape: BoxShape.circle),
                  child: Center(
                      child: Icon(
                    myAudioModel.audioState == "Playing"
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 50,
                    color: darkPrimaryColor,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Controls extends StatelessWidget {
  final IconData? icon;

  const Controls({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Color(0xff550062),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(color: primaryColor, shape: BoxShape.circle),
              child: Center(
                  child: Icon(
                icon,
                size: 30,
                color: darkPrimaryColor,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
