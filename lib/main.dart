import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
//import 'package:intro_slider/slide_object.dart';
import 'package:provider/provider.dart';
import 'package:senior_demo/pages/ChatBootPage.dart';
import 'package:senior_demo/pages/GenrateSong.dart';
import 'package:senior_demo/pages/HomePage.dart';
import 'package:senior_demo/pages/ResultPage.dart';
import 'package:senior_demo/pages/choosegenre.dart';
import 'package:senior_demo/pages/generate_song/MoodSongs.dart';
import 'package:senior_demo/sign_in_up/LoginScreen.dart';
import 'package:senior_demo/sign_in_up/RegistrationScreen.dart';
import 'package:senior_demo/sign_in_up/welcomeScreen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
//import 'package:intro_slider/scrollbar_behavior_enum.dart';

import 'package:senior_demo/audioPlayerPage/myaudio.dart';
import 'components/VoiceMaker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ChatBootPage.id: (context) => ChatBootPage(),
        GenrateSong.id: (context) => GenrateSong(),
        MoodSongs.id: (context) => MoodSongs(),
        VoiceMaker.id: (context) => VoiceMaker(),
        ResultPage.id: (context) => ResultPage(motion: '',img: '',),
        ChooseGenre.id: (context) => ChooseGenre(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context)=> RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen()
      },
      home: SplashScreenView(
        navigateRoute: WelcomeScreen(),
        duration: 5000,
        imageSize: 130,
        imageSrc: "assets/logo.png",
        text: "Song Generetor App",
        textType: TextType.ColorizeAnimationText,
        textStyle: TextStyle(
          fontSize: 40.0,
        ),
        colors: [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
        backgroundColor: Colors.white,
      ),
    );
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];
  late double postop;
  late double posbuttom;
  bool start = false;

  @override
  void initState() {
    super.initState();

    postop = 0;
    slides.add(
      new Slide(
        title: "SONG GENERATOR",
        maxLineTitle: 2,
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono',
        ),
        // description:
        //     "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
        ),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Text("Welcome To A New Experince Of Wild Music",
            style: TextStyle(color: Colors.white70, fontSize: 20)),
        backgroundImage: "assets/Music Poster.jpg",
        foregroundImageFit: BoxFit.fill,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title: "Make Your Music",
        styleTitle: TextStyle(
            color: Color(0xff7FFFD4),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Oswald'),
        centerWidget: AnimatedPositioned(
          child: Container(
            child: Text(
              "Feeling Kinda Stress And Tired ?",
              style: TextStyle(fontSize: 20,color: Colors.white),
            ),
          ),
          duration: Duration(milliseconds: 1000),
          bottom: start ? postop : 0,
        ),
        styleDescription: TextStyle(
            color: Color(0xff7FFFD4),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        backgroundImage: "assets/music poster2.jfif",
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "Discover",
        styleTitle: TextStyle(
            color: Color(0xffFFDAB9),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:"We Help Your Music Taste Gets Better",
        styleDescription: TextStyle(
            color: Color(0xffFFDAB9),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        backgroundImage: "assets/music poster3.jfif",
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }

  void onNextPress() {
    print("onNextPress caught");
    setState(() {
      start = true;
      postop = 200;
    });
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffF3B4BA),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffF3B4BA),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffF3B4BA),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0x33F3B4BA)),
      overlayColor: MaterialStateProperty.all<Color>(Color(0x33FFA8B0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: this.renderNextBtn(),
      onNextPress: this.onNextPress,
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      },
      doneButtonStyle: myButtonStyle(),
      onSkipPress: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      },

      // Dot indicator
      colorDot: Color(0x33FFA8B0),
      colorActiveDot: Color(0xffFFA8B0),
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Color(0xff550062),

      // Scrollbar
      // verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
      // scrollPhysics: BouncingScrollPhysics(),
    );
  }
}
