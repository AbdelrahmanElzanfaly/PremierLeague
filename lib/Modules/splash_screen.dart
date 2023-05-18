import 'package:flutter/material.dart';
import 'package:premier_league/Utilities/extensions.dart';
import '../Utilities/theme_helper.dart';
import 'MatchScreen/match_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    if (context.mounted)
      Navigator.of(context).pushNamedAndRemoveUntil(MatchScreen.routeName, (route) => false);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.primaryColor,
    );
  }
}
