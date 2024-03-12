import 'package:flutter/material.dart';
import 'package:islami/hadeethtab/hadeth_details.dart';
import 'package:islami/home/homescreen.dart';
import 'package:islami/home/setting.dart';
import 'package:islami/providers/appconfigprovider.dart';
import 'package:islami/providers/mytheme.dart';
import 'package:islami/qurantab/Sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../home/splashscreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    var provider =  Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,

        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          SplashScreen.routeName: (context) => SplashScreen(),
          SuraDetails.routeName: (context) => SuraDetails(),
          SettingScreen.routeName : (context) => SettingScreen(), // Change here
          hadethDetails.routeName : (context) => hadethDetails(),


      },
      theme: MyTheme.lightmode,
      themeMode: provider.appTheme,
      darkTheme:  MyTheme.darkmode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}