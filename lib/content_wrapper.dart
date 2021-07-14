import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'models/destination.dart';
import 'models/user/user.dart';
import 'services/service_locator.dart';
import 'services/theme.service.dart';
import 'widgets/bottom_app_bar.dart';

class ContentWrapper extends StatefulWidget {
  ContentWrapper(this.navbarDestinations, this.user, this.onNavigation, this.messages) : super();

  final List<Destination> navbarDestinations;
  final User? user;
  final StreamController? onNavigation;
  final List<String> messages;

  @override
  _ContentWrapperState createState() => _ContentWrapperState();
}

class _ContentWrapperState extends State<ContentWrapper> with TickerProviderStateMixin<ContentWrapper> {
  late List<Key> _destinationKeys;
  late List<AnimationController> _faders;
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    //generate animation controllers for all destinations so we can fade them in and out
    _faders = widget.navbarDestinations.map<AnimationController>((Destination destination) {
      return AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    //set the fader of the starting page to 1 so it's visible
    _faders[_currentIndex].value = 1.0;
    //generate a list of globalkeys which we shall assign to our destinations
    //Each destination shall have its own key
    _destinationKeys = List<Key>.generate(widget.navbarDestinations.length, (int index) => GlobalKey()).toList();

    super.initState();
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Shows state messages
    for (String message in widget.messages) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ));
    }
    widget.messages.clear(); // clears all showed messages

    var _user = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          child: Icon(Icons.person, size: 44, color: Colors.grey[700]),
          backgroundColor: Colors.grey[300],
          radius: 32,
        ),
        SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.user == null ? "Loading..." : "${widget.user!.firstname!} ${widget.user!.lastname!}", style: Theme.of(context).textTheme.headline5!.apply(color: Colors.white)),
            SizedBox(
              height: 4,
            ),
            Text(widget.user == null ? "Loading..." : "${widget.user!.program} ${widget.user!.start_year}", style: Theme.of(context).textTheme.subtitle2!.apply(color: Colors.grey[200])),
          ],
        ),
      ],
    );

    return Stack(children: [
      //PPBackground(),
      Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Column(children: [
            SizedBox(
              height: 16,
            ),
            _user,
            SizedBox(
              height: 24,
            ),
            Container(color: Colors.grey[400], height: 1, width: MediaQuery.of(context).size.width * 2 / 3),
            SizedBox(
              height: 12,
            ),
            Expanded(
                child: Stack(
                    children: widget.navbarDestinations.map((Destination destination) {
              final Widget view = FadeTransition(
                opacity: _faders[destination.index].drive(CurveTween(curve: Curves.fastOutSlowIn)), //set opacity according to animation
                child: KeyedSubtree(
                  //set a global key to a widget so we preserve its state and subtree on a tree rebuild
                  key: _destinationKeys[destination.index],
                  child: destination.widget,
                ),
              );
              //When currently selected destination we want to render and animate it
              if (destination.index == _currentIndex) {
                _faders[destination.index].forward();
                return view;
              } else {
                //when one of the other destinations
                _faders[destination.index].reverse();
                if (_faders[destination.index].isAnimating) {
                  //ignore pointer so the destinations aren't interactable when animating
                  return IgnorePointer(child: view);
                }
                return Offstage(child: view); //move offstag e to ensure they aren't painted when not visible
              }
            }).toList())),
          ])),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/nollningpage');
            },
            tooltip: 'F-sektionen',
            child: CircleAvatar(
              radius: 36.0,
              backgroundImage: AssetImage("assets/img/nollning_moose_icon.png"),
              backgroundColor: Colors.orange,
            ),
            elevation: 2.0,
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: FsekAppBar(
              backgroundColor: Colors.orange[700],
              centerItemText: "F-sektionen",
              onTabSelected: (int? index) {
                setState(() {
                  _currentIndex = index ?? 0;
                });
                widget.onNavigation!.add(widget.navbarDestinations[_currentIndex].widget.runtimeType);
              },
              items: [
                ...widget.navbarDestinations.map((Destination destination) {
                  return FsekAppBarItem(iconData: destination.icon, text: destination.title);
                }).toList()
              ],
              selectedColor: Colors.white,
              color: Colors.black,
            ),
          ),
        ),
      )
    ]);
  }
}
