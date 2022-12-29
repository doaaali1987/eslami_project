import 'package:eslami_project/screens/sura_details/sura_details_arguments.dart';
import 'package:eslami_project/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsScreen extends StatefulWidget {
  static String routeName = "sura details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  ///content will view sura as block so we will split content => HERE
  //String content="";
  ///HERE
  List<String> suraLines = [];
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;
    if (suraLines.isEmpty) {
      readFile(args.fileName);
    }
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/default_bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "سورة ${args.suraName}",
            style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "El Messiri"),
          ),
          centerTitle: true,
        ),
        // body: Text(args.fileName),
        //body: SingleChildScrollView(child: Text(content)),
        body:
        ListView.builder(
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("${suraLines[index]}${{index+1}}",style: TextStyle(fontSize: 20,color: ThemeHelper.accentColor),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,),
                    //Divider(thickness: 3,)
                  ],
                ),
              );
            },
            itemCount: suraLines.length),
      ),
    );
  }

  readFile(String fileName) async {
    String fileContent = await rootBundle.loadString("assets/files/$fileName");
    //content = fileContent;
    suraLines = fileContent.split("\n");
    suraLines=suraLines.where((line) => line.trim().isNotEmpty).toList();
    setState(() {});
    //print(content);
  }
}
