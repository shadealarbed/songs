import 'dart:math';
import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior_demo/pages/ChatBootPage.dart';
import 'package:senior_demo/pages/choosegenre.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late double posright1;
  late double posright2;
  late double posleft1;
  late double posleft2;
  late AnimationController _controller;
  late AnimationController controller;
  String? page;

  //
  // bool get isForwardAnimation =>
  //     _controller.status == AnimationStatus.forward ||
  //     _controller.status == AnimationStatus.completed;

  bool visbule = false;
  bool visbule1 = false;
  bool selectedwidget = false;
  bool selectedwidget1 = false;
  int s = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    s++;

    posright1 = 0;
    posright2 = 0;
    posleft1 = 0;
    posleft2 = 0;

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff550062),
        title: Text('Welcome to song generetor'),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/logo.png"),
        )],
      ),
      drawer: const NavigationDrawer(),
      body: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color(0xff550062), const Color(0xffef007e)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  stops: [0.5, 1],
                  tileMode: TileMode.mirror)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (selectedwidget == false) {
                        posright1 = 200;
                        _controller.forward();
                        visbule = true;
                        selectedwidget = !selectedwidget;
                      }
                      else{
                        _controller.reverse();
                        posright1 = 0;
                        visbule = false;
                        selectedwidget = !selectedwidget;

                      }
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Stack(children: [
                            AnimatedPositioned(
                              right: posright1,
                              left: 0,
                              curve: Curves.bounceInOut,
                              duration: Duration(milliseconds: 500),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: AnimatedBuilder(
                                        builder: (context, child) {
                                          return Transform.rotate(
                                            angle: _controller.value * 2 * pi,
                                            child: child,
                                          );
                                        },
                                        animation: _controller.view,
                                        child:
                                            Image.asset('logos/Picture6.png')),
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xffef007e).withOpacity(0.1),
                                        offset: const Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                    child: Text(
                                      'Learn About App',
                                      style: TextStyle(
                                          color: Color(0xffff8700),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xffff8700).withOpacity(0.2),
                                        offset: const Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                left: 150,
                                child: visbule
                                    ? CustomList(description: 'Learn How The App Works \n Know Where We Get Our Resources \n And More..',
                                        icon: Icon(
                                          Icons.chat,
                                          color: Color(0xffef007e),
                                        ),
                                        controller: _controller,
                                        page: ChatBootPage.id,
                                      )
                                    : Container()),
                          ]),
                        ),
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
                      if (selectedwidget1 == false) {
                        posright2 = 200;
                        controller.forward();
                        visbule1 = true;
                        selectedwidget1 = !selectedwidget1;
                      }
                      else{
                        posright2 = 0;
                        controller.reverse();
                        visbule1 = false;
                        selectedwidget1 = !selectedwidget1;
                      }
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Stack(children: [
                            AnimatedPositioned(
                              right: posright2,
                              left: 0,
                              curve: Curves.bounceInOut,
                              duration: Duration(milliseconds: 500),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: AnimatedBuilder(
                                        builder: (context, child) {
                                          return Transform.rotate(
                                            angle: controller.value * 2 * pi,
                                            child: child,
                                          );
                                        },
                                        animation: controller.view,
                                        child:
                                            Image.asset('logos/Picture2.png')),
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xffef007e).withOpacity(0.1),
                                        offset: const Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                    child: Text(
                                      'Genrate Songs',
                                      style: TextStyle(
                                          color: Color(0xffff8700),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xffff8700).withOpacity(0.2),
                                        offset: const Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                left: 150,
                                child: visbule1
                                    ? CustomList(
                                        controller: controller,
                                        page: ChooseGenre.id,
                                        icon: Icon(
                                          Icons.whatshot,
                                          color: Color(0xffef007e),
                                        ),
                                description: 'Make songs Based On What You Feel \n We Have a Different Types Of Genres For Your Musical Taste ',)
                                    : Container()),
                          ]),
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black26),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 200,),
                Center(child: Text("Song Generator",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                SizedBox(height: 10,),
                Center(child: Text("Version 1.0.$s",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white),),)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class CustomList extends StatelessWidget {
  const CustomList({
    Key? key,
    required AnimationController controller,
    required this.page,
    required this.icon,
    required this.description,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;
  final Icon icon;
  final String page;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => FadeScaleTransition(
            animation: _controller,
            child: child,
          ),
          child: Visibility(
            visible: _controller.status != AnimationStatus.dismissed,
            child: Container(
              height: 154,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      description,
                      style: TextStyle(color: Color(0xffff8700)),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, page);
                      },
                      child: CustomBotton(
                        icon: icon,
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.01),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        )
      ],
    );
  }
}
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  => Drawer(backgroundColor: Color(0xffff8700),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
        buildMenuItems(context),
        ],
      ),
    ),
  );
  Widget buildHeader(BuildContext context)=> Container(
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
  );
  Widget buildMenuItems(BuildContext context)=> Container(
    padding: EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: Text('Home'),
          onTap: (){Navigator.pushNamed(context, ChooseGenre.id);},
        ),
        const Divider(color: Colors.black45,),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: Text('Favurites'),
          onTap: (){},
        ),
      ],
    ),
  );
  }



class CustomBotton extends StatelessWidget {
  const CustomBotton({
    required this.icon,
    Key? key,
  }) : super(key: key);
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      child: icon,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffef007e).withOpacity(0.1)),
    );
  }
  
}
