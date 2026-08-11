import 'package:flutter/material.dart';

class EnglishSchedulePage extends StatefulWidget {
  @override
  _englishSchedulePageState createState() => _englishSchedulePageState();
}

class _englishSchedulePageState extends State<EnglishSchedulePage> {
  final ScrollController scrollController = ScrollController();
  final Color bottomColor = new Color.fromRGBO(113, 197, 208, 1);
  final Color topColor = new Color.fromRGBO(42, 23, 17, 1);

  late Color currentBackgroundColor;

  @override
  void initState() {
    super.initState();
    currentBackgroundColor = bottomColor;
    scrollController.addListener(_onScroll);
  }

  void _onScroll(){
    if(!scrollController.hasClients) return;

    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;

    if(maxScroll == 0) return;
    final progress = (currentScroll / maxScroll).clamp(0.0, 1.0);

    if(progress >= 0.5 && currentBackgroundColor != topColor) {
      setState(() {
        currentBackgroundColor = topColor;
      });
    } else if(progress < 0.5 && currentBackgroundColor != bottomColor) {
      setState(() {
        currentBackgroundColor = bottomColor;
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final schema_path = "assets/data/nollning_26/schema/schema_en.png";

    return Scaffold(
      backgroundColor: currentBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        reverse: true,
        child: Image.asset(
          schema_path,
          width: double.infinity,
          fit: BoxFit.fitWidth,
          cacheHeight: 5000,
        ),
      ),
    );
  }
}