import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/songbook/songbookEntry.dart';
import 'package:fsek_mobile/screens/songbook/song.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/song.service.dart';
import 'package:fsek_mobile/services/songbook.service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SongbookPage extends StatefulWidget {
  @override
  _SongbookPageState createState() => _SongbookPageState();
}

class _SongbookPageState extends State<SongbookPage> {
  List<SongbookEntry> songs = [];
  List<SongbookEntry> allSongs = [];

  //bad helpvariables that are most likely unneeded
  bool searchFocus = false;
  String initChar = "";

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    locator<SongbookService>().getSongbook().then((value) => setState(() {
          this.songs = value;
          songs.sort((a, b) => a.title!.compareTo(b.title!)); // handle null?
          allSongs = List.from(songs);
        }));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return allSongs == []
        ? Scaffold(
            appBar: AppBar(title: Text(t.songbookSongbook)),
            body: Center(
                child: CircularProgressIndicator(color: Colors.orange[600])))
        : Scaffold(
            appBar: AppBar(title: Text(t.songbookSongbook)),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FocusScope(
                    //Unfocusing from the searchbar from any tap would be nice but it is minor
                    child: Focus(
                  onFocusChange: (focus) {
                    print(focus);
                    setState(() {
                      searchFocus = focus;
                    });
                  },
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        prefixIcon: searchFocus
                            ? IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.grey[800],
                                ),
                                onPressed: () =>
                                    FocusScope.of(context).unfocus())
                            : Icon(
                                Icons.search,
                                color: Colors.grey[800],
                              ),
                        hintText: t.songbookSearch,
                        suffixIcon: _controller.text.length > 0
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                color: Colors.grey[800],
                                onPressed: () => setState(() {
                                      _controller.clear();
                                      FocusScope.of(context).unfocus();
                                      songs = allSongs;
                                    }))
                            : SizedBox.shrink()),
                    onChanged: (search) {
                      List<String> searchTerms =
                          search.toLowerCase().trim().split(new RegExp(r"\s+"));
                      setState(() {
                        initChar = "";
                        songs = allSongs.where((song) {
                          return searchTerms.every((term) =>
                              song.title!.toLowerCase().contains(term));
                        }).toList();
                      });
                    },
                  ),
                )),
                Expanded(
                  child: songs.isNotEmpty
                      ? ListView(
                          children: songs
                              .map((song) => _generateSongTile(song))
                              .toList(),
                        )
                      : Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(t.songbookNoMatches),
                        ),
                )
              ],
            ));
  }

  Widget _generateSongTile(SongbookEntry song) {
    //This way of doing it is probably really stupid. but so be it
    List<Widget> index = [];
    if (song.title![0] != initChar) {
      initChar = song.title![0];
      index.add(Container(
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: ListTile(
          title: Text(
            initChar,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ));
    }
    return Column(
      children: index +
          [
            Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.grey[400]!),
                )),
                child: InkWell(
                  onTap: () => openSong(song.id!),
                  child: ListTile(
                      title: Text(song.title == null ? "" : song.title!)),
                ))
          ],
    );
  }

  void openSong(int id) {
    locator<SongService>().getSong(id).then((song) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SongPage(song: song)));
    });
  }
}
