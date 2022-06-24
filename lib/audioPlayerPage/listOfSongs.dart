import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_demo/pages/ResultPage.dart';
import 'package:senior_demo/pages/choosegenre.dart';

import 'myaudio.dart';

class ListSongs extends StatefulWidget {
  ListSongs({Key? key, this.SongName, this.function})
      : super(key: key);
  String? SongName;
  List<Row>? function;
  static int songCount = 0;

  @override
  _ListSongsState createState() => _ListSongsState();
}

class _ListSongsState extends State<ListSongs> {
  @override
  void initState() {
    buildSongContainer()![ListSongs.songCount];
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "List Of Your Songs",
          ),
          backgroundColor: Color(0xff550062),
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
          child: ListView.builder(itemCount: ListSongs.songCount,itemBuilder: (child,index){
            return buildSongContainer()![ListSongs.songCount];
          }
          ),
        ));
  }

  List<songTitle>? buildSongContainer() {
    List<songTitle> listOfsongs = [];
    List<String>? imgs = [];
    List<String>? titls = [];
    for (int i = 0; i < 100; i++) {
      imgs.add(ChooseGenre.Image);
      titls.add(ChooseGenre.Text1);
      var songs = songTitle(
        context: context,
        context1: context,
        pic: imgs[i],
        songtitle: titls[i],
      );
      listOfsongs.add(songs);
    }
    return listOfsongs;
  }
}

class songTitle extends StatefulWidget {
  songTitle(
      {Key? key,
      required this.context,
      required this.context1,
      required this.songtitle,
      required this.pic})
      : super(key: key);

  final BuildContext context;
  final BuildContext context1;
  String songtitle;
  String pic;

  @override
  State<songTitle> createState() => _songTitleState();
}

class _songTitleState extends State<songTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0, top: 10),
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ResultPage()));
            setState(() {
              MyAudio().Songname = widget.songtitle;
            });

          },
          child:  Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Hero(
                            tag: widget.songtitle,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "images/${widget.pic}"),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Divider(
                              color: Colors.black, height: 100, thickness: 10),
                          Container(
                            child: Text(
                              widget.songtitle,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
