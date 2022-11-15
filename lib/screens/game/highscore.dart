import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/models/user/user.dart';

class HighscorePage extends StatefulWidget {
  @override
  _HighscorePageState createState() => _HighscorePageState();
}

class _HighscorePageState extends State<HighscorePage>
    with TickerProviderStateMixin {
  // Change to user when implemented with api
  //list for what is being shown on screen (the "results of a search")
  // even as nothing has been searched. does change throughout.
  List<User> results = [];

  //actual list of all users that gets sorted, never changed
  List<User> users = [];

  //idk i "borrowed" the songbook and they were bad but probably needed so here they are.
  bool searchFocus = false;
  String initChar = "";

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // Temp way to represent user dont push
    User test = User();
    test.game_highscore = 20;
    test.firstname = "User 1";

    User test2 = User();
    test2.game_highscore = 5;
    test2.firstname = "Jag heter 2";

    User test3 = User();
    test3.game_highscore = 12;
    test3.firstname = "Mitt namn är 3";

    User test4 = User();
    test4.game_highscore = 0;
    test4.firstname = "samin 4";

    User test5 = User();
    test5.game_highscore = -5;
    test5.firstname = "ville 5";

    User test6 = User();
    test6.game_highscore = 69;
    test6.firstname = "villes mamma";

    User test7 = User();
    test7.game_highscore = 6969;
    test7.firstname = "samins mamma";

    users = [test, test2, test3, test4, test5, test6, test7];
    users.sort((a, b) => b.game_highscore!.compareTo(a.game_highscore!));
    results = users;

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var itemCount = users.length; //change to amount of users on highscore
    var userName = "Name Nameson";

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(title: Text("Highscore!")), //change to translate var
          body: Column(
            children: [
              FocusScope(
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
                              onPressed: () => FocusScope.of(context).unfocus())
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
                                    results = users;
                                  }))
                          : SizedBox.shrink()),
                  onChanged: (search) {
                    List<String> searchTerms =
                        search.toLowerCase().trim().split(new RegExp(r"\s+"));
                    setState(() {
                      initChar = "";
                      results = users.where((user) {
                        return searchTerms.every((term) =>
                            user.firstname!.toLowerCase().contains(term));
                      }).toList();
                      itemCount = results.length;
                    });
                  },
                ),
              )),
              Expanded(
                  child: itemCount > 0
                      ? ListView.builder(
                          itemCount: results.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                shape: ContinuousRectangleBorder(
                                    side: BorderSide(color: Color(0xFFf77e14))),
                                child: ListTile(
                                  leading: users.indexOf(results[index]) < 3
                                      ? _findMedal(
                                          users.indexOf(results[index]))
                                      : Text(
                                          "${users.indexOf(results[index]) + 1}."),
                                  title: index < results.length
                                      ? Text("${results[index].firstname}")
                                      : Text("name nameson"),
                                  trailing:
                                      Text("${results[index].game_highscore}"),
                                ));
                          },
                        ) // change for translate variable later
                      : const Center(child: Text('No items'))),
            ],
          ), //change to translate var
        ));
  }

  Image _findMedal(int index) {
    switch (index) {
      case 0:
        return Image(image: AssetImage("assets/img/gold_medal.png"), width: 36);
      case 1:
        return Image(
            image: AssetImage("assets/img/silver_medal.png"), width: 30);
      case 2:
        return Image(
            image: AssetImage("assets/img/bronze_medal.png"), width: 25);
      default:
        throw new Exception("Bad index for medal image");
    }
  }
}
