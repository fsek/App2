import 'package:fsek_mobile/april_fools.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/songbook/songbookEntry.dart';
import 'package:fsek_mobile/screens/book_exchange/book.dart';
import 'package:fsek_mobile/screens/songbook/hmmm.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/book.service.dart';
import 'package:fsek_mobile/services/songbook.service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookExchangePage extends StatefulWidget {
  @override
  _BookExchangePageState createState() => _BookExchangePageState();
}

class _BookExchangePageState extends State<BookExchangePage>
    with TickerProviderStateMixin {
  List<SongbookEntry> songs = [];
  List<SongbookEntry> allSongs = [];

  //bad helpvariables that are most likely unneeded
  bool searchFocus = false;
  String initChar = "";

  TextEditingController _controller = TextEditingController();

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1400));
    locator<BookService>().getBooks().then((value) => setState(() {
          this.books = value;
          books.sort((a, b) => a.title!.compareTo(b.title!)); // handle null?
          allSongs = List.from(books);
        }));

    setRotation(360);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void setRotation(int degrees) {
    final angle = degrees * 3.1415 / 180;

    animation =
        Tween<double>(begin: 0, end: angle).animate(animationController);
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return allSongs == []
        ? Scaffold(
            appBar: AppBar(title: Text(t.songbookSongbook)),
            body: Center(
                child: CircularProgressIndicator(
                    color: (isAprilFools
                        ? Color(0xFFF17F9F)
                        : Colors.orange[600]))))
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: AnimatedBuilder(
                animation: animation,
                child: Scaffold(
                  appBar: AppBar(title: Text(t.songbookSongbook)),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FocusScope(
                          child: Focus(
                        onFocusChange: (focus) {
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
                            //Easteregg:
                            if (search == "hmm") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HmmPage()));
                            } else if (search == "do a barrel roll") {
                              FocusScope.of(context).unfocus();
                              animationController.forward(from: 0);
                            }
                            List<String> searchTerms = search
                                .toLowerCase()
                                .trim()
                                .split(new RegExp(r"\s+"));
                            setState(() {
                              initChar = "";
                              songs = allSongs.where((book) {
                                return searchTerms.every((term) =>
                                    book.title!.toLowerCase().contains(term));
                              }).toList();
                            });
                          },
                        ),
                      )),
                      Expanded(
                        child: songs.isNotEmpty
                            ? ListView(
                                children: songs
                                    .map((book) => _generateBookTile(book))
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
                //Part of doing a barrel roll
                builder: (context, child) =>
                    Transform.rotate(angle: animation.value, child: child)));
  }

  Widget _generateBookTile(SongbookEntry book) {
    //This way of doing it is probably really stupid. but so be it
    List<Widget> index = [];
    return Column(
      children: index +
          [
            Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.grey[400]!),
                )),
                child: InkWell(
                  onTap: () => openSong(book.id!),
                  child: ListTile(
                    title: Text(book.title == null ? "" : book.title!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Price: '),
                        Text('Skick: '),
                      ],
                    ),
                  ),
                ))
          ],
    );
  }

  void openBook(int id) {
    locator<BookService>().getBook(id).then((book) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BookPage(book: book)));
    });
  }
}
