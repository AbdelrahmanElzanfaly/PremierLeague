import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../Modules/HomeScreen/match_screen.dart';
import '../Modules/splash_screen.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SplashScreen()),


    defaultRoute(routeName: SplashScreen.routeName,screen: const SplashScreen()),
    defaultRoute(routeName: MatchScreen.routeName,screen: const MatchScreen()),
  ];

  static ChildRoute defaultRoute({required String routeName,required Widget screen}){
    return ChildRoute(
      routeName,
      child: (_, args) => screen,
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 300),
    );
  }
}
