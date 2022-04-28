class lyrics{
  String? response;
  lyrics({this.response});
  factory lyrics.fromJson(Map<String, dynamic> json) {
    return lyrics(
      response: json['response'],
    );
  }

  Map<String, dynamic> toJson() => {
    'response': response,
  };
}