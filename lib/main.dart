import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Control/app_languages.dart';
import 'Utilities/Routing.dart';
import 'Utilities/shared_preferances_helper.dart';
import 'locale/locales.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref().init();
  SystemChrome.setPreferredOrientations;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

    statusBarColor: Colors.black38, //// status bar color
  ));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
    ],
    child: ModularApp(
      module: AppModule(),
      child: const EntryPoint(),
    ),
  ));
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context, listen: true);
    appLan.fetchLocale();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => MaterialApp.router(
        theme: ThemeData(fontFamily: 'poppins'),
        debugShowCheckedModeBanner: false,
        title: 'Premier League',
        locale: Locale(appLan.appLang.name),
        supportedLocales: Languages.values.map((e) => Locale(e.name)).toList(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
