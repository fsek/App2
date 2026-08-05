import "dart:math" as math;
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:api_client/api_client.dart";
import "package:fsek_mobile/services/api.service.dart";
import "package:dio/dio.dart";
import "package:audioplayers/audioplayers.dart";
import "package:syncfusion_flutter_charts/charts.dart";
import "package:built_collection/built_collection.dart";
import "enclose_grid.dart";
import "helper_widgets/animated_moose_grid_image.dart";
import "helper_widgets/wiggling_widget.dart";
import "helper_widgets/outlined_text.dart";
import "helper_widgets/highlighted_text.dart";
import "helper_widgets/animated_smooth_arrow.dart";
import "helper_widgets/animated_thought_bubble.dart";
import "../../../util/time.dart";

class EncloseMooseGamePage extends StatefulWidget {
  const EncloseMooseGamePage({
    required this.pageController,
    required this.level,
    required this.availableLevels
  });

  final PageController pageController;
  final EncloseMooseLevelRead level;
  final List<EncloseMooseLevelRead> availableLevels;

  @override
  _EncloseMooseGameState createState() => _EncloseMooseGameState();
}

class _EncloseMooseGameState extends State<EncloseMooseGamePage> with TickerProviderStateMixin {
  late bool _hasSubmitted = _usedLevel.playerSubmission != null;
  late EncloseMooseLevelRead _usedLevel = widget.level;

  late final _grid = EncloseGrid(_usedLevel.encodedGrid, _usedLevel.wallBudget);
  late final _levelRandom = math.Random(_usedLevel.levelId.hashCode);
  late final _staticIdleFrames = _grid.flatGrid.indexed.map((indexedGridCell) {
    final index = indexedGridCell.$1;
    final gridCell = indexedGridCell.$2;

    if (gridCell == EncloseGridCellType.water) {
      final row = (index / _grid.gridWidth).toInt();
      final col = index % _grid.gridWidth;
      List<bool> neighborNonWater = [];
      neighborNonWater.add(col != 0 ? _grid.flatGrid[index - 1] != EncloseGridCellType.water : true);
      neighborNonWater.add(row != 0 ? _grid.flatGrid[index - _grid.gridWidth] != EncloseGridCellType.water : true);
      neighborNonWater.add(col != _grid.gridWidth - 1 ? _grid.flatGrid[index + 1] != EncloseGridCellType.water : true);
      neighborNonWater.add(row != _grid.gridHeight - 1 ? _grid.flatGrid[index + _grid.gridWidth] != EncloseGridCellType.water : true);

      return gridCell.getIdleFrames(random: _levelRandom, extra: neighborNonWater);
    }

    return gridCell.getIdleFrames(random: _levelRandom);
  }).toList();
  late final _portalOffset = _levelRandom.nextDouble() * 360;

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

  final Map<String, int> _openCallCounter = {};

  final Map<int, int> _shownTooltipCalls = {};
  final Map<int, String> _tooltipTexts = {};

  final Map<int, int> _shownPortalCalls = {};
  final Set<List<int>> _shownPortalConnections = {};
  late final Map<int, ColorFilter> _portalFilters = Map.fromIterables(_grid.portals.keys, _grid.portals.keys.map(
    (portalIndex) => ColorFilter.matrix(_hueRotationMatrix(_portalOffset + 360 * portalIndex / _grid.portals.length))
  ));  // Precompute these

  // final List<Future> _callCounterFutures = [];  // Could have one for each call counter to have better control

  // bool panPlacesWalls = true;

  math.Random _mooseThoughtRandom = math.Random();
  String _mooseThought = "";
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    // for (final callCounterFuture in _callCounterFutures) {
    //   callCounterFuture.ignore();
    // }
    _idleController.dispose();
    _audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const backgroundImage = "assets/img/enclose_moose/grass/0_idle0.png";

    final maxOffset = _grid.getMaxDistance() ?? 0;

    final isCurrentBest = _bestSolutionScore == _grid.score || _bestSolution == null;
    final isNotShowingYours = _hasSubmitted && !setEquals(_grid.getWallIndices(), _usedLevel.playerSubmission!.playerSolution.toSet());

    return Scaffold(
        appBar: AppBar(
          leading: WigglingWidget(
            controller: _idleController,
            child: const BackButton(
              color: Colors.white
            )
          ),

          title: Text.rich(
            TextSpan(
              children: "enclose.moose".characters.map((char) => WidgetSpan(
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
            ),
          )
        ),
        body: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                backgroundImage,
                fit: BoxFit.fill
              )
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
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
                                  text: _usedLevel.dayIndex != null ? "Day ${_usedLevel.dayIndex}" : "Extra",
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
                                setState(() {
                                  _grid.reset();
                                });
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
                          text: _usedLevel.name,
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 20,
                            fontFamily: "Schoolbell"
                          ),
                          textAlign: TextAlign.center,
                        )
                      ),
                    ]
                  )
                ),

                Expanded(
                  child: InteractiveViewer(
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                        final boardWidth = constraints.maxWidth;
                        final boardHeight = constraints.maxHeight;

                        final cellSize = math.min(
                          boardWidth / _grid.gridWidth,
                          boardHeight / _grid.gridHeight,
                        );

                        final mooseRow = _grid.mooseIndex ~/ _grid.gridWidth;
                        final mooseColumn = _grid.mooseIndex % _grid.gridWidth;

                        const thoughtCloudWidth = 200;

                        return SizedBox(
                          width: _grid.gridWidth * cellSize,
                          height: _grid.gridHeight * cellSize + 0.0001,  // for some reason adding a small number allows the walls on the top row to overflow
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              GridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: _grid.gridWidth,
                                children: _grid.flatGrid.indexed.map((indexedGridCell) {
                                  final flatIndex = indexedGridCell.$1;
                                  final gridCell = indexedGridCell.$2;
                                  
                                  final isEnclosed = _grid.enclosure?.contains(flatIndex) ?? false;

                                  const wheatFrameDuration = Duration(milliseconds: 40);
                                  final frameOffset = _grid.getDistance(flatIndex);
                                  final waitTime = frameOffset == null ? null : wheatFrameDuration * frameOffset;
                                  final reverseFramOffset = frameOffset == null ? null : maxOffset - _grid.getDistance(flatIndex, includeExpand: false)!;
                                  final reverseWaitTime = reverseFramOffset == null ? null : wheatFrameDuration * reverseFramOffset;

                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: cellSize / 300,
                                      )
                                    ),
                                    child: OverflowBox(
                                      maxHeight: double.infinity,
                                      alignment: Alignment.bottomCenter,
                                      child: GestureDetector(
                                        onTap: () {
                                          _tapTile(flatIndex, gridCell);
                                        },
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          clipBehavior: Clip.none,
                                          fit: StackFit.passthrough,
                                          children: [
                                            if (gridCell != EncloseGridCellType.water) ...[
                                              AnimatedMooseGridImage(
                                                frames: EncloseGridCellType.grass.getAnimationFrames(random: _levelRandom),
                                                frameDuration: wheatFrameDuration,
                                                vsync: this,
                                                idleFrames: _staticIdleFrames[flatIndex],
                                                idleController: _idleController
                                              ),

                                              AnimatedMooseGridImage(
                                                // key: Key(EncloseGridCellType.wheatFrames.toString() + flatIndex.toString()),
                                                isVisible: isEnclosed,
                                                frames: gridCell == EncloseGridCellType.moose ? EncloseGridCellType.emptyWheatFrames : EncloseGridCellType.animationWheatFrames,  // Would rather not animate emptyWheatFrames
                                                vsync: this,
                                                waitTime: waitTime,
                                                reverseWaitTime: reverseWaitTime,
                                                idleFrames: gridCell == EncloseGridCellType.moose ? [] : EncloseGridCellType.idleWheatFrames,
                                                idleController: _idleController
                                              ),
                                            ],

                                            AnimatedMooseGridImage(
                                              isVisible: gridCell == EncloseGridCellType.wall,
                                              frames: EncloseGridCellType.wall.getAnimationFrames(random: _levelRandom),
                                              vsync: this,
                                              reverseFrameDuration: const Duration(milliseconds: 20),
                                              idleFrames: EncloseGridCellType.wall.getIdleFrames(random: _levelRandom),  // can"t use _staticIdleFrames
                                              idleController: _idleController
                                            ),

                                            // Text(flatIndex.toString(), style: TextStyle(fontSize: 10)),

                                            // Text((_grid.getDistance(flatIndex) ?? -1).toString()),

                                            if (gridCell == EncloseGridCellType.portal)
                                              ColorFiltered(
                                                colorFilter: _portalFilters[_grid.getPortalIndex(flatIndex)!]!,
                                                child: AnimatedMooseGridImage(
                                                  frames: gridCell.getAnimationFrames(random: _levelRandom),
                                                  vsync: this,
                                                  idleFrames: _staticIdleFrames[flatIndex],
                                                  idleController: _idleController
                                                )
                                              ),

                                            if (gridCell == EncloseGridCellType.apple)
                                              AnimatedMooseGridImage(
                                                frames: gridCell.getAnimationFrames(random: _levelRandom),
                                                isVisible: isEnclosed,
                                                vsync: this,
                                                frameDuration: wheatFrameDuration,  // To simplify, this is chosen so that the total duration is the same as for wheat
                                                waitTime: waitTime,
                                                reverseWaitTime: reverseWaitTime,
                                                idleFrames: _staticIdleFrames[flatIndex],
                                                idleController: _idleController
                                              ),

                                            if (gridCell != EncloseGridCellType.grass && gridCell != EncloseGridCellType.wall && gridCell != EncloseGridCellType.portal && gridCell != EncloseGridCellType.apple)
                                              AnimatedMooseGridImage(
                                                frames: gridCell.getAnimationFrames(random: _levelRandom),
                                                vsync: this,
                                                idleFrames: _staticIdleFrames[flatIndex],
                                                idleController: _idleController
                                              ),
                                              // SlideShowImage(
                                              //   key: Key(frames.toString()),
                                              //   frames: frames,
                                              //   fit: BoxFit.fill,
                                              //   filterQuality: FilterQuality.none
                                              // )

                                            if (_tooltipTexts.containsKey(flatIndex))
                                              Positioned(
                                                top: -15,
                                                child: AnimatedOpacity(
                                                  opacity: _shownTooltipCalls[flatIndex] != 0 ? 1 : 0,
                                                  duration: const Duration(milliseconds: 150),
                                                  onEnd: () {
                                                    setState(() {
                                                      _tooltipTexts.remove(flatIndex);  // not really needed, just to avoid unnecessary wiggling computation. this removes fade-in but fade-in kinda sucks anyway
                                                    });
                                                  },
                                                  child: WigglingWidget(
                                                    controller: _idleController,
                                                    child: OutlinedText(
                                                      text: _tooltipTexts[flatIndex]!,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontFamily: "Schoolbell"
                                                      )
                                                    )
                                                  )
                                                )
                                              ),
                                            ]
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

                                ..._shownPortalConnections.map((portalConnection) {
                                  final portalIndex = _grid.getPortalIndex(portalConnection[0])!;
                                  const defaultPortalColor = Color.fromRGBO(74, 187, 234, 255);  // HSLColor.fromAHSL(1, 196, 0.67, 0.45);  // approximate average of portal image

                                  return ColorFiltered(
                                    key: Key(portalConnection.toString()),  // to keep from restarting animation when other portals change
                                    colorFilter: _portalFilters[portalIndex]!,
                                    child: IgnorePointer(
                                      child: AnimatedSmoothArrow(
                                        isVisible: _shownPortalCalls[portalConnection[0]] != 0,
                                        onDisappear: () {
                                          setState(() {
                                            // _shownFlatIndexPortalColors.removeWhere((key, val) => orderedPortal.contains(key));  // need to remove both to avoid some weird bugs since opposite portals can be clicked but won"t show
                                            _shownPortalConnections.remove(portalConnection);
                                          });
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
                                }).toList(),

                                if (_grid.escapePath != null)
                                  IgnorePointer(
                                    child: AnimatedSmoothArrow(
                                      isVisible: (_openCallCounter["escape"] ?? 0) != 0,
                                      vsync: this,
                                      flatIndices: _grid.escapePath!,
                                      gridWidth: _grid.gridWidth,
                                      cellSize: cellSize,
                                      extraLength: cellSize,
                                      extraDirection: _grid.escapeDirection,
                                      lineColor: Colors.white.withAlpha(200),
                                      idleController: _idleController,
                                      frequency: 2
                                    )
                                  ),

                                if (_grid.escapePath != null)
                                  Positioned(
                                    left: (mooseColumn + 1) * cellSize - thoughtCloudWidth / 2,
                                    right: (_grid.gridWidth - mooseColumn - 1) * cellSize - thoughtCloudWidth / 2,
                                    bottom: (_grid.gridHeight - mooseRow) * cellSize + 20,
                                    child: IgnorePointer(
                                      child: AnimatedThoughtBubble(
                                        isVisible: (_openCallCounter["escape"] ?? 0) != 0,
                                        text: _mooseThought,
                                        color: Colors.white.withAlpha(180),
                                        idleController: _idleController
                                      ),
                                    )
                                  ),
                              ]
                            )
                          );
                        }
                      )
                    )
                  )
                ),

                SafeArea(
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
                                showHighlight: (_openCallCounter["walls"] ?? 0) != 0,
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
                              visible: !_hasSubmitted && _grid.enclosure != null,
                              maintainState: true,
                              maintainAnimation: true,
                              maintainSize: true,
                              child: WigglingWidget(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    overlayColor: Colors.black
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
                                showHighlight: (_openCallCounter["score"] ?? 0) != 0,
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
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    _changeToSolution(_usedLevel.optimalSolution!);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
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
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    _changeToSolution(_hasSubmitted ? _usedLevel.playerSubmission!.playerSolution : _bestSolution!);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
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
                )
              ]
            )
          ]
        )
    );
  }

  void _incrementCallCounter<T>(Map<T, int> callCounter, T key, {Duration duration = const Duration(seconds: 4)}) {
    setState(() {
      callCounter[key] = (callCounter[key] ?? 0) + 1;
    });

    Future.delayed(duration, () {
      if (!mounted) return;

      if (callCounter[key] == 1) {
        setState(() {
          callCounter[key] = callCounter[key]! - 1;
        });
      } else {
        callCounter[key] = callCounter[key]! - 1;
      }

      // _callCounterFutures.removeAt(0);
    });
    // _callCounterFutures.add(callCounterFuture);
  }

  List<double> _hueRotationMatrix(double angleDeg) { // random matrix!
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

  void _tapTile(int flatIndex, EncloseGridCellType gridCell) {
    if (_grid.wallsLeft == 0 && gridCell == EncloseGridCellType.grass) {
      _incrementCallCounter(_openCallCounter, "walls", duration: const Duration(seconds: 1));
    }

    final oldEnclosure = _grid.enclosure;
    final toggleWallResult = _grid.toggleWall(flatIndex);
    if (toggleWallResult) {
      setState(() {});

      final recentlyEnclosed = oldEnclosure == null && _grid.enclosure != null;
      final isDifferentEnclosure = oldEnclosure != null && _grid.enclosure != null && !setEquals(oldEnclosure, _grid.enclosure);
      if (recentlyEnclosed || isDifferentEnclosure) {
        _incrementCallCounter(_openCallCounter, "score", duration: const Duration(seconds: 1));

        if (_bestSolutionScore == null || _grid.score! > _bestSolutionScore!) {
          _bestSolutionScore = _grid.score!;
          _bestSolution = _grid.getWallIndices();
        }
      }
    }

    if (gridCell == EncloseGridCellType.portal) {
      final portalIndex = _grid.getPortalIndex(flatIndex)!;
      for (final index in _grid.portals[portalIndex]!) {
        if (index == flatIndex) {
          continue;
        }

        final possiblePortalConnection = Set.of([index, flatIndex]);
        final alreadyShown = _shownPortalConnections.any(
          (portalConnection) => setEquals(Set.of(portalConnection), possiblePortalConnection)
        );
        if (!alreadyShown) {
          _shownPortalConnections.add([flatIndex, index]);
        }
      }
      _incrementCallCounter(_shownPortalCalls, flatIndex);
    }

    if (gridCell == EncloseGridCellType.moose) {
      if (_grid.escapePath != null) {
        _incrementCallCounter(_openCallCounter, "escape", duration: const Duration(seconds: 5));

        const mooseThoughts = [
          "I can go thiiiis way \n *neigh*",
          "moooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
        ];
        const mooseThoughtSounds = [
          "audio/moose.mp4",
          "audio/moose2.mp4"
        ];

        final mooseThoughtIndex = _mooseThoughtRandom.nextInt(mooseThoughts.length);
        _mooseThought = mooseThoughts[mooseThoughtIndex];
        final mooseThoughtSound = mooseThoughtSounds[mooseThoughtIndex];
        _audioPlayer.play(AssetSource(mooseThoughtSound));
      }
    }

    final bonusScore = gridCell.getBonusScore();
    if (bonusScore != 0) {
      _tooltipTexts[flatIndex] = (bonusScore > 0 ? "+" : "") + "$bonusScore if enclosed";

      _incrementCallCounter(_shownTooltipCalls, flatIndex);
    }
  }

  Future<void> _submitSolution() async {
    _changeToSolution(_bestSolution!);

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
    setState(() {
      _grid.reset(doUpdate: false);

      for (final flatIndex in solution) {
        _grid.toggleWall(flatIndex, doUpdate: false);
      }

      _grid.updateEnclosure();
    });
  }

  Widget Function(BuildContext) _buildDayChooserDialog() {
    return (context) => AlertDialog(
      contentPadding: const EdgeInsets.all(16),
      constraints: BoxConstraints(maxHeight: 400),
      scrollable: true,
      content:
        Column(
          spacing: 20,
          children: [
            Column(
              children: [
                const Text(
                  "Previous days",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Schoolbell"
                  )
                ),

                ..._dailies.map((level) => Card.outlined(
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
                            text: " (${Time.format(level.releaseDate.toDateTime(), "%d %M %Y")})",
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
                      level.playerSubmission!.playerScore == level.optimalScore ? "💎" : "✅",  // This is so scuffed
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
                const Text(
                  "Extras",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Schoolbell"
                  )
                ),

                ..._nonDailies.map((level) => Card.outlined(
                  child: ListTile(
                    onTap: () {
                      widget.pageController.jumpToPage(widget.availableLevels.indexOf(level));
                      Navigator.of(context).pop();
                    },
                    title: Text(
                      level.name,
                      style: const TextStyle( 
                        fontSize: 18,
                        fontFamily: "Schoolbell"
                      )
                    ),
                    trailing: level.playerSubmission == null ? null : Text(
                      level.playerSubmission!.playerScore == level.optimalScore ? "💎" : "✅",  // This is so scuffed
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
