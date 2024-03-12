import 'package:flutter/material.dart';
import 'package:islami/providers/mytheme.dart';
import 'package:provider/provider.dart';

import '../providers/appconfigprovider.dart';

class Radiotab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/radio_image.png',
              width: 300, // Adjust width as needed
              height: 300, // Adjust height as needed
            ),
            SizedBox(height: 20),
            Text(
              'إذاعة القرآن الكريم',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: provider.appTheme == ThemeMode.dark ?
                MyTheme.yellowcolor : MyTheme.primarycolor,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  iconSize: 36,
                  onPressed: () {
                    // Handle previous track action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.play_arrow,
                      color: provider.appTheme ==
                          ThemeMode.dark ? MyTheme.yellowcolor : MyTheme.primarycolor),
                  iconSize: 36,
                  onPressed: () {
                    // Handle play action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  iconSize: 36,
                  onPressed: () {
                    // Handle next track action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
