import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metro_pat_customer/Constants/constants.dart';
import 'package:metro_pat_customer/Views/ResponsiveScreen/mobile_screen.dart';
import 'package:metro_pat_customer/Views/ResponsiveScreen/tablet_screen.dart';

import 'Constants/size_config.dart';
void main()
{
WidgetsFlutterBinding.ensureInitialized();
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Metro Pat',
      theme: ThemeData(
        colorScheme:ColorScheme.fromSeed(seedColor: kpurple),
        useMaterial3: true,
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreen(),
        tabletScreenLayout: TabletScreen(),
      ),
    );
  }
}
class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget tabletScreenLayout;

  const ResponsiveLayout(
      {super.key,
        required this.mobileScreenLayout,
        required this.tabletScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return tabletScreenLayout;
      } else {
        return mobileScreenLayout;
      }
    });
  }
}



