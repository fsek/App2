import "dart:collection";
import "dart:math";
import "package:flutter/material.dart";

enum EncloseGridCellType {
  grass,
  water,
  wall,
  portal,
  cherry,
  apple,
  bees,
  moose;

  static const _decodingDict = {
    ".": grass,
    "~": water,
    "C": cherry,
    "G": apple,
    "S": bees,
    "H": moose
  };

  static EncloseGridCellType? fromString(String character) {
    final digitRegExp = RegExp(r"\d");
    if (digitRegExp.hasMatch(character)) {
      return portal;
    }

    return _decodingDict[character];
  }

  /*
  String getImageName() {
    final basePath = "assets/img/enclose_moose/";

    switch (this) {
      case grass:
        return basePath + "grass.png";
      case water:
        return basePath + "water.png";
      case wall:
        return basePath + "wall/wall.png";
      case portal:
        return basePath + "portal.png";
      case cherry:
        return basePath + "cherry.png";
      case apple:
        return basePath + "apple.png";
      case bees:
        return basePath + "bees.png";
      case moose:
        return basePath + "moose.png";
    }
  }
  */

  static final animationWheatFrames = List.generate(5, (frameIndex) => "assets/img/enclose_moose/wheat/animation${frameIndex}.png");
  static final idleWheatFrames = List.generate(4, (frameIndex) => "assets/img/enclose_moose/wheat/idle${frameIndex}.png");
  static final emptyWheatFrames = List.generate(5, (frameIndex) => "assets/img/enclose_moose/wheat/animation_empty.png");

  List<String> getAnimationFrames({Random? random, bool returnAll = false}) {
    const basePath = "assets/img/enclose_moose/";

    switch (this) {
      case grass:
        return const [basePath + "grass/0_idle0.png"];
      case water:
        return const [basePath + "water/00000_idle0.png"];
      case wall:
        return List.generate(5, (frameIndex) => basePath + "wall/animation${frameIndex}.png");
      case portal:
        return const [basePath + "portal/idle0.png"];
      case cherry:
        return const [basePath + "cherry/idle0.png"];
      case apple:
        return List.generate(5, (frameIndex) => basePath + "apple/animation${frameIndex}.png");
      case bees:
        return const [basePath + "bees/idle0.png"];
      case moose:
        return const [basePath + "moose/idle0.png"];
    }
  }

  List<String> getIdleFrames({Random? random, bool returnAll = false, dynamic extra}) {
    final usedRandom = random ?? Random();
    const basePath = "assets/img/enclose_moose/";

    switch (this) {
      case grass:
        if (returnAll) {  // for preloading
          return const [
            basePath + "grass/0_idle0.png",
            basePath + "grass/1_idle0.png", basePath + "grass/1_idle1.png",
            basePath + "grass/2_idle0.png", basePath + "grass/2_idle1.png"
          ];
        }

        if (usedRandom.nextDouble() < 0.01) {
          return const [basePath + "grass/2_idle0.png", basePath + "grass/2_idle1.png"];
        }

        const grasses = [
          [basePath + "grass/0_idle0.png"],
          [basePath + "grass/1_idle0.png", basePath + "grass/1_idle1.png"]
        ];
        final grassFrames = grasses[usedRandom.nextInt(grasses.length)];

        return grassFrames;
      case water:
        if (returnAll) {
          List<String> waters = [];
          for (final i in List.generate(16, (index) => index)) {
            String binaryString = i.toRadixString(2);
            binaryString += List.generate(4 - binaryString.length, (i) => "0").join("");

            if (binaryString == "0000") {
              waters.addAll([
                basePath + "water/${binaryString}0_idle0.png",
                basePath + "water/${binaryString}1_idle0.png",
                basePath + "water/${binaryString}1_idle1.png",
                basePath + "water/${binaryString}2_idle0.png",
                basePath + "water/${binaryString}2_idle1.png"
              ]);
            } else {
              waters.addAll([
                basePath + "water/${binaryString}_idle0.png",
                basePath + "water/${binaryString}_idle1.png"
              ]);
            }
          }

          return waters;
        }

        final extraString = (extra as List<bool>).map((val) => val ? "1" : "0").join("");
        if (extraString == "0000") {
          if (usedRandom.nextDouble() < 0.01) {
            return [basePath + "water/${extraString}2_idle0.png", basePath + "water/${extraString}2_idle1.png"];
          }

          final waters = [
            [basePath + "water/${extraString}0_idle0.png"],
            [basePath + "water/${extraString}1_idle0.png", basePath + "water/${extraString}1_idle1.png"]
          ];
          return waters[usedRandom.nextInt(waters.length)];
        }

        return [
          basePath + "water/${extraString}_idle0.png",
          basePath + "water/${extraString}_idle1.png"
        ];
      case wall:
        return List.generate(2, (frameIndex) => basePath + "wall/idle${frameIndex}.png");
      case portal:
        return List.generate(4, (frameIndex) => basePath + "portal/idle${frameIndex}.png");
      case cherry:
        return List.generate(2, (frameIndex) => basePath + "cherry/idle${frameIndex}.png");
      case apple:
        return List.generate(2, (frameIndex) => basePath + "apple/idle${frameIndex}.png");
      case bees:
        return List.generate(2, (frameIndex) => basePath + "bees/idle${frameIndex}.png");
      case moose:
        return List.generate(2, (frameIndex) => basePath + "moose/idle${frameIndex}.png");
    }
  }

  int getBonusScore() {
    switch (this) {
      case cherry:
        return 3;
      case apple:
        return 10;
      case bees:
        return -5;
      default:
        return 0;
    }
  }
}

class EncloseGrid {
  final int wallBudget;
  late List<List<EncloseGridCellType>> fullGrid;
  late List<EncloseGridCellType> flatGrid;
  late final List<EncloseGridCellType> originalFlatGrid;
  late final Map<int, List<int>> portals;
  late final int gridWidth;
  late final int gridHeight;
  late final int mooseIndex;

  int wallsLeft = 0;
  Set<int>? enclosure;
  Map<int, int>? enclosureDistances;
  Map<int, int>? expandDistances;
  List<int>? escapePath;
  AxisDirection? escapeDirection;
  int? get score {
    if (enclosure == null) return null;

    var currentScore = enclosure!.length;
    for (final flatIndex in enclosure!) {
      currentScore += flatGrid[flatIndex].getBonusScore();
    }

    return currentScore;
  }

  EncloseGrid(String encodedGrid, this.wallBudget) {
    wallsLeft = wallBudget;

    fullGrid = [[]];
    flatGrid = [];

    portals = {};
    for (final character in encodedGrid.characters) {
      final flatIndex = flatGrid.length;

      if (character == "\n") {
        fullGrid.add([]);

        continue;
      }

      final type = EncloseGridCellType.fromString(character);
      fullGrid.last.add(type!);
      flatGrid.add(type);

      if (type == EncloseGridCellType.portal) {
        final portalNumber = int.parse(character);
        if (!portals.containsKey(portalNumber)) {
          portals[portalNumber] = [];
        }
        portals[portalNumber]!.add(flatIndex);

        // if (currentPortals.containsKey(portalNumber)) {
        //   portals[currentPortals[portalNumber]!] = flatIndex;
        //   portals[flatIndex] = currentPortals[portalNumber]!;
        // }
        // currentPortals[portalNumber] = flatIndex;
      }
      if (type == EncloseGridCellType.moose) {
        mooseIndex = flatIndex;
      }
    }

    originalFlatGrid = flatGrid;
    gridWidth = fullGrid[0].length;
    gridHeight = fullGrid.length;

    updateEnclosure();
  }

  void reset({bool doUpdate = true}) {
    for (final indexedGridCell in flatGrid.indexed) {
      if (indexedGridCell.$2 == EncloseGridCellType.wall) {
        toggleWall(indexedGridCell.$1, doUpdate: false);
      }
    }

    if (doUpdate) {
      updateEnclosure();
    }
  }

  bool toggleWall(int flatIndex, {bool doUpdate = true}) {
    if (flatGrid[flatIndex] != EncloseGridCellType.grass && flatGrid[flatIndex] != EncloseGridCellType.wall) return false;
    // final toggleResult = fullGrid[rowIndex][columnIndex] == EncloseGridCellType.wall ? EncloseGridCellType.grass : EncloseGridCellType.wall;

    // fullGrid[rowIndex][columnIndex] = toggleResult;
    // flatGrid[rowIndex * gridWidth + columnIndex] = toggleResult;
    EncloseGridCellType toggleResult;
    if (flatGrid[flatIndex] == EncloseGridCellType.grass) {
      if (wallsLeft <= 0) return false;

      wallsLeft--;
      toggleResult = EncloseGridCellType.wall;
    } else {
      wallsLeft++;
      toggleResult = EncloseGridCellType.grass;
    }

    fullGrid[flatIndex ~/ gridWidth][flatIndex % gridWidth] = toggleResult;
    flatGrid[flatIndex] = toggleResult;

    if (doUpdate) {
      updateEnclosure();
    }

    return true;
  }

  bool isOpen(int flatIndex) => flatGrid[flatIndex] != EncloseGridCellType.water && flatGrid[flatIndex] != EncloseGridCellType.wall;

  List<int> _getNeighbors(int flatIndex) {
    final rowIndex = flatIndex ~/ gridWidth;
    final columnIndex = flatIndex % gridWidth;

    List<int> neighbors = [];
    if (columnIndex != 0) {
      neighbors.add(flatIndex - 1);
    }
    if (columnIndex != gridWidth - 1) {
      neighbors.add(flatIndex + 1);
    }
    if (rowIndex != 0) {
      neighbors.add(flatIndex - gridWidth);
    }
    if (rowIndex != gridWidth - 1) {
      neighbors.add(flatIndex + gridWidth);
    }

    final portalNumber = getPortalIndex(flatIndex);
    if (portalNumber != null) {
      for (final index in portals[portalNumber]!) {
        if (index != flatIndex) {
          neighbors.add(index);
        }
      }
    }

    return neighbors;
  }

  void updateEnclosure() {
    // BFS from moosey.

    final Queue<int> queue = Queue();
    final Map<int, int> visited = {};
    final Map<int, int?> parentMap = {};

    queue.add(mooseIndex);
    visited[mooseIndex] = 0;
    parentMap[mooseIndex] = null;

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();

      for (final neighbor in _getNeighbors(current)) {
        final isVisited = visited.containsKey(neighbor);
        final isBlocked = flatGrid[neighbor] == EncloseGridCellType.water || flatGrid[neighbor] == EncloseGridCellType.wall;
        if (isVisited || isBlocked) continue;

        parentMap[neighbor] = current;
        visited[neighbor] = visited[current]! + 1;

        final rowIndex = neighbor ~/ gridWidth;
        final columnIndex = neighbor % gridWidth;

        final isEscapedDirectional = [rowIndex == 0, rowIndex == gridHeight - 1, columnIndex == 0, columnIndex == gridWidth - 1];
        final escapeDirectionIndex = isEscapedDirectional.indexOf(true);
        if (escapeDirectionIndex != -1) {
          List<int> backtrackPath = [];
          int? currentNode = neighbor;
          while (currentNode != null) {
            backtrackPath.add(currentNode);
            currentNode = parentMap[currentNode];
          }

          enclosure = null;
          enclosureDistances = null;
          escapePath = backtrackPath.reversed.toList();
          escapeDirection = [AxisDirection.up, AxisDirection.down, AxisDirection.left, AxisDirection.right][escapeDirectionIndex];
          expandDistances = null;

          return;
        }

        queue.add(neighbor);
      }
    }

    final oldEnclosure = enclosure;

    enclosure = visited.keys.toSet();
    enclosureDistances = {
      for (final key in enclosure!) key: visited[key]!
    };
    escapePath = null;
    escapeDirection = null;

    // final enclosureDifference = enclosure!.difference(oldEnclosure ?? {});
    if (oldEnclosure != null) {
      // Special case if the enclosure is expanded to make wheat start growing immediately (instead of waiting {distance to moose} frames to start)
      expandDistances = {};
      for (final key in enclosure!) {
        if (oldEnclosure.contains(key)) {
          expandDistances![key] = visited[key]!;
        } else {
          expandDistances![key] = 0;
          int currentNode = key;
          while (!oldEnclosure.contains(currentNode)) {
            expandDistances![key] = expandDistances![key]! + 1;
            currentNode = parentMap[currentNode]!;
          }
        }
      }
    }
  }

  int? getDistance(int flatIndex, {bool includeExpand = true}) {
    if (includeExpand) {
      return expandDistances?[flatIndex] ?? enclosureDistances?[flatIndex];
    }

    return enclosureDistances?[flatIndex];
    // final signedRowDistance = (mooseIndex % gridWidth - flatIndex % gridWidth);
    // final signedColumnDistance = ((mooseIndex - flatIndex) / gridWidth).toInt();

    // return signedRowDistance.abs() + signedColumnDistance.abs();
  }

  int? getMaxDistance() {
    return enclosureDistances?.values.reduce(max);
  }

  int? getPortalIndex(int flatIndex) {
    final portalIndex = portals.entries.firstWhere((e) => e.value.contains(flatIndex), orElse:() => MapEntry(-1, [])).key;
    if (portalIndex == -1) return null;

    return portalIndex;
  }

  Set<int> getWallIndices() {
    return flatGrid.indexed
      .where((indexedCell) => indexedCell.$2 == EncloseGridCellType.wall)
      .map((indexedCell) => indexedCell.$1)
      .toSet();
  }

  /*
  void _updateEscapePath() {
    // multi-BFS from all boundaries.

    Queue<int> queue = Queue();
    Set<int> visited = Set();
    Map<int, int?> parentMap = Map();

    for (int y = 0; y < gridHeight; y++) {
      final leftIndex = y * gridWidth;
      if (isOpen(leftIndex)) {
        queue.add(leftIndex);
        visited.add(leftIndex);
        parentMap[leftIndex] = null;
      }

      final rightIndex = y * gridWidth + gridWidth - 1;
      if (isOpen(rightIndex)) {
        queue.add(rightIndex);
        visited.add(rightIndex);
        parentMap[rightIndex] = null;
      }
    }
    for (int x = 0; x < gridWidth; x++) {
      final topIndex = x;
      if (isOpen(topIndex)) {
        queue.add(topIndex);
        visited.add(topIndex);
        parentMap[topIndex] = null;
      }

      final bottomIndex = (gridHeight - 1) * gridWidth + x;
      if (isOpen(bottomIndex)) {
        queue.add(bottomIndex);
        visited.add(bottomIndex);
        parentMap[bottomIndex] = null;
      }
    }

    final searchDirections = [
      -1,
      1,
      -gridWidth,
      gridWidth
    ];
    while (queue.isNotEmpty) {
      final current = queue.removeFirst();

      var neighbors = searchDirections.map((direction) => current + direction).toList();
      if (portals.containsKey(current)) {
        neighbors.add(portals[current]!);
      }
      for (final neighbor in neighbors) {
        final isVisited = visited.contains(neighbor);
        final isInvalid = neighbor < 0 || neighbor >= flatGrid.length;

        visited.add(neighbor);
        if (isVisited || isInvalid) continue;

        final ismoose = flatGrid[neighbor] == EncloseGridCellType.moose;
        if (ismoose) {
          List<int> reversePath = [neighbor];
          int? currentBacktrack = current;
          while (currentBacktrack != null) {
            reversePath.add(currentBacktrack);
            currentBacktrack = parentMap[currentBacktrack];
          }

          enclosed = null;
          solution = reversePath.reversed.toSet();

          return;
        }

        final isOpen = flatGrid[neighbor] != EncloseGridCellType.water && flatGrid[neighbor] != EncloseGridCellType.wall;
        if (isOpen) {
          parentMap[neighbor] = current;
          queue.add(neighbor);
        }
      }
    }

    enclosed = List.generate(flatGrid.length, (e) => e)
      .where((flatIndex) => !visited.contains(flatIndex))
      .where(isOpen)
      .toSet();
    solution = null;
  }
  */
}
