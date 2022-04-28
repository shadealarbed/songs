import 'dart:convert';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:senior_demo/audioPlayerPage/colors.dart';
import 'package:http/http.dart' as http;
import 'package:senior_demo/utils/network.dart';
import 'package:senior_demo/utils/url.dart';

class AlbumArt extends StatefulWidget {
  const AlbumArt({
    Key? key,
  }) : super(key: key);

  @override
  _AlbumArtState createState() => _AlbumArtState();
}

class _AlbumArtState extends State<AlbumArt> {
  String lyrics = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Future<List<lyrics>> getProductList() async {
  //   final response = await http.post(Uri.parse('${urls.url}'));
  //
  //   final items = json.decode(response.body).cast<Map<String, dynamic>>();
  //   List<lyrics> lyricss = items.map<lyrics>((json) {
  //     return lyrics.fromJson(json);
  //   }).toList();
  //
  //   return lyricss;
  // }
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
        child: Container(
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(lyrics,style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [

                      ]),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                  onPressed: () async {
                    final response = await http
                        .get(Uri.parse("http://192.168.56.1:7890/lyrics"));

                    final decoded =
                        json.decode(response.body) as Map<String, dynamic>;
                    setState(() {
                      lyrics = decoded['response'];
                      print(lyrics);
                    });
                  },
                  child: Text('Press Me'))
            ],
          ),
          height: 200,
          width: MediaQuery.of(context).size.width - 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.black26),
        ),
      ),
    );
  }
}
