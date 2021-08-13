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
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text(song.title!),
                  song.melody != null ?
                    Text("Melodi: ${song.melody!}") 
                    : SizedBox.shrink(), 
                  song.author != null ?
                    Text("Författare: ${song.author!}")
                    : SizedBox.shrink(), 
               ],) 
            ),
            Container(
              child: Html(
                data: song.content,
              ),
            )
         ],
       ),
     );

   }

}