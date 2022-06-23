//import 'package:audioplayers/audioplayers.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_demo/audioPlayerPage/albumart.dart';
import 'package:senior_demo/audioPlayerPage/colors.dart';
import 'package:senior_demo/audioPlayerPage/listOfSongs.dart';
import 'package:senior_demo/audioPlayerPage/myaudio.dart';
import 'package:senior_demo/audioPlayerPage/navbar.dart';
import 'package:senior_demo/audioPlayerPage/playerControls.dart';
import 'package:senior_demo/pages/choosegenre.dart';

// import 'package:http/http.dart' as http;
// import 'package:senior_demo/pages/choosegenre.dart';
// import 'package:senior_demo/utils/data.dart';
//import 'package:just_audio/just_audio.dart';

///import 'package:just_audio/just_audio.dart';

class ResultPage extends StatefulWidget {
  static final id = "ResultPage";
  String? motion;
  String? img;
  static String tag = "";

  ResultPage({Key? key, this.motion, this.img}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double valueHolder = 20;
  AudioPlayer audioPlayer = AudioPlayer();
  double sliderValue = 2;
  String lyrics = "";

  Map audioData = {
    'image':
        'https://thegrowingdeveloper.org/thumbs/1000x1000r/audios/quiet-time-photo.jpg',
    'url':
        'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4'
  };

  // AudioCache audioCache = AudioCache();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (_) => MyAudio(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Song'),
          backgroundColor: Color(0xff550062),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ListSongs(SongName: ChooseGenre.songName)));
                },
                icon: Icon(Icons.list))
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color(0xff550062), const Color(0xffef007e)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  stops: [0.5, 1],
                  tileMode: TileMode.mirror)),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25, top: 20),
                  height: height / 2.5,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return AlbumArt(img: ChooseGenre.Image);
                    },
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  ChooseGenre.Text1,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                ),
                SizedBox(
                  height: 80,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        ListSongs.songCount++;
                        print(ListSongs.songCount);
                      });
                    },
                    icon: Icon(Icons.save_alt)),
                Column(
                  children: [
                    SliderTheme(
                      data: SliderThemeData(
                          trackHeight: 5,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 5)),
                      child: Consumer<MyAudio>(
                        builder: (_, myAudioModel, child) => Slider(
                          value: myAudioModel.position == null
                              ? 0
                              : myAudioModel.position!.inMilliseconds
                                  .toDouble(),
                          activeColor: primaryColor,
                          inactiveColor: darkPrimaryColor.withOpacity(0.3),
                          onChanged: (value) {
                            myAudioModel.seekAudio(
                                Duration(milliseconds: value.toInt()));
                          },
                          min: 0,
                          max: myAudioModel.totalDuration == null
                              ? 20
                              : myAudioModel.totalDuration!.inMilliseconds
                                  .toDouble(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //_progressBar(),
                //PlayerButtons(audioPlayer),
                PlayerControls(),
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
