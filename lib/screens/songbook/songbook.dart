

import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/songbook/songbookEntry.dart';
import 'package:fsek_mobile/screens/songbook/song,.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/song.service.dart';
import 'package:fsek_mobile/services/songbook.service.dart';

class SongbookPage extends StatefulWidget{
   @override
   _SongbookPageState createState() => _SongbookPageState();
}

class _SongbookPageState extends State<SongbookPage> {
  List<SongbookEntry> songs = [];
  List<SongbookEntry> allSongs = []; 
  
  void initState() {
    locator<SongbookService>().getSongbook().then((value) => setState(() 
    {
      this.songs = value;
      songs.sort((a, b) => a.title!.compareTo(b.title!)); // handle null? 
      allSongs = List.from(songs);
    }));
    super.initState();
  }

  Widget build(BuildContext context){
    return allSongs == [] ? Scaffold(
      appBar: AppBar(title: Text("Sångbok")),
      body: 
        Center(
          child: CircularProgressIndicator(color: Colors.orange[600]))) : 
      Scaffold(
        appBar: 
          AppBar(title: Text("Sångbok")),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Sök"
              ),
              onChanged: (search) {
                List<String> searchTerms = search.toLowerCase().trim().split(new RegExp(r"\s+"));
                setState(() {
                  print(songs.map((e) => e.title).toList());
                  songs = allSongs.where((song) {
                    return searchTerms.every((term) =>
                      song.title!.toLowerCase().contains(term)); 
                  }).toList();
                });
              },
            ),
            Expanded(
              child: 
                songs.isNotEmpty ? ListView(
                  children: songs.map((song) => generateSongTile(song)).toList(), 
                ) :
                Text("Finns inga matchningar :^(",
                textAlign: TextAlign.left,) 
                ,
            )
          ],
        )
         
    );
  }

  Widget generateSongTile(SongbookEntry song){
    return Card(
      child: InkWell(
        onTap: () => openSong(song.id!),
        child: ListTile(
          title: 
            Text(song.title == null ? "": song.title!),),
      )
    );
  }

  void openSong(int id){
    locator<SongService>().getSong(id).then((song) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SongPage(song: song))); 
    });
  }
}