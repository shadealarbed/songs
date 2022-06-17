import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayers/web/audioplayers_web.dart';

import 'package:flutter/material.dart';
import 'package:senior_demo/pages/choosegenre.dart';

import 'albumart.dart';
import 'package:http/http.dart' as http;
//import 'package:just_audio/just_audio.dart';

class MyAudio extends ChangeNotifier{

  Duration? totalDuration;
  Duration? position;
  String? audioState;
  String? Songname;

  MyAudio(){
    initAudio();
  }

  AudioPlayer audioPlayer = AudioPlayer();

  initAudio(){
    audioPlayer.onDurationChanged.listen((updatedDuration) {
        totalDuration = updatedDuration;
        notifyListeners();
        Songname = songName;
    });

    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {
        position = updatedPosition;
        notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if(playerState == PlayerState.STOPPED)
        audioState = "Stopped";
      if(playerState==PlayerState.PLAYING)
        audioState = "Playing";
      if(playerState == PlayerState.PAUSED)
        audioState = "Paused";
      notifyListeners();
    });
  }

  Future playAudio() async {
    final player = AudioCache(prefix: "assets/sf2/");
    final url = await player.load("${Songname!}.mp3");
    await audioPlayer.setUrl(url.path,isLocal: true);
    await audioPlayer.play(url.path, isLocal: true);
    print(Songname);

  }


  pauseAudio(){
    audioPlayer.pause();
  }

  stopAudio(){
    audioPlayer.stop();
  }

  seekAudio(Duration durationToSeek){
    audioPlayer.seek(durationToSeek);
  }



}