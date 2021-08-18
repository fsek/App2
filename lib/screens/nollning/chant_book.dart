

import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/songbook/songbookEntry.dart';
import 'package:fsek_mobile/screens/songbook/song.dart';
import 'package:fsek_mobile/screens/songbook/songbook.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/song.service.dart';
import 'package:fsek_mobile/services/songbook.service.dart';

class ChantBookPage extends StatefulWidget{
  @override
  _ChantBookPageState createState() => _ChantBookPageState();
}

class _ChantBookPageState extends State<ChantBookPage> {
  List<SongbookEntry> chants = [];
  List<SongbookEntry> allChants = [];

  void initState() {
    locator<SongbookService>().getChantbook().then((value) => setState(()
    {
      this.chants = value;
      chants.sort((a, b) => a.author!.compareTo(b.author!)); // handle null?
      allChants = List.from(chants);
    }));
    super.initState();
  }

  Widget build(BuildContext context){
    return allChants == [] ? Scaffold(
        appBar: AppBar(title: Text("Sektionsramsor")),
        body:
        Center(
            child: CircularProgressIndicator(color: Colors.orange[600]))) :
    Scaffold(
        appBar:
        AppBar(title: Text("Sektionsramsor")),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "   Sök"
              ),
              onChanged: (search) {
                List<String> searchTerms = search.toLowerCase().trim().split(new RegExp(r"\s+"));
                setState(() {
                  print(chants.map((e) => e.title).toList());
                  chants = allChants.where((song) {
                    return searchTerms.every((term) =>
                        song.title!.toLowerCase().contains(term));
                  }).toList();
                });
              },
            ),
            Expanded(
              child:
              chants.isNotEmpty ? ListView(
                children: chants.map((song) => generateSongTile(song)).toList(),
              ) :
              Text("Finns inga matchningar :^(",
                textAlign: TextAlign.left,)
              ,
            ),

          ],

        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/song_book');
          },
          label: const Text('Hela Sångboken'),
          icon: const Icon(Icons.queue_music),
          backgroundColor: Color(0xffc0a835),
     ),

    );
  }

  Widget generateSongTile(SongbookEntry song){
    return Card(
        child: InkWell(
          onTap: () => openSong(song.id!),
          child: ListTile(
            title:
            Text(song.title == null ? "": song.title!),
            subtitle:
              Text(song.author == null ? "": song.author!)
          ),
        )
    );
  }

  void openSong(int id){
    locator<SongService>().getChant(id).then((song) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SongPage(song: song)));
    });
  }
}
