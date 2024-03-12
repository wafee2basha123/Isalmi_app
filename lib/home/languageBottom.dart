import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/appconfigprovider.dart';
import 'package:provider/provider.dart';

class LanguageButtomSheet extends StatefulWidget {
  @override
  _LanguageButtomSheetState createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
  String _selectedLanguage = ''; // Default no language selected

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.english),
            onTap: () {
              provider.changeLanguage('en');
              setState(() {
                _selectedLanguage = 'English';
              });
            },
            leading: _selectedLanguage == 'English'
                ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                : null,
          ),
          Divider(),
          ListTile(
            title: Text(AppLocalizations.of(context)!.arabic),
            onTap: () {
              provider.changeLanguage('ar');
              setState(() {
                _selectedLanguage = 'Arabic';
              });
            },
            leading: _selectedLanguage == 'Arabic'
                ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                : null,
          ),
        ],
      ),
    );
  }
}
