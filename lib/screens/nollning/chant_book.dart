

import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/songbook/songbookEntry.dart';
import 'package:fsek_mobile/screens/songbook/song.dart';
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
  TextEditingController _controller = TextEditingController();
  bool searchFocus = false;
  String initChar = "";

  void initState() {
    locator<SongbookService>().getChantbook().then((value) => setState(()
    {
      this.chants = value;
      chants.sort((a, b) => a.author!.compareTo(b.author!)); // handle null?
      allChants = List.from(chants);
    }));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){

    return allChants == [] ? Scaffold(
        appBar: AppBar(title: Text("Sångbok")),
        body:
        Center(
            child: CircularProgressIndicator(color: Colors.orange[600]))) :
    Scaffold(
      appBar:
      AppBar(title: Text("Sångbok")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FocusScope( //Unfocusing from the searchbar from any tap would be nice but it is minor
              child: Focus(
                onFocusChange: (focus) {
                  print(focus);
                  setState(() {
                    searchFocus = focus;
                  });
                },
                child:
                TextField(
                  controller: _controller,
                  decoration:
                  InputDecoration(
                      prefixIcon: searchFocus
                          ? IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.grey[800],),
                          onPressed: () => FocusScope.of(context).unfocus())
                          : Icon(Icons.search, color: Colors.grey[800],),
                      hintText: "Sök",
                      suffixIcon: _controller.text.length>0
                          ? IconButton(icon: Icon(Icons.clear),
                          color: Colors.grey[800],
                          onPressed: () => setState(() {
                            _controller.clear();
                            FocusScope.of(context).unfocus();
                            chants = allChants;
                          })
                      )
                          : SizedBox.shrink()

                  ),
                  onChanged: (search) {
                    List<String> searchTerms = search.toLowerCase().trim().split(new RegExp(r"\s+"));
                    setState(() {
                      initChar = "";
                      chants = allChants.where((song) {
                        return searchTerms.every((term) =>
                            song.title!.toLowerCase().contains(term));
                      }).toList();
                    });
                  },
                ),
              )
          ),

          Expanded(
            child:
            chants.isNotEmpty ? ListView(
              children: chants.map((song) => _generateSongTile(song)).toList(),
            ) :
            Padding(padding: EdgeInsets.all(16),
              child:Text("Finns inga matchningar :^(")
              ,),
          )
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

  Widget _generateSongTile(SongbookEntry song){
    //This way of doing it is probably really stupid. but so be it
    List<Widget> index = [];
    if(song.author != initChar){
      initChar = song.author!;
      index.add(Container(
        decoration: BoxDecoration(
            color: Colors.grey[300]
        ),
        child:
        ListTile(
          title: Text(initChar,
            style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ));

    }
    return Column(
      children: index+[
        Container(
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.grey[400]!
                  ),
                )
            ),
            child: InkWell(
              onTap: () => openSong(song.id!),
              child:
              ListTile(
                  title:
                  Text(song.title == null ? "": song.title!)
              ),
            )
        )
      ],
    );
  }

  void openSong(int id){
    locator<SongService>().getSong(id).then((song) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SongPage(song: song)));
    });
  }
}
