import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/appconfigprovider.dart';
import '../providers/mytheme.dart';

class item_sura_details extends StatelessWidget {
  final String name;
  final int index;

  const item_sura_details({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context); // Get the provider instance

    return Text(
      '$name{${index + 1}}',
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
        fontSize: 30, // Adjust the font size as needed
        color: provider.appTheme == ThemeMode.dark ? MyTheme.yellowcolor : MyTheme.primarycolor, // Adjust the color based on the selected theme mode
      ),
      textAlign: TextAlign.center,
    );
  }
}
