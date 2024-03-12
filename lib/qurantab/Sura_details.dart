import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/qurantab/item_sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/appconfigprovider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'Sura_details';

  const SuraDetails({Key? key}) : super(key: key);

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context); // Get the provider instance

    // Retrieve the arguments
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;

    // Check if verses are empty and load them
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(
      children: [
        Image.asset(provider.appTheme == ThemeMode.dark ? 'assets/images/dark_bg.png' : 'assets/images/default_bg.png'), // Adjust the background image based on the theme mode
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              args.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return item_sura_details(name: verses[index], index: index);
            },
            itemCount: verses.length,
          ),
        ),
      ],
    );
  }

  int add(int n1, int n2) {
    return n1 + n2;
  }

  void loadFile(int index) async {
    String content = await rootBundle.loadString('assets/filess/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;
  SuraDetailsArgs({required this.name, required this.index});
}
