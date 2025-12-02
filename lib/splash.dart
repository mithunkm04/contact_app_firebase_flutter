import 'package:flutter/material.dart';
import 'package:frebase_flutter/home.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 6),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
    },);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child:Lottie.asset("assets/Google Icons _ Contacts.json"))
    );
  }
}