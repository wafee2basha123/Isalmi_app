import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/hadeethtab/hadeth_details.dart';
import 'package:islami/hadeethtab/Hadeeth.dart';
import 'package:provider/provider.dart';
import '../providers/appconfigprovider.dart';
import '../providers/mytheme.dart';

class item_hadeth_name extends StatelessWidget {
  final Hadeth hadeth;

  const item_hadeth_name({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context); // Get the provider instance

    Color textColor = provider.appTheme == ThemeMode.dark ? Colors.white : Colors.black; // Determine text color based on theme mode

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          hadethDetails.routeName,
          arguments: hadeth,
        ); // Ensure hadeth is an instance of Hadeth
      },
      child: Text(
        hadeth.title,
        style: MyTheme.darkmode.textTheme.titleLarge?.copyWith(
          fontSize: 24, // Increasing font size
          color: textColor, // Use determined text color
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
