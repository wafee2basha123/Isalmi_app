import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/hadeethtab/hadeth_details.dart';
import 'package:islami/hadeethtab/Hadeeth.dart';
import '../providers/mytheme.dart';

class item_hadeth_details extends StatelessWidget {
  String content;
  item_hadeth_details({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textDirection: TextDirection.rtl,
      style: MyTheme.darkmode.textTheme.titleLarge?.copyWith(
        fontSize: 32, // Increasing font size
        color: Colors.yellow, // Changing text color to yellow
      ),
      textAlign: TextAlign.center,
    );
  }
}
