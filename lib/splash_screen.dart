import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash_onboard_ui_app/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() { 
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', width: 200),
          const SizedBox(height: 55),
          Platform.isIOS
              ? const CupertinoActivityIndicator()
              : const CircularProgressIndicator(),
        ],
      )),
    );
  }
}

