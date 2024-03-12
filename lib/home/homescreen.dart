import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/home/setting.dart';
import 'package:islami/providers/appconfigprovider.dart';
import 'package:islami/providers/mytheme.dart';
import 'package:islami/qurantab/Quran.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../hadeethtab/Hadeeth.dart';
import '../Radiotab/Radio.dart';
import '../sebhatab/Sebha.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        // Conditionally display the background image based on the selected theme
        Image.asset(provider.appTheme == ThemeMode.dark ? 'assets/images/dark_bg.png' : 'assets/images/default_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyTheme.primarycolor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                  label: AppLocalizations.of(context)!.guran,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                  label: AppLocalizations.of(context)!.radio,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha,
                ),
                // New bottom navigation bar item for settings
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings), // You can use any settings icon you prefer
                  label: AppLocalizations.of(context)!.settings,
                ),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    Quran(),
    Hadeeth(),
    Radiotab(),
    Sebha(),
    SettingScreen(),
  ];
}
