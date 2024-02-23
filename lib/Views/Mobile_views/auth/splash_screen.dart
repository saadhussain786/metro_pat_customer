import 'dart:async';

import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Views/Mobile_views/auth/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(seconds: 3),
        ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login(),))
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Scaffold(
        body: Center(child: Image(
          image: AssetImage('assets/metro_pat_logo.png'),
        )),
      ),
    );
  }
}
