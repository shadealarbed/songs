import 'dart:convert';
import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior_demo/audioPlayerPage/colors.dart';
import 'package:http/http.dart' as http;
import 'package:senior_demo/pages/choosegenre.dart';
import 'package:senior_demo/utils/network.dart';
import 'package:senior_demo/utils/url.dart';



class AlbumArt extends StatefulWidget {
  AlbumArt({Key? key, required this.img}) : super(key: key);
  String img;

  @override
  _AlbumArtState createState() => _AlbumArtState();
}

class _AlbumArtState extends State<AlbumArt> with TickerProviderStateMixin {
  String lyrics = "";
  late AnimationController _controller;
  int i = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    //
    // splitLyrics = lyrics.split("");
    // getWordsListed()[0];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Hero(tag: ChooseGenre.Text1,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                    image: AssetImage('images/${ChooseGenre.Image}'),
                    fit: BoxFit.cover),
              ),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [
                  0.1,
                  0.4
                ],
                    colors: [
                  Colors.black.withOpacity(.7),
                  Colors.white.withOpacity(.01),
                ])),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text(
                    //   lyrics,
                    //   style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                    // ),

                    customAnimatedBuilder(controller: _controller, lyrics: lyrics),
                    ///getWordsListed()[i],
                    FlatButton(
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              "http://192.168.131.80:40222/lyrics"));
                          final decoded = json.decode(response.body)
                              as Map<String, dynamic>;
                          setState(() {
                            _controller.forward();
                            lyrics = decoded['feelings'];
                            print(lyrics);
                            print(lyrics.split(" ").length);
                          });
                        },
                        child: Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.withOpacity(0.5)),
                            child: Text(
                              'Show Lyrics',
                              style: TextStyle(color: Colors.white),
                            ))),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: []),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
      height: 200,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.black26),
    );
  }

  //
  void controlerForward() {
    _controller.forward();
    i++;
  }

  void ControlerRevers() {
    _controller.reverse();
  }

  List<String> split(String string, String separator, {int max = 0}) {
    var result = <String>[];

    if (separator.isEmpty) {
      result.add(string);
      return result;
    }

    while (true) {
      var index = string.indexOf(separator, 0);
      if (index == -1 || (max > 0 && result.length >= max)) {
        result.add(string);
        break;
      }

      result.add(string.substring(0, index));
      string = string.substring(index + separator.length);
    }

    return result;
  }

  List<customAnimatedBuilder> getWordsListed() {
    List<customAnimatedBuilder> FadedList = [];
    for (int i = 0; i < split(lyrics, " ").length; i++) {
      String word = split(lyrics, " ")[i];
      var newFade =
          customAnimatedBuilder(controller: _controller, lyrics: word);
      FadedList.add(newFade);
    }
    return FadedList;
  }
}

class customAnimatedBuilder extends StatefulWidget {
  const customAnimatedBuilder({
    Key? key,
    required AnimationController controller,
    required this.lyrics,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;
  final String lyrics;

  @override
  State<customAnimatedBuilder> createState() => _customAnimatedBuilderState();
}

class _customAnimatedBuilderState extends State<customAnimatedBuilder> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget._controller,
      builder: (context, child) => FadeScaleTransition(
        animation: widget._controller,
        child: Visibility(
          visible: widget._controller.status != AnimationStatus.dismissed,
          child: Container(
            child: Text(widget.lyrics,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
