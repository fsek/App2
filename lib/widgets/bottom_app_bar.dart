import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/widgets/easterEggCodeDialog.dart';

class FsekAppBarItem {
  FsekAppBarItem({this.iconData, this.text});
  IconData? iconData;
  String? text;
}

class FsekAppBar extends StatefulWidget {
  FsekAppBar({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.color,
    this.selectedColor,
    this.notchedShape,
    required this.onTabSelected,
    required this.currentIndex
  }) {
    assert(this.items!.length == 2 || this.items!.length == 4);
  }
  final List<FsekAppBarItem>? items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int?> onTabSelected;
  final int currentIndex;
  final List<int> easterEggClicksGoal = [6, 1, 2, 2];
  @override
  State<StatefulWidget> createState() => FsekAppBarState();
}

class FsekAppBarState extends State<FsekAppBar> {
  List<int> appBarItemsClickedAmounts = [0, 0, 0, 0]; //For activating easter egg codes
  DateTime lastEasterEggClick = DateTime.now();

  void  _processEasterEggClick(int? index) async {
    
    if(DateTime.now().difference(lastEasterEggClick).inSeconds > 5) {
      appBarItemsClickedAmounts = [0, 0, 0, 0];
    }
    lastEasterEggClick = DateTime.now();

    List<int> amounts = appBarItemsClickedAmounts;
    // takes index of which nav bar item was clicked
    if(index == null) return;
    
    for(int i = 0; i < index; i++) {
      if(amounts[i] != widget.easterEggClicksGoal[i]) {
        return; // Not registering clicks at index beyond completed ones
      }
    }
    amounts[index]++;
    // 6 1 2 2 clicked: Easter egg codes activated
    if(listEquals(amounts, widget.easterEggClicksGoal)) {
      String? easterEggCode = await easterEggCodeDialog(context);
      if(easterEggCode == null) return; // User cancels dialog i think
      
    }
    
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items!.length, (int index) {
      return _buildTabItem(
        item: widget.items![index],
        index: index,
        onPressed: (i) => {
          _processEasterEggClick(i),
          widget.onTabSelected(i),
        },
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FsekAppBarItem item,
    int? index,
    ValueChanged<int?>? onPressed,
  }) {
    Color? color = widget.currentIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      key: Key(item.text!.toLowerCase() + "_btn"),
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed!(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text!,
                  style: TextStyle(color: color),
                  softWrap: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
