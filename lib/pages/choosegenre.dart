import 'dart:convert';
import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:senior_demo/pages/ResultPage.dart';
import 'package:http/http.dart' as http;




class ChooseGenre extends StatefulWidget {
  static final id = "ChooseGenre";
  static String songName = "";
  static String Image = "";
  static String Text1 = "";
  static bool seeResult=false;


  const ChooseGenre({Key? key,}) : super(key: key);

  @override
  _ChooseGenreState createState() => _ChooseGenreState();
}

class _ChooseGenreState extends State<ChooseGenre>
    with TickerProviderStateMixin {
  List<bool> _isalvated = [false, false, false, false, false, false];


  String genre = "";
  late double posright;
  bool showSpinner = false;

  late AnimationController _controller;

  final _formkey = GlobalKey<FormState>();

  Future<void> _savingData() async {
    final validation = await _formkey.currentState!.validate();
    if (!validation) {
      return;
    }
    _formkey.currentState!.save();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    posright = 0;
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Color(0xff550062),
          pinned: true,
          snap: true,
          floating: true,
          title: Container(
            child: Text("Choose The Genre You Want"),
          ),
          expandedHeight: 50,
        ),
        SliverToBoxAdapter(
          child: getBody(),
        )
      ],
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff550062), const Color(0xffef007e)],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: [0.5, 1],
              tileMode: TileMode.mirror),
        ),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      posright = 220;
                      _isalvated[0] = !_isalvated[0];
                      _isalvated[0]
                          ? _controller.forward()
                          : _controller.reverse();
                    });
                  },
                  clipBehavior: Clip.antiAlias,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        child: Stack(alignment: Alignment.center, children: [
                          AnimatedPositioned(
                            curve: Curves.bounceOut,
                            duration: Duration(milliseconds: 800),
                            right: _isalvated[0] ? posright : 130,
                            child: Column(
                              children: [
                                Container(
                                  child: Image.asset(
                                    'emotions/smile.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xffef007e)
                                              .withOpacity(0.1),
                                          offset: const Offset(4, 4),
                                          blurRadius: 15,
                                          spreadRadius: 1,
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Happy",
                                  style: TextStyle(color: Color(0xffff8700)),
                                )
                              ],
                            ),
                          ),
                          _isalvated[0]
                              ? customDescription(
                            showSpinner: showSpinner,
                                  controller: _controller,
                                  type: "happy",
                                  img: "happy.jpg",
                                  description:
                                      "Feeling happy\n and you want stop\n Here We Have A Good Song\n Waiting For You",
                                )
                              : Container()
                        ]),
                        height: 200,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black26),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      posright = 220;
                      _isalvated[1] = !_isalvated[1];
                      _isalvated[1]
                          ? _controller.forward()
                          : _controller.reverse();
                    });
                  },
                  clipBehavior: Clip.none,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        child: Stack(alignment: Alignment.center, children: [
                          AnimatedPositioned(
                            curve: Curves.bounceOut,
                            duration: Duration(milliseconds: 800),
                            right: _isalvated[1] ? posright : 130,
                            child: Column(
                              children: [
                                Container(
                                  child: Image.asset(
                                    'emotions/sadness.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xffef007e)
                                              .withOpacity(0.1),
                                          offset: const Offset(4, 4),
                                          blurRadius: 15,
                                          spreadRadius: 1,
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Sadness",
                                  style: TextStyle(color: Color(0xffff8700)),
                                )
                              ],
                            ),
                          ),
                          _isalvated[1]
                              ? customDescription(
                            showSpinner: showSpinner,
                                  controller: _controller,
                                  type: "sad",
                                  img: "sad.jpg",
                                  description:
                                      "You Feel Stressed \n and You Want Something \n To Cure Your Soul")
                              : Container()
                        ]),
                        height: 200,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black26),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      posright = 220;
                      _isalvated[2] = !_isalvated[2];
                      _isalvated[2]
                          ? _controller.forward()
                          : _controller.reverse();
                    });
                  },
                  clipBehavior: Clip.none,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        child: Stack(alignment: Alignment.center, children: [
                          AnimatedPositioned(
                            curve: Curves.bounceOut,
                            duration: Duration(milliseconds: 800),
                            right: _isalvated[2] ? posright : 130,
                            child: Column(
                              children: [
                                ModalProgressHUD(
                                  inAsyncCall: showSpinner,
                                  child: Container(
                                    child: Image.asset(
                                      'emotions/relationship.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xffef007e)
                                                .withOpacity(0.1),
                                            offset: const Offset(4, 4),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Love",
                                  style: TextStyle(color: Color(0xffff8700)),
                                )
                              ],
                            ),
                          ),
                          _isalvated[2]
                              ? customDescription(
                            showSpinner: showSpinner,
                                  controller: _controller,
                                  type: "romance",
                                  img: "romance.jpg",
                                  description:
                                      "You Are In Love \n And You Cant Explain \n That Warm Feelings")
                              : Container()
                        ]),
                        height: 200,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black26),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      posright = 220;
                      _isalvated[3] = !_isalvated[3];
                      _isalvated[3]
                          ? _controller.forward()
                          : _controller.reverse();
                    });
                  },
                  clipBehavior: Clip.none,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        child: Stack(alignment: Alignment.center, children: [
                          AnimatedPositioned(
                            curve: Curves.bounceOut,
                            duration: Duration(milliseconds: 800),
                            right: _isalvated[3] ? posright : 130,
                            child: Column(
                              children: [
                                Container(
                                  child: Image.asset(
                                    'emotions/excited.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xffef007e)
                                              .withOpacity(0.1),
                                          offset: const Offset(4, 4),
                                          blurRadius: 15,
                                          spreadRadius: 1,
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Excited",
                                  style: TextStyle(color: Color(0xffff8700)),
                                )
                              ],
                            ),
                          ),
                          _isalvated[3]
                              ? customDescription(
                            showSpinner: showSpinner,
                                  controller: _controller,
                                  type: "advanture",
                                  img: "adv1.png",
                                  description:
                                      "You Feel Excited \n And You Want Something \n That Would Rock Your Day")
                              : Container()
                        ]),
                        height: 200,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black26),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // TextButton(
                //   onPressed: () {
                //     setState(() {
                //       posright = 220;
                //       _isalvated[4] = !_isalvated[4];
                //       _isalvated[4]
                //           ? _controller.forward()
                //           : _controller.reverse();
                //     });
                //   },
                //   clipBehavior: Clip.none,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(25.0),
                //     child: BackdropFilter(
                //       filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                //       child: Container(
                //         child: Stack(alignment: Alignment.center, children: [
                //           AnimatedPositioned(
                //             curve: Curves.bounceOut,
                //             duration: Duration(milliseconds: 800),
                //             right: _isalvated[4] ? posright : 130,
                //             child: Column(
                //               children: [
                //                 Container(
                //                   child: Image.asset(
                //                     'emotions/angry1.png',
                //                     width: 100,
                //                     height: 100,
                //                   ),
                //                   decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(20),
                //                       boxShadow: [
                //                         BoxShadow(
                //                           color: Color(0xffef007e)
                //                               .withOpacity(0.1),
                //                           offset: const Offset(4, 4),
                //                           blurRadius: 15,
                //                           spreadRadius: 1,
                //                         ),
                //                       ]),
                //                 ),
                //                 SizedBox(
                //                   height: 10,
                //                 ),
                //                 Text(
                //                   "Dreams",
                //                   style: TextStyle(color: Color(0xffff8700)),
                //                 )
                //               ],
                //             ),
                //           ),
                //           _isalvated[4]
                //               ? customDescription(
                //             showSpinner: showSpinner,
                //                   controller: _controller,
                //                   type: "Angry",
                //                   img: "angry.jpg",
                //                   description:
                //                       "You Feel Sleepy \n And You Cant Hold  \n Those Dreams You Want To \n Make True ")
                //               : Container()
                //         ]),
                //         height: 200,
                //         width: MediaQuery.of(context).size.width - 50,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(25),
                //             color: Colors.black26),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      posright = 220;
                      _isalvated[5] = !_isalvated[5];
                      _isalvated[5]
                          ? _controller.forward()
                          : _controller.reverse();
                    });
                  },
                  clipBehavior: Clip.none,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: ModalProgressHUD(
                        inAsyncCall: showSpinner,
                        child: Container(
                          child: Stack(alignment: Alignment.center, children: [
                            AnimatedPositioned(
                              curve: Curves.bounceOut,
                              duration: Duration(milliseconds: 800),
                              right: _isalvated[5] ? posright : 130,
                              child: Column(
                                children: [
                                  Container(
                                    child: Image.asset(
                                      'emotions/calm.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xffef007e)
                                                .withOpacity(0.1),
                                            offset: const Offset(4, 4),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Relaxing",
                                    style: TextStyle(color: Color(0xffff8700)),
                                  )
                                ],
                              ),
                            ),
                            _isalvated[5]
                                ? customDescription(
                              showSpinner: showSpinner,
                                    controller: _controller,
                                    type: "relax",
                                    img: "relax.jpg",
                                    description:
                                        "You Just Won Something \n And You Want To Taste \n What Is It Like To Be \n Successful!!")
                                : Container()
                          ]),
                          height: 200,
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.black26),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                    onPressed: () async {
                      if(ChooseGenre.seeResult == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultPage(
                                      motion: ChooseGenre.Text1,
                                      img: ChooseGenre.Image,
                                    )));
                      }

                    },
                    child: Container(
                      key: _formkey,
                      child: Text(
                        'See Result',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 18,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class customDescription extends StatelessWidget {
  customDescription({
    Key? key,
    required AnimationController controller,
    required this.description,
    required this.type,
    required this.img,
    required this.showSpinner
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;
  final String description;
  String type;
  String img;
  bool showSpinner;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 150,
        bottom: 20,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => FadeScaleTransition(
            animation: _controller,
            child: Visibility(
              visible: _controller.status != AnimationStatus.dismissed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      description,
                      style: TextStyle(color: Color(0xffff8700)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffff8700).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Choose :)',
                            style: TextStyle(color: Color(0xffff8700)),
                          ),
                          CustomeSelected(
                            text: type,
                            img: img,
                            showSpinner: showSpinner,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class CustomeSelected extends StatefulWidget {
  CustomeSelected({required this.text, required this.img,required this.showSpinner});

  String text;
  String img;
  bool showSpinner;

  @override
  _CustomeSelectedState createState() => _CustomeSelectedState();
}

class _CustomeSelectedState extends State<CustomeSelected> {
  bool isSelected = false;

  // final _formkey = GlobalKey<FormState>();
  //
  // Future<void> _savingData() async{
  //   final validation = await _formkey.currentState!.validate();
  //   if (!validation){
  //     return;
  //   }
  //   _formkey.currentState!.save();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      //key: _formkey,
      child: IconButton(
        onPressed: () async {
          setState(() {
            widget.showSpinner = true;
          });
          try {
            final response = await http.post(
                (Uri.parse("http://192.168.131.80:40222/lyrics")),
                body: json.encode({'feelings': widget.text}));
            final response1 = await http.post(
                (Uri.parse("http://192.168.131.80:40222/music")),
                body: json.encode({'feelings': widget.text}));
            setState(() {
              isSelected = !isSelected;
              print(response1.body);
              print(response.body);
              print(widget.text);
              ChooseGenre.Text1 = widget.text;
              ChooseGenre.Image = widget.img;
              ChooseGenre.songName = widget.text;
            });
            setState(() {
              widget.showSpinner = false;
              ChooseGenre.seeResult=true;
            });
          }
          catch(e){
            print(e);
          }
          ///send to the server
        },
        icon: isSelected
            ? Icon(Icons.check_circle)
            : Icon(Icons.check_circle_outlined),
        color: Color(0xffff8700),
      ),
    );
  }
}
