import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash_onboard_ui_app/splash_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SplashScreen()));

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showHome', true);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: 'Page 1',
          body:
              'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.',
          image: _buildImage('intro_1.png'),
        ),
        PageViewModel(
          title: 'Page 2',
          body:
              'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.',
          image: _buildImage('intro_2.png'),
        ),
        PageViewModel(
          title: 'Page 3',
          body:
              'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.',
          image: _buildImage('intro_3.png'),
        ),
      ],
      onDone: _onIntroEnd,
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      next: const Icon(Icons.arrow_forward),
      done: const Text(
        'Done',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      dotsContainerDecorator: const ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)))),
    ));
  }
}
