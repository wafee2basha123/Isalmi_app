import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/qurantab/Sura_details.dart';
import 'package:provider/provider.dart';

import '../providers/appconfigprovider.dart';
import '../providers/mytheme.dart';

class item_sura_name extends StatelessWidget {
  final String name;
  final int index;

  const item_sura_name({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context); // Get the provider instance

    Color textColor = provider.appTheme == ThemeMode.dark ? Colors.white : Colors.black; // Determine text color based on theme mode

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          SuraDetails.routeName,
          arguments: SuraDetailsArgs(name: name, index: index),
        );
      },
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 18, // Adjust the font size as needed
          color: textColor, // Use determined text color
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
