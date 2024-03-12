import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/themeBottomSheet.dart';
import 'package:islami/providers/appconfigprovider.dart';
import 'package:provider/provider.dart';

import '../providers/mytheme.dart';
import 'languageBottom.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const String routeName = 'settingscreen';
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
// Default mode

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                AppLocalizations.of(context)!.language,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  fontWeight: FontWeight.bold,
                  color: MyTheme.primarycolor,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showLanguageBottomSheet(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: MyTheme.primarycolor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider.appLanguage == 'en' ?
                    AppLocalizations.of(context)!.english :
                    AppLocalizations.of(context)!.arabic,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                AppLocalizations.of(context)!.modes,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  fontWeight: FontWeight.bold,
                  color: MyTheme.primarycolor,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showthemebuttonsheet();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: MyTheme.primarycolor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider.appTheme == ThemeMode.light ?
                    AppLocalizations.of(context)!.light :
                    AppLocalizations.of(context)!.dark, // Change text based on theme mode
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageButtomSheet(),
    );
  }

  void showthemebuttonsheet() {
    showModalBottomSheet(context: context, builder: (context)=> ThemeButtomSheet());
  }
}
