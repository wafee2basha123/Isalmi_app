import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeethtab/item_hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/appconfigprovider.dart';
import '../providers/mytheme.dart';

class Hadeeth extends StatefulWidget {
  @override
  State<Hadeeth> createState() => _HadeethState();
}

class _HadeethState extends State<Hadeeth> {
  List<Hadeth> hadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    if (hadethList.isEmpty) {
      LoadFile();
    }

    Color dividerColor =
    provider.appTheme == ThemeMode.dark ? MyTheme.yellowcolor : MyTheme.primarycolor;

    return Column(
      children: [
        Center(child: Image.asset('assets/images/icon_hadeth.png')),
        Divider(
          color: dividerColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: dividerColor,
          thickness: 3,
        ),
        hadethList.isEmpty
            ? Center(
          child: CircularProgressIndicator(
            color: dividerColor,
          ),
        )
            : Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: dividerColor,
                thickness: 2,
              );
            },
            itemBuilder: (context, index) {
              return item_hadeth_name(hadeth: hadethList[index]);
            },
            itemCount: hadethList.length,
          ),
        ),
      ],
    );
  }

  void LoadFile() async {
    String hadethContent = await rootBundle.loadString('assets/filess/ahadeth.txt');
    List<String> ahadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> hadethLines = ahadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth1 = Hadeth(title: title, content: hadethLines);
      hadethList.add(hadeth1);
      setState(() {});
    }
  }
}
class Hadeth {
  String title;
  List<String> content;
  Hadeth({required this.title, required this.content});
}
