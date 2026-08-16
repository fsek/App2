import "package:flutter/material.dart";
import "package:api_client/api_client.dart";
import "package:fsek_mobile/services/api.service.dart";
import "asset_handler.dart";
import "enclose_game_placeholder.dart";
import "enclose_moose_level_page.dart";

class EncloseMoosePage extends StatefulWidget {
  @override
  _EncloseMooseState createState() => _EncloseMooseState();
}

class _EncloseMooseState extends State<EncloseMoosePage> with TickerProviderStateMixin {
  List<EncloseMooseLevelRead>? _levels;

  late final PageController? _pageController;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheAllAssets();
    });

    _fetchLevels();
  }

  void _precacheAllAssets() {
    for (final frame in AssetHandler.getAllFrames()) {
      precacheImage(AssetImage(frame), context);
    }
  }

  Future<void> _fetchLevels() async {
    final response = await ApiService.apiClient.getEncloseMooseApi().encloseMooseGetAllLevels();

    if (!mounted) return;

    setState(() {
      _levels = response.data!
        .where((level) => level.dayIndex != null)
        .followedBy(response.data!
        .where((level) => level.dayIndex == null))
        .toList();
    });

    final lastDailyIndex = _levels!.lastIndexWhere((level) => level.dayIndex != null);
    _pageController = PageController(initialPage: lastDailyIndex != -1 ? lastDailyIndex : 0);

    /*
    """
      level_id,
      day_index,
      name,
      encoded_grid,
      wall_budget,
      optimal_score,
      optimal_solution,
      player_score,
      player_solution,
      plays
    """;

    for (final levelRead in levelReads) {
      final dayIndex = {
        "daily_-1": -1,
        "daily_0": 0,
        "daily_1": 1,
        "daily_2": 2,
        "daily_3": 3,
        "daily_4": 4,
      }[levelId]!;
      const name = "Sista";
      const encodedGrid = ".....~..~....~\n.~...~..~~~..~\n.~..~~......~~\n.~~....~~~....\n.........~....\n~...~......~~~\n~~~.~...~~.~..\n....~~.H~.....\n~~~.....~...~~\n..~.......~..~\n..........~..~\n~..~~..~..~~..\n~...~..~....~.\n~~..~.~~..~~~.";  // ".~........~~~..\n~......~~~~~~..\n..0~~S.~~~.0~..\n..~~~~......~..\n..~C~...~......\n....~..~....~..\n..~...~.....~..\n..~.~..........\n....~....~~~~~~\n..~.~...H~...1~\n..~......~~~~~~\n....~..........\n..~.~..........\n.1~.~...~~~~~..\n..~.....~...~..\n...C~...~G.....\n~~~~~~.~~~.~~~~";
      const wallBudget = 9;
      const optimalScore = 49;
      const optimalSolution = [
          31,
          34,
          56,
          80,
          98,
          135,
          142,
          148,
          187
      ];
      const playerScore = null;
      const playerSolution = null;
      const plays = 0;

      final grid = EncloseGrid(encodedGrid, wallBudget);
      final gameData = GameData(
        name: name,
        dayIndex: dayIndex,
        grid: grid,
        optimalScore: optimalScore,
        optimalSolution: optimalSolution,
        playerScore: playerScore,
        playerSolution: playerSolution,
        plays: plays
      );

      setState(() {
        _gameDatas[levelId] = gameData;
      });
    }
    */
  }

  @override
  void dispose() {
    _pageController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_levels == null || _levels!.length == 0) {
      return EncloseMooseGamePlaceholderPage(noLevels: _levels != null);
    }

    return PageView.builder(
      controller: _pageController!,
      allowImplicitScrolling: true,
      physics: const NeverScrollableScrollPhysics(),
      // scrollCacheExtent: ScrollCacheExtent.viewport(_levels.length.toDouble()),  // keeps all pages alive. Too expensive, consider only saving game state (sharedPreferences) and then using that
      itemCount: _levels!.length,
      itemBuilder: (context, index) {
        final level = _levels![index];

        return EncloseMooseLevelPage(
          pageController: _pageController,
          level: level,
          availableLevels: _levels!
        );
      }
    );
  }
}
