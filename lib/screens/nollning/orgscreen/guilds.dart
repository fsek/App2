import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/april_fools.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


class ReadJson {
  final String title_en;
  final String title_sv;
  final String preamble_en;
  final String preamble_sv;
  final String content_en;
  final String content_sv;

  ReadJson({required this.title_en, required this.title_sv, required this.preamble_en,
    required this.preamble_sv, required this.content_en, required this.content_sv});


    factory ReadJson.fromJson(Map<String, dynamic> json) {
      return ReadJson(
        title_en: json['title']['en'], 
        title_sv: json['title']['sv'], 
        preamble_en: json['preamble']['en'], 
        preamble_sv: json['preamble']['sv'], 
        content_en: json['content']['en'], 
        content_sv: json['content']['sv']
        );
    }
}

Future<ReadJson> loadJson() async {
  String jsonString = await rootBundle.loadString('assets/data/nollning-24/sektioner.json');
  final jsonResponse = json.decode(jsonString);


  return ReadJson.fromJson(jsonResponse);


}


class SektionScreenPage extends StatefulWidget {
  @override
  _SektionScreenState createState() => _SektionScreenState();
}



class _SektionScreenState extends State<SektionScreenPage> {
  ReadJson? _file;
  bool _isLoading = true;


  void initState(){
    super.initState();
    _loadAndSetJson();
  }



  Future<void> _loadAndSetJson() async {
    ReadJson file = await loadJson();
    setState(() {
      _file = file;
      _isLoading = false;
    });
  }

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(),
      body: Text(
        '${_file?.title_sv}'
      ),
    );
  }
}






  