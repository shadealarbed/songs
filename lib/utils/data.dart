import 'dart:convert';
import 'package:http/http.dart' as http;

getData()async{
  final response = await http
      .get(Uri.parse("http://192.168.56.1:7890/lyrics"));

  final decoded =
  json.decode(response.body) as Map<String, dynamic>;
  var lyric = decoded['response'];
  List Lyrics = [];

}
