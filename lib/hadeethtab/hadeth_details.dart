import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/appconfigprovider.dart';
import 'Hadeeth.dart';
import 'item_hadeth_details.dart';

class hadethDetails extends StatefulWidget {
  static const String routeName = 'Hadeth_details';

  const hadethDetails({Key? key}) : super(key: key);

  @override
  State<hadethDetails> createState() => hadethDetailsState();
}

class hadethDetailsState extends State<hadethDetails> {
  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments and cast them to Hadeth
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        Image.asset(provider.appTheme == ThemeMode.dark ? 'assets/images/dark_bg.png' : 'assets/images/default_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return item_hadeth_details(content: args.content[index]);
            },
            itemCount: args.content.length,
          ),
        ),
      ],
    );
  }
}
