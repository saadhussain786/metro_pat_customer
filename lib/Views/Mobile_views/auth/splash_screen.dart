import 'dart:async';

import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Views/Mobile_views/auth/login.dart';
import 'package:metro_pat_customer/Views/Mobile_views/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void splash() async {
    SharedPreferences userCred = await SharedPreferences.getInstance();
    var getUser = userCred.getString("uID");
    if (getUser != null) {

      if (context.mounted) {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return const DashboardScreen();
          }));
        });
      }
    } else {
      if (context.mounted) {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return const Login();
          }));
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    splash();
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
