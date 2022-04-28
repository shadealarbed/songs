import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:senior_demo/pages/choosegenre.dart';

import 'generate_song/MoodSongs.dart';

class GenrateSong extends StatefulWidget {
  static final id = "GenrateSong";

  const GenrateSong({Key? key}) : super(key: key);

  @override
  _GenrateSongState createState() => _GenrateSongState();
}

class _GenrateSongState extends State<GenrateSong> {
  String mood = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Hi how may i help you"),
          backgroundColor: Colors.deepPurple,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                child: Image.asset(
                  "assets/note2.png",
                  height: 35,
                  width: 35,
                ),
                tag: 2,
              ),
            ),
          ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[300]!,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Hi There Lets Start Creating Your Song'),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('What Are you Feeling !!'),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, ChooseGenre.id);
                  setState(() {
                    mood = "Happy";
                  });

                  ///uri to server
                },
                child: Container(
                  height: 30,
                  width: 100,
                  child: Center(
                      child: Text(
                    "Happy",
                    style: TextStyle(color: Colors.white),
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                            color: Colors.white,
                            offset: const Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1)
                      ]),
                )),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, ChooseGenre.id);
                  setState(() {
                    mood = "sad";
                  });

                  ///uri to server
                },
                child: Container(
                  height: 30,
                  width: 100,
                  child: Center(
                      child: Text(
                    "Sad",
                    style: TextStyle(color: Colors.white),
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                            color: Colors.white,
                            offset: const Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1)
                      ]),
                ))
          ],
        ),
      ),
    );
  }
}
