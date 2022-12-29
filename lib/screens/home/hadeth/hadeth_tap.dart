import 'package:eslami_project/screens/home/hadeth/hadeth_name_item.dart';
import 'package:flutter/material.dart';
import 'package:eslami_project/theme_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<AhadethModel> listAhadeth = [];
  @override
  Widget build(BuildContext context) {
    if (listAhadeth.isEmpty) {
      readHadeth();
    }
    return Container(
      child: Column(
        children: [
          Expanded(flex: 2, child: Image.asset("assets/hadeth_logo.png")),
          Divider(
            color: ThemeHelper.primaryColorLight,
            thickness: 3,
          ),
           Text(
           // "ahadeth",
            AppLocalizations.of(context)!.ahadeth,
            style: Theme.of(context).textTheme.titleMedium,
             //style: Theme.of(context).textTheme.bodyMedium,
          ),
          Divider(
            color: ThemeHelper.primaryColorLight,
            thickness: 3,
          ),
          Expanded(
              flex: 8,
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    HadethNameItem(listAhadeth[index]),
                itemCount: listAhadeth.length,
              )),
        ],
      ),
    );
  }

  readHadeth() async {
    String fileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeth = fileContent.split("#\r\n");
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> singleHadethLine = ahadeth[i].split("\n");
      String title = singleHadethLine[0];
      singleHadethLine.removeAt(0);
      String content = singleHadethLine.join();
      listAhadeth.add(AhadethModel(title, content));
    }
    setState(() {});
  }
}

class AhadethModel {
  String title;
  String content;
  AhadethModel(this.title, this.content);
}
