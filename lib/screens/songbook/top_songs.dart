import 'package:flutter/material.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/screens/songbook/song.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/services/api.service.dart';

class TopSongsPage extends StatefulWidget {
  @override
  _TopSongsPageState createState() => _TopSongsPageState();
}

class _TopSongsPageState extends State<TopSongsPage>
    with TickerProviderStateMixin {
  List<SongRead> songs = [];
  List<SongRead> topSongs = [];

  //bad helpvariables that are most likely unneeded
  bool searchFocus = false;
  late int initChar;

  TextEditingController _controller = TextEditingController();

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1400));

    fetchTopSongs();
  }

  void fetchTopSongs() async {
    int num_top_songs = 10;
    final response =
        await ApiService.apiClient.getSongsApi().songsGetAllSongs();

    setState(() {
      this.topSongs = (response.data!.toList()
            ..sort((a, b) => b.views.compareTo(a.views)))
          .take(num_top_songs)
          .toList();
      this.songs = this.topSongs;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    initChar = 1;
    return topSongs == []
        ? Scaffold(
            //change text
            appBar: AppBar(title: Text(t.songbookSongbook)),
            body: Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor)))
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(
                title: Text(t.songbookSongbook),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
              ),
            ),
          );
  }

  Widget _generateSongTile(SongRead song) {
    Color color;
    Color numColor;

    List<Widget> index = [];
    //deciding colour
    if (initChar == 1)
      color = Color.fromARGB(255, 255, 215, 0);
    else if (initChar == 2)
      color = Color.fromARGB(255, 192, 192, 192);
    else if (initChar == 3)
      color = Color.fromARGB(255, 205, 127, 50);
    else
      color = Theme.of(context).colorScheme.surfaceContainerHighest;

    // Same for the number
    if (initChar <= 3)
      numColor = Color.fromARGB(255, 0, 0, 0);
    else
      numColor = Theme.of(context).colorScheme.onSurfaceVariant;

    index.add(Container(
      decoration: BoxDecoration(color: color),
      child: ListTile(
        title: Text(
          initChar.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, color: numColor),
        ),
      ),
    ));
    initChar += 1;

    return Column(
      children: index +
          [
            Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest),
                )),
                child: InkWell(
                  onTap: () => openSong(song.id),
                  child: ListTile(title: Text(song.title)),
                ))
          ],
    );
  }

  void openSong(int id) async {
    await ApiService.apiClient
        .getSongsApi()
        .songsGetSong(songId: id)
        .then((song) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SongPage(song: song.data!)));
    });
  }
}
