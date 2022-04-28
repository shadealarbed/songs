import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:senior_demo/pages/ResultPage.dart';
class VoiceMaker extends StatefulWidget {
  static final id = "VoiceMaker";
  const VoiceMaker({Key? key}) : super(key: key);

  @override
  _VoiceMakerState createState() => _VoiceMakerState();
}

class _VoiceMakerState extends State<VoiceMaker> {
  bool  _isalvated = true;
  bool _isalvated2 = false;
  String Singer="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Your Singer"),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.grey[300]!,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black26,
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                        'Choose from these Singers How You Like The Most '),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isalvated = !_isalvated;
                  _isalvated2 = !_isalvated2;
                  Singer = "taylor";
                  print(Singer);

                });
              },
              child: AnimatedContainer(
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Taylor',style: TextStyle(fontWeight: FontWeight.w700,),),

                      ],
                    )),
                duration: const Duration(milliseconds: 200),
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.grey[300]!,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: _isalvated
                    ? [
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
                    ]
                    : null),
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isalvated2 = !_isalvated2;
                  _isalvated = !_isalvated;
                  Singer = "edShereen";
                  print(Singer);
                });
              },
              child: AnimatedContainer(
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Ed Shereen',style: TextStyle(fontWeight: FontWeight.bold),),

                      ],
                    )),
                duration: const Duration(milliseconds: 200),
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.grey[300]!,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: _isalvated2
                    ? [
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
                    ]
                    : null),
              ),
            ),
            SizedBox(height: 30,),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, ResultPage.id);
                  ///uri to server
                },
                child: Container(
                  height: 30,
                  width: 100,
                  child: Center(
                      child: Text(
                        "Next",
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
          ],
        ),
      ),
    );
  }
}
