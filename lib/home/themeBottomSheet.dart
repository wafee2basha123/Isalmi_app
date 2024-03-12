import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/appconfigprovider.dart';
import 'package:provider/provider.dart';

class ThemeButtomSheet extends StatefulWidget {
  @override
  _ThemeButtomSheetState createState() => _ThemeButtomSheetState();
}

class _ThemeButtomSheetState extends State<ThemeButtomSheet> {
  String _selectedTheme = ''; // Default no theme selected

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.dark),
            onTap: () {
              provider.changeTheme(ThemeMode.dark); // Change theme to dark
              setState(() {
                _selectedTheme = 'dark';
              });
            },
            leading: _selectedTheme == 'dark'
                ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                : null,
          ),
          Divider(),
          ListTile(
            title: Text(AppLocalizations.of(context)!.light),
            onTap: () {
              provider.changeTheme(ThemeMode.light); // Change theme to light
              setState(() {
                _selectedTheme = 'light';
              });
            },
            leading: _selectedTheme == 'light'
                ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                : null,
          ),
        ],
      ),
    );
  }
}
