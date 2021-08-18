import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/models/songbook/song.dart';


class SongPage extends StatelessWidget{
  const SongPage({Key? key, required this.song}) : super(key: key); 

  final Song song; 

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(),
        body: 
          SingleChildScrollView(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: 
                        [
                          Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 16),
                          child:
                            Text(song.title!, 
                              style: 
                                TextStyle(color: Colors.orange[600], fontSize: 24),
                            ),
                          ),
                          song.melody != null 
                            ? Padding(padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: 
                                  RichText(
                                    text: 
                                      TextSpan(
                                        children: [
                                          TextSpan(text: "Melodi: ", style: TextStyle(color: Colors.orange[600])),
                                          TextSpan(text: song.melody!, style: TextStyle(color: Colors.black))
                                        ]
                                      ),
                                  ),
                              )
                            : SizedBox.shrink(), 
                          song.author != null
                            ? Padding(padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: 
                                  RichText(
                                    text: 
                                      TextSpan(
                                        children: [
                                          TextSpan(text: "Författare: ", style: TextStyle(color: Colors.orange[600])),
                                          TextSpan(text: song.author!, style: TextStyle(color: Colors.black))
                                        ]
                                      ),
                                  ),
                              )
                            : SizedBox.shrink(),
                        ]
                    ),
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(14, 6, 14, 14),
                child:
                  Html(
                    data: song.content!,
                    style: {
                      "p": Style(
                        fontSize: FontSize(16, units: "pt"),
                        lineHeight: LineHeight(1.5)
                       )
                    }, 
                   ),
              )
            ]
          )
        )
      ); 
   }

}