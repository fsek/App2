import "dart:math" as math;
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:built_collection/built_collection.dart";
import "package:audioplayers/audioplayers.dart";
import "package:syncfusion_flutter_charts/charts.dart";
import "package:dio/dio.dart";
import "package:api_client/api_client.dart";
import "package:fsek_mobile/services/api.service.dart";
import "package:fsek_mobile/l10n/app_localizations.dart";
import "enclose_grid.dart";
import "enclose_grid_tile.dart";
import "call_counter.dart";
import "tile_widget.dart";
import "helper_widgets/wiggling_widget.dart";
import "helper_widgets/outlined_text.dart";
import "helper_widgets/highlighted_text.dart";
import "helper_widgets/animated_smooth_arrow.dart";
import "helper_widgets/animated_thought_bubble.dart";
import "../../../util/time.dart";

class EncloseMooseLevelPage extends StatefulWidget {
  const EncloseMooseLevelPage({
    required this.pageController,
    required this.level,
    required this.availableLevels
  });

  final PageController pageController;
  final EncloseMooseLevelRead level;
  final List<EncloseMooseLevelRead> availableLevels;

  @override
  _EncloseMooseLevelState createState() => _EncloseMooseLevelState();
}

class _EncloseMooseLevelState extends State<EncloseMooseLevelPage> with TickerProviderStateMixin {
  late bool _hasSubmitted = _usedLevel.playerSubmission != null;
  late EncloseMooseLevelRead _usedLevel = widget.level;

  late final _grid = EncloseGrid(_usedLevel.encodedGrid, _usedLevel.wallBudget);
  late final _portalOffset = math.Random(_usedLevel.levelId.hashCode).nextDouble() * 360;

  late List<EncloseMooseLevelRead> _dailies = widget.availableLevels.where((level) => level.dayIndex != null).toList();
  late List<EncloseMooseLevelRead> _nonDailies = widget.availableLevels.where((level) => level.dayIndex == null).toList();

  int? _bestSolutionScore;
  Set<int>? _bestSolution;

  final _idleDuration = const Duration(milliseconds: 1000);
  late final _idleController = AnimationController(vsync: this)
    ..repeat(
      reverse: false,
      period: _idleDuration
    );

  final CallCounter<String, int> _openCallCounter = CallCounter();
  final CallCounter<EncloseGridTile, String> _tooltipCallCounter = CallCounter();
  final CallCounter<int, List<int>> _portalCallCounter = CallCounter();

  late final Map<int, ColorFilter> _portalFilters = Map.fromIterables(_grid.portals.keys, _grid.portals.keys.map(
    (portalIndex) => ColorFilter.matrix(_hueRotationMatrix(_portalOffset + 360 * portalIndex / _grid.portals.length))
  ));  // Precompute these for performance

  // bool panPlacesWalls = true;

  math.Random _mooseThoughtRandom = math.Random();
  String _mooseThought = "";
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    updateScore(null);  // kind of only needed if level is enclosed from start
  }

  @override
  void dispose() {
    _idleController.dispose();
    _audioPlayer.dispose();

    _openCallCounter.dispose();
    _tooltipCallCounter.dispose();
    _portalCallCounter.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // const backgroundImage = "assets/img/enclose_moose/grass/0_idle0.png";
    final t = AppLocalizations.of(context)!;

    final topBar = Padding(
      // color: Colors.black.withAlpha(50),
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WigglingWidget(
                controller: _idleController,
                child: IconButton(
                  onPressed: () {
                    showDialog(context: context, builder: _buildDayChooserDialog());
                  },
                  icon: const Icon(Icons.calendar_month_rounded),
                  color: Colors.white
                )
              ),
              
              Visibility(
                visible: _hasSubmitted,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: WigglingWidget(
                  controller: _idleController,
                  child: IconButton(
                    onPressed: () {
                      showDialog(context: context, builder: _buildSubmitDialog());
                    },
                    icon: const Icon(Icons.leaderboard_outlined),
                    color: Colors.white
                  )
                )
              ),

              const Spacer(),

              Row(
                children: [
                  Visibility(
                    visible: widget.availableLevels.first != _usedLevel,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: WigglingWidget(
                      controller: _idleController,
                      child: IconButton(
                        onPressed: () {
                          widget.pageController.jumpToPage(widget.pageController.page!.toInt() - 1);
                        },
                        icon: const Icon(Icons.chevron_left),
                        color: Colors.white
                      )
                    )
                  ),

                  WigglingWidget(
                    controller: _idleController,
                    child: OutlinedText(
                      text: _usedLevel.dayIndex != null ? "Day ${_usedLevel.dayIndex}" : "Bonus",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "Schoolbell"
                      )
                    )
                  ),

                  Visibility(
                    visible: widget.availableLevels.last != _usedLevel,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: WigglingWidget(
                      controller: _idleController,
                      child: IconButton(
                        onPressed: () {
                          widget.pageController.jumpToPage(widget.pageController.page!.toInt() + 1);
                        },
                        icon: const Icon(Icons.chevron_right),
                        color: Colors.white
                      )
                    )
                  ),
                ]
              ),

              Spacer(),

              WigglingWidget(
                controller: _idleController,
                child: IconButton(
                  onPressed: () {
                    _grid.reset();
                  },
                  icon: const Icon(Icons.restart_alt_outlined),
                  color: Colors.white
                )
              ),

              WigglingWidget(
                controller: _idleController,
                  child: IconButton(
                  onPressed: () {
                    showDialog(context: context, builder: _buildHelpDialog());
                  },
                  icon: const Icon(Icons.question_mark_outlined),
                  color: Colors.white
                )
              ),
            ]
          ),

          WigglingWidget(
            controller: _idleController,
            child: OutlinedText(
              text: t.localeName == "sv" ? _usedLevel.nameSv : _usedLevel.nameEn,
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 20,
                fontFamily: "Schoolbell"
              ),
              textAlign: TextAlign.center,
            )
          ),
        ]
      )
    );

    return Scaffold(
        appBar: AppBar(
          leading: WigglingWidget(
            controller: _idleController,
            child: const BackButton(
              color: Colors.white
            )
          ),

          title: WigglingWidget(
            controller: _idleController,
            child: Text.rich(
              TextSpan(
                children: "enclose.moose".characters.map((char) => WidgetSpan(  // Could consider making all text like this
                  child: WigglingWidget(
                    controller: _idleController,
                    child: OutlinedText(
                      text: char,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontFamily: "Schoolbell"
                      )
                    )
                  )
                )).toList()
              )
            )
          )
        ),
        body: Stack(
          children: [
            SizedBox.expand(
              // child: Image.asset(
              //   backgroundImage,
              //   fit: BoxFit.fill
              // )
              child: Container(
                color: Color(0xFF00501f)
              )
            ),

            Column(
              children: [
                Visibility(
                  visible: false,
                  maintainState: true,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainInteractivity: false,
                  child: topBar
                ),

                Expanded(
                  child: InteractiveViewer(
                    clipBehavior: Clip.none,  // pretty cool! maybe not good though
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final boardWidth = constraints.maxWidth;
                          final boardHeight = constraints.maxHeight;

                          final cellSize = math.min(
                            boardWidth / _grid.gridWidth,
                            boardHeight / _grid.gridHeight,
                          );

                          return SizedBox(
                            width: _grid.gridWidth * cellSize,
                            height: _grid.gridHeight * cellSize + 0.0000001,  // Adds a really small height, which for some reason sometimes fixes allowing clipping
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                GridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: _grid.gridWidth,
                                  children: _grid.flatGrid.map((tile) {
                                    // final isEnclosed = _grid.enclosure?.contains(tile) ?? false;

                                    // const wheatFrameDuration = Duration(milliseconds: 40);
                                    // final frameOffset = _grid.getDistance(tile);
                                    // final waitTime = frameOffset == null ? null : wheatFrameDuration * frameOffset;
                                    // final reverseFramOffset = frameOffset == null ? null : maxOffset - _grid.getDistance(tile, includeExpand: false)!;
                                    // final reverseWaitTime = reverseFramOffset == null ? null : wheatFrameDuration * reverseFramOffset;

                                    final neighboringWater = !tile.isWater ? null : _grid.getNeighbors(tile, includeDiagonal: true, keepNulls: true).map(
                                      (neighbor) => !(neighbor?.isWater ?? false)
                                    ).toList();

                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.green[900]!,
                                          width: cellSize / 100
                                        )
                                      ),
                                      child: OverflowBox(
                                        maxHeight: double.infinity,
                                        alignment: Alignment.bottomCenter,
                                        child: TileWidget(
                                          tile: tile,
                                          vsync: this,
                                          idleController: _idleController,
                                          tileRandomFunction: () => math.Random(_usedLevel.levelId.hashCode + tile.index.hashCode),
                                          onTap: () => _tapTile(tile),
                                          portalFilter: _portalFilters[tile.portalIndex],
                                          neighboringWater: neighboringWater,
                                          tooltipCallCounter: RestrictedCallCounter(
                                            callCounter: _tooltipCallCounter,
                                            key: tile
                                          )
                                        )
                                      )
                                    );
                                  }).toList()
                                ),

                                /*  // for panning to place walls. Interfered with the gridcell gesturedetector and not all that useful
                                GestureDetector(
                                  onPanDown: (details) {
                                    final rowIndex = (details.localPosition.dy / cellSize).floor();
                                    final columnIndex = (details.localPosition.dx / cellSize).floor();
                                    final flatIndex = rowIndex * _grid.gridWidth + columnIndex;

                                    if (_grid.flatGrid[flatIndex] == .grass) {
                                      panPlacesWalls = true;
                                    } else if (_grid.flatGrid[flatIndex] == .wall) {
                                      panPlacesWalls = false;
                                    }

                                    print("Start");
                                    print(flatIndex);
                                    final toggleWallResult = _grid.toggleWall(flatIndex);
                                    print(toggleWallResult);
                                    setState(() {});
                                  },
                                  onPanUpdate: (details) {
                                    final rowIndex = (details.localPosition.dy / cellSize).floor();
                                    final columnIndex = (details.localPosition.dx / cellSize).floor();
                                    final flatIndex = rowIndex * _grid.gridWidth + columnIndex;

                                    if ((_grid.flatGrid[flatIndex] == .grass && !panPlacesWalls) || (_grid.flatGrid[flatIndex] == .wall && panPlacesWalls)) return;

                                    print("Update");
                                    print(flatIndex);
                                    final toggleWallResult = _grid.toggleWall(flatIndex);
                                    print(toggleWallResult);
                                    setState(() {});
                                  }
                                ),
                                */
                                
                                ListenableBuilder(
                                  listenable: _portalCallCounter,
                                  builder: (context, child) => Stack(
                                    clipBehavior: Clip.none,
                                    children: List.generate(_grid.portals.length, (index) => index).map((portalIndex) {
                                      final portalConnection = _portalCallCounter.getValue(portalIndex);
                                      const defaultPortalColor = Color.fromRGBO(74, 187, 234, 255);

                                      if (portalConnection == null) {
                                        return null;
                                      }

                                      return ColorFiltered(
                                        key: Key(portalConnection.toString()),  // to keep from restarting animation when other portals change
                                        colorFilter: _portalFilters[portalIndex]!,
                                        child: IgnorePointer(
                                          child: AnimatedSmoothArrow(
                                            isVisible: _portalCallCounter.isNotEmpty(portalIndex),
                                            onDisappear: () {
                                              _portalCallCounter.remove(portalIndex);
                                            },
                                            vsync: this,
                                            flatIndices: portalConnection,
                                            gridWidth: _grid.gridWidth,
                                            cellSize: cellSize,
                                            lineColor: defaultPortalColor,
                                            showArrowHead: false,
                                            idleController: _idleController,
                                            frequency: 2
                                          )
                                        )
                                      );
                                    }).nonNulls.toList()
                                  )
                                ),

                                ListenableBuilder(
                                  listenable: Listenable.merge([
                                    _grid,
                                    _openCallCounter
                                  ]),
                                  builder: (context, child) {
                                    const thoughtCloudWidth = 200;  // Would like this to be dynamic in some way but don't know how? Would have to specify the center coordinate

                                    return Stack(
                                      clipBehavior: Clip.none,
                                      fit: StackFit.expand,
                                      children: [
                                        if (_grid.escapePath != null)
                                          IgnorePointer(
                                            child: AnimatedSmoothArrow(
                                              isVisible: (_openCallCounter.getCount("escape") ?? 0) != 0,
                                              vsync: this,
                                              flatIndices: _grid.escapePath!.map((tile) => tile.index).toList(),
                                              gridWidth: _grid.gridWidth,
                                              cellSize: cellSize,
                                              extraLength: cellSize,
                                              extraDirection: _grid.escapeDirection,
                                              lineColor: Colors.white.withAlpha(200),
                                              idleController: _idleController,
                                              frequency: 2
                                            )
                                          ),

                                        Positioned(
                                          left: (_grid.mooseTile.columnIndex - 0.5) * cellSize - thoughtCloudWidth / 2,
                                          right: (_grid.gridWidth - _grid.mooseTile.columnIndex - 1) * cellSize - thoughtCloudWidth / 2,
                                          bottom: (_grid.gridHeight - _grid.mooseTile.rowIndex) * cellSize + 20,
                                          child: IgnorePointer(
                                            child: AnimatedThoughtBubble(
                                              isVisible: (_openCallCounter.getCount("thinking") ?? 0) != 0,
                                              text: _mooseThought,
                                              color: Colors.white.withAlpha(180),
                                              idleController: _idleController
                                            )
                                          )
                                        ),
                                      ]
                                    );
                                  }
                                )
                              ]
                            )
                          );
                        }
                      )
                    )
                  )
                ),

                ListenableBuilder(
                  listenable: Listenable.merge([
                    _grid,
                    _openCallCounter
                  ]),
                  builder: (context, child) {
                    final isCurrentBest = _bestSolutionScore == _grid.score || _bestSolution == null;
                    final isNotShowingYours = _hasSubmitted && !setEquals(_grid.getWallIndices(), _usedLevel.playerSubmission!.playerSolution.toSet());

                    /*  // Is pretty good to show what parts of the screen are clickable but feels restrictive as a user
                    return Container(
                      // color: Colors.black.withAlpha(50),
                      child: SafeArea(
                    */
                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                WigglingWidget(
                                  controller: _idleController,
                                  child: HighlightedText(
                                    showHighlight: (_openCallCounter.getCount("walls") ?? 0) != 0,
                                    child: OutlinedText(
                                      text: "Walls: ${_grid.wallsLeft}/${_grid.wallBudget}",
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontFamily: "Schoolbell"
                                      )
                                    )
                                  )
                                ),

                                Spacer(),

                                Visibility(
                                  visible: !_hasSubmitted && _grid.escapePath == null,
                                  maintainState: true,
                                  maintainAnimation: true,
                                  maintainSize: true,
                                  child: WigglingWidget(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        )
                                      ),
                                      onPressed: _submitSolution,
                                      child: const OutlinedText(
                                        text: "Submit",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: "Schoolbell"
                                        )
                                      )
                                    ),
                                    controller: _idleController
                                  )
                                ),

                                Spacer(),

                                WigglingWidget(
                                  controller: _idleController,
                                  child: HighlightedText(
                                    showHighlight: (_openCallCounter.getCount("score") ?? 0) != 0,
                                    child: OutlinedText(
                                      text: "Score: ${_grid.score ?? "N/A"}",
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontFamily: "Schoolbell"
                                      )
                                    )
                                  )
                                ),
                              ]
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  visible: _hasSubmitted && _grid.score != _usedLevel.optimalScore,
                                  maintainState: true,
                                  maintainAnimation: true,
                                  maintainSize: true,
                                  child: WigglingWidget(
                                    controller: _idleController,
                                    child: OutlinedButton.icon(
                                      onPressed: () {
                                        _changeToSolution(_usedLevel.optimalSolution!);
                                      },
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Color(0xFF15542D).withAlpha(200),  // Colors.black.withAlpha(55),
                                        visualDensity: VisualDensity.compact
                                      ),
                                      label: OutlinedText(
                                        text: "Optimal: ${_usedLevel.optimalScore}",
                                        style: const TextStyle(
                                          // color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "Schoolbell"
                                        )
                                      ),
                                      icon: const Icon(Icons.star_sharp)
                                    )
                                  )
                                ),

                                Visibility(
                                  visible: isNotShowingYours || !isCurrentBest,
                                  maintainState: true,
                                  maintainAnimation: true,
                                  maintainSize: true,
                                  child: WigglingWidget(
                                    controller: _idleController,
                                    child: OutlinedButton.icon(
                                      onPressed: () {
                                        _changeToSolution(_hasSubmitted ? _usedLevel.playerSubmission!.playerSolution : _bestSolution!);
                                      },
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Color(0xFF15542D).withAlpha(200),  // Colors.black.withAlpha(55),
                                        visualDensity: VisualDensity.compact
                                      ),
                                      label: OutlinedText(
                                        text: _hasSubmitted ? "Your solution: ${_usedLevel.playerSubmission!.playerScore}" : "Your best: $_bestSolutionScore",
                                        style: const TextStyle(
                                          // color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "Schoolbell"
                                        )
                                      ),
                                      icon: const Icon(Icons.keyboard_return_outlined)
                                    )
                                  )
                                ),
                              ]
                            ),
                          ]
                        )
                      )
                    );
                  }
                )
              ]
            ),

            topBar,
          ]
        )
    );
  }

  List<double> _hueRotationMatrix(double angleDeg) {  // random matrix!
    final angleRad = angleDeg * math.pi / 180;
    final cosA = math.cos(angleRad);
    final sinA = math.sin(angleRad);

    const lumR = 0.213;
    const lumG = 0.715;
    const lumB = 0.072;

    return [
      lumR + cosA * (1 - lumR) + sinA * (-lumR),
      lumG + cosA * (-lumG) + sinA * (-lumG),
      lumB + cosA * (-lumB) + sinA * (1 - lumB),
      0, 0,

      lumR + cosA * (-lumR) + sinA * 0.143,
      lumG + cosA * (1 - lumG) + sinA * 0.140,
      lumB + cosA * (-lumB) + sinA * -0.283,
      0, 0,

      lumR + cosA * (-lumR) + sinA * (-(1 - lumR)),
      lumG + cosA * (-lumG) + sinA * lumG,
      lumB + cosA * (1 - lumB) + sinA * lumB,
      0, 0,

      0, 0, 0, 1, 0,
    ];
  }

  void updateScore(int? oldScore) {
    if (_grid.score == null) return;

    if (_grid.score! != oldScore) {
      _openCallCounter.increment("score", 0, duration: const Duration(seconds: 1));

      if (_bestSolutionScore == null || _grid.score! > _bestSolutionScore!) {
        _bestSolutionScore = _grid.score!;
        _bestSolution = _grid.getWallIndices();
      }
    }
  }

  void _tapTile(EncloseGridTile tile) {
    if (_grid.wallsLeft == 0 && tile.isGrass) {
      _openCallCounter.increment("walls", 0, duration: const Duration(seconds: 1));
    } else if (tile.canToggleWall) {
      final oldScore = _grid.score;
      _grid.toggleWall(tile);

      updateScore(oldScore);
    }

    if (tile.isPortal) {
      // final portalIndex = _grid.getPortalIndex(flatIndex)!;
      final portalIndex = tile.portalIndex!;
      for (final otherTile in _grid.portals[portalIndex]!) {
        final shownPortal = _portalCallCounter.getValue(portalIndex);
        final isOtherPortalShown = shownPortal != null && shownPortal[0] != tile.index;
        if (otherTile.index == tile.index || isOtherPortalShown) {
          continue;
        }

        _portalCallCounter.increment(portalIndex, [tile.index, otherTile.index]);
      }
    }

    if (tile.isMoose) {
      if (_grid.escapePath != null) {
        _openCallCounter.increment("escape", 0, duration: const Duration(seconds: 5));
      }

      _openCallCounter.increment("thinking", 0, duration: const Duration(seconds: 5));

      const freeMooseThoughts = [
        ("audio/moose.mp4", "I can go thiiiis way \n *neigh*"),
        ("audio/moose2.mp4", "moooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo")
      ];
      const enclosedMooseThoughts = [
        ("audio/moose.mp4", "I don't wanna be enclosed ):")
      ];

      final possibleThoughts = _grid.escapePath != null ? freeMooseThoughts : enclosedMooseThoughts;
      final mooseThoughtIndex = _mooseThoughtRandom.nextInt(possibleThoughts.length);
      _mooseThought = possibleThoughts[mooseThoughtIndex].$2;
      _audioPlayer.play(AssetSource(possibleThoughts[mooseThoughtIndex].$1));
    }

    if (tile.isBonus) {
      final bonusScore = tile.bonusScore;
      if (bonusScore != 0) {
        _tooltipCallCounter.increment(tile, (bonusScore > 0 ? "+" : "") + "$bonusScore if enclosed");
      }
    }
  }

  Future<void> _submitSolution() async {
    if (_bestSolution != null) {
      _changeToSolution(_bestSolution!);
    }

    final solution = _grid.getWallIndices();
    final submission = EncloseMooseSubmissionCreate(
      (sub) => sub
        ..playerSolution = SetBuilder<int>(solution)
    );

    const encloseMooseToken = String.fromEnvironment("ENCLOSE_MOOSE_SECRET", defaultValue: "");
    try {
      final response = await ApiService.apiClient
        .getEncloseMooseApi()
        .encloseMooseSubmitSolution(
          levelId: _usedLevel.levelId,
          encloseMooseSubmissionCreate: submission,
          headers: {"enclose-moose-token": encloseMooseToken}
        );

      if (!mounted) return;

      setState(() {
        _usedLevel = response.data!;
        widget.availableLevels[widget.availableLevels.indexWhere((level) => level.levelId == _usedLevel.levelId)] = _usedLevel;
        _hasSubmitted = true;
      });

      showDialog(context: context, builder: _buildSubmitDialog());
    } on DioException catch (e) {
      print("An error occured trying to submit a solution: $e");

      showDialog(context: context, builder: _buildSubmitErrorDialog(e.response?.statusMessage ?? ""));
    }
  }

  void _changeToSolution(Iterable<int> solution) {
    _grid.reset(doUpdate: false);

    for (final flatIndex in solution) {
      final tile = _grid.flatGrid[flatIndex];
      _grid.toggleWall(tile, doUpdate: false);
    }

    _grid.updateEnclosure();
  }

  Widget Function(BuildContext) _buildDayChooserDialog() {
    final t = AppLocalizations.of(context)!;

    return (context) => AlertDialog(
      contentPadding: const EdgeInsets.all(16),
      constraints: BoxConstraints(maxHeight: 400, minWidth: MediaQuery.of(context).size.width),
      scrollable: true,
      content:
        Column(
          spacing: 20,
          children: [
            Column(
              children: [
                if (_dailies.isNotEmpty)
                  const Text(
                    "Previous days",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Schoolbell"
                    )
                  ),

                ..._dailies.map((level) => Card.outlined(
                  color: level.levelId != _usedLevel.levelId ? null : Colors.amber.withAlpha(100),
                  child: ListTile(
                    onTap: () {
                      widget.pageController.jumpToPage(widget.availableLevels.indexOf(level));
                      Navigator.of(context).pop();
                    },
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Day ${level.dayIndex}"
                          ),

                          TextSpan(
                            text: " (${Time.format(level.releaseDate.toDateTime(), "%d %M %Y", locale: "en")})",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor
                            )
                          ),
                        ]
                      ),
                      style: const TextStyle( 
                        fontSize: 18,
                        fontFamily: "Schoolbell"
                      )
                    ),
                    trailing: level.playerSubmission == null ? null : Text(
                      level.playerSubmission!.playerScore == level.optimalScore ? "💎" : "✅",
                      style: const TextStyle(
                        fontSize: 18
                      )
                    )
                  )
                )).toList()
              ]
            ),

            Column(
              children: [
                if (_nonDailies.isNotEmpty)
                  const Text(
                    "Bonus levels",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Schoolbell"
                    )
                  ),

                ..._nonDailies.map((level) => Card.outlined(
                  color: level.levelId != _usedLevel.levelId ? null : Colors.amber.withAlpha(100),
                  child: ListTile(
                    onTap: () {
                      widget.pageController.jumpToPage(widget.availableLevels.indexOf(level));
                      Navigator.of(context).pop();
                    },
                    title: Text(
                      t.localeName == "sv" ? level.nameSv : level.nameEn,
                      style: const TextStyle( 
                        fontSize: 18,
                        fontFamily: "Schoolbell"
                      )
                    ),
                    trailing: level.playerSubmission == null ? null : Text(
                      level.playerSubmission!.playerScore == level.optimalScore ? "💎" : "✅",
                      style: const TextStyle(
                        fontSize: 18
                      )
                    )
                  )
                )).toList()
              ]
            ),
          ]
        )
    );
  }

  Widget Function(BuildContext) _buildHelpDialog() {
    return (context) => const SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      title: Text(
        "How to play",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontFamily: "Schoolbell"
        )
      ),
      children: [
        Text(
          "The objective is to build an enclosure for the moose by placing walls (tapping) on the grid. The moose can not move over the water. The more grass tiles in your enclosure, the higher your score. You only have a limited amount of walls so use them wisely.",
          style: TextStyle( 
            fontSize: 18,
            fontFamily: "Schoolbell"
          )
        ),
      ]
    );
  }

  Widget Function(BuildContext) _buildSubmitDialog() {
    final Map<int, int> scoreDistribution = {};
    for (final entry in _usedLevel.scoreDistribution!.entries) {
      scoreDistribution[int.parse(entry.key)] = entry.value;
    }

    final minScore = scoreDistribution.keys.reduce(math.min);
    for (final score in List.generate(_usedLevel.optimalScore! - minScore, (score) => minScore + score + 1)) {
      if (!scoreDistribution.containsKey(score)) {
        scoreDistribution[score] = 0;  // math.Random().nextInt(20);
      }
    }
    final entries = scoreDistribution.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    final zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enablePanning: true,
      enableDoubleTapZooming: true,
      zoomMode: ZoomMode.x,
    );
    final tooltipBehavior = TooltipBehavior(
      enable: true,
      animationDuration: 100,
      duration: 5000,
      color: Theme.of(context).primaryColor,
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${data.value} player${data.value != 1 ? "s" : ""} got a score of ${data.key}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Schoolbell"
            )
          ),
        );
      },
    );
  
    int totalCount = 0;
    int countLessOrEqual = 0;
    for (var entry in entries) {
      totalCount += entry.value;
      if (entry.key <= _usedLevel.playerSubmission!.playerScore) {
        countLessOrEqual += entry.value;
      }
    }
    final percentile = countLessOrEqual / totalCount;

    String grade;
    if (_usedLevel.playerSubmission!.playerScore == _usedLevel.optimalScore) {
      grade = "PERFECT!!! 💎";
    } else if (percentile >= 0.5) {
      grade = "Pretty good! ✅";
    } else if (percentile >= 0.5) {
      grade = "Not bad! ✅";
    } else if (percentile >= 0.25) {
      grade = "Not the worst! ✅";
    } else {
      grade = "Come on... ✅";
    }

    return (context) => SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      title: Text(
        grade,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontFamily: "Schoolbell"
        )
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "You scored as good or better than ",
                        style: const TextStyle( 
                          fontSize: 20,
                          fontFamily: "Schoolbell"
                        )
                      ),

                      TextSpan(
                        text: (percentile * 100).toInt().toString(),
                        style: const TextStyle( 
                          fontSize: 20,
                          fontFamily: "Schoolbell",
                          fontWeight: FontWeight.bold
                        )
                      ),

                      TextSpan(
                        text: "% of players",
                        style: const TextStyle( 
                          fontSize: 20,
                          fontFamily: "Schoolbell"
                        )
                      ),
                    ]
                  )
                )
              ),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Your score: ",
                      style: const TextStyle( 
                        fontSize: 20,
                        fontFamily: "Schoolbell"
                      )
                    ),

                    TextSpan(
                      text: _usedLevel.playerSubmission!.playerScore.toString(),
                      style: TextStyle( 
                        fontSize: 20,
                        fontFamily: "Schoolbell",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor
                      )
                    )
                  ]
                )
              ),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Optimal: ",
                      style: const TextStyle( 
                        fontSize: 20,
                        fontFamily: "Schoolbell"
                      )
                    ),

                    TextSpan(
                      text: _usedLevel.optimalScore.toString(),
                      style: TextStyle( 
                        fontSize: 20,
                        fontFamily: "Schoolbell",
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800]
                      )
                    )
                  ]
                )
              ),
            ]
          )
        ),

        SizedBox(
          width: MediaQuery.of(context).size.width,  // take as much space as you can!
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            title: ChartTitle(
              text: "Score distribution",
              textStyle: const TextStyle( 
                fontSize: 20,
                fontFamily: "Schoolbell"
              )
            ),
            tooltipBehavior: tooltipBehavior,
            zoomPanBehavior: zoomPanBehavior,
            primaryXAxis: CategoryAxis(
              title: AxisTitle(
                text: "Score",
                textStyle: const TextStyle( 
                  fontSize: 20,
                  fontFamily: "Schoolbell"
                )
              ),
              labelStyle: const TextStyle( 
                fontSize: 15,
                fontFamily: "Schoolbell"
              ),
              maximumLabels: 1,
              interval: entries.length >= 2 ? entries.length.toDouble() - 1 : 1,
              majorGridLines: MajorGridLines(width: 0),
              plotBands: <PlotBand>[
                PlotBand(
                  start: _usedLevel.playerSubmission!.playerScore.toString(),
                  end: _usedLevel.playerSubmission!.playerScore.toString(),
                  borderWidth: 2,
                  borderColor: Theme.of(context).primaryColor,
                  dashArray: [5, 5],
                  shouldRenderAboveSeries: true
                ),
              ],
            ),
            primaryYAxis: NumericAxis(
              title: AxisTitle(
                text: "Occurrence",
                textStyle: const TextStyle( 
                  fontSize: 20,
                  fontFamily: "Schoolbell"
                )
              ),
              labelStyle: const TextStyle( 
                fontSize: 15,
                fontFamily: "Schoolbell"
              ),
              interval: 1,
              axisLine: const AxisLine(width: 0)
            ),
            series: <CartesianSeries<MapEntry<int, int>, String>>[
              ColumnSeries<MapEntry<int, int>, String>(
                animationDuration: 400,
                dataSource: entries,
                xValueMapper: (data, _) => data.key.toString(),
                yValueMapper: (data, _) => data.value,
                color: Theme.of(context).primaryColor,
                // Rounded top corners for bars
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4)
                )
              ),
            ]
          )
        ),
      ]
    );
  }

  Widget Function(BuildContext) _buildSubmitErrorDialog(String errorMessage) {
    return (context) => SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      title: const Text(
        "There was an error with your submission",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontFamily: "Schoolbell"
        )
      ),
      children: [
        Text(
          "Please try again later.\n\nResponse was: \"$errorMessage\"",
          style: const TextStyle( 
            fontSize: 18,
            fontFamily: "Schoolbell"
          )
        ),
      ]
    );
  }
}
