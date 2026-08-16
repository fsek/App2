import "dart:collection";
import "dart:math";
import "package:flutter/material.dart";
import "enclose_grid_tile.dart";

class EncloseGrid extends ChangeNotifier {
  final int wallBudget;
  late List<EncloseGridTile> flatGrid;
  late final Map<int, List<EncloseGridTile>> portals;
  late final int gridWidth;
  late final int gridHeight;
  late final EncloseGridTile mooseTile;

  int wallsLeft = 0;
  int? score;
  List<EncloseGridTile>? escapePath;
  AxisDirection? escapeDirection;

  EncloseGrid(String encodedGrid, this.wallBudget) {
    wallsLeft = wallBudget;

    const bonusScoreDict = {
      EncloseGridCellType.cherry: 3,
      EncloseGridCellType.apple: 10,
      EncloseGridCellType.bees: -5
    };

    final gridString = encodedGrid.replaceAll("\n", "");
    gridWidth = encodedGrid.indexOf("\n");
    gridHeight = gridString.length ~/ gridWidth;

    // fullGrid = [[]];
    flatGrid = [];
    portals = {};
    for (final character in gridString.characters) {
      final flatIndex = flatGrid.length;

      final type = EncloseGridCellType.fromString(character);
      final portalIndex = type != EncloseGridCellType.portal ? null : int.parse(character);
      final tile = EncloseGridTile(
        index: flatIndex,
        rowIndex: flatIndex ~/ gridWidth,
        columnIndex: flatIndex % gridWidth,
        type: type ?? EncloseGridCellType.grass,
        bonusScore: bonusScoreDict[type] ?? 0,
        portalIndex: portalIndex
      );
      flatGrid.add(tile);

      if (type == EncloseGridCellType.portal) {
        if (!portals.containsKey(portalIndex!)) {
          portals[portalIndex] = [];
        }
        portals[portalIndex]!.add(tile);
      }
      if (type == EncloseGridCellType.moose) {
        mooseTile = tile;
      }
    }

    updateEnclosure();
  }

  void toggleWall(EncloseGridTile tile, {bool doUpdate = true}) {
    if (!tile.canToggleWall) return;

    if (tile.isGrass) {
      if (wallsLeft == 0) return;

      tile.toggleWall();
      wallsLeft -= 1;
    } else {
      tile.toggleWall();
      wallsLeft += 1;
    }

    if (doUpdate) {
      updateEnclosure();
    }
  }

  void reset({bool doUpdate = true}) {
    wallsLeft = wallBudget;

    for (final wallIndex in getWallIndices()) {
      final tile = flatGrid[wallIndex];
      tile.toggleWall();
    }

    if (doUpdate) {
      updateEnclosure();
    }
  }

  Set<AxisDirection> getEscapeDirections(EncloseGridTile tile) {
    final Set<AxisDirection> escapeDirections = {};
    if (tile.columnIndex == 0) {
      escapeDirections.add(AxisDirection.left);
    }
    if (tile.rowIndex == 0) {
      escapeDirections.add(AxisDirection.up);
    }
    if (tile.columnIndex == gridWidth - 1) {
      escapeDirections.add(AxisDirection.right);
    }
    if (tile.rowIndex == gridHeight - 1) {
      escapeDirections.add(AxisDirection.down);
    }

    return escapeDirections;
  }

  EncloseGridTile? getDirectionalNeighbor(EncloseGridTile tile, AxisDirection direction) {
    final escapeDirections = getEscapeDirections(tile);
    if (escapeDirections.contains(direction)) {
      return null;
    }

    if (direction == AxisDirection.left) {
      return flatGrid[tile.index - 1];
    }
    if (direction == AxisDirection.up) {
      return flatGrid[tile.index - gridWidth];
    }
    if (direction == AxisDirection.right) {
      return flatGrid[tile.index + 1];
    }
    if (direction == AxisDirection.down) {
      return flatGrid[tile.index + gridWidth];
    }

    return null;
  }

  Set<EncloseGridTile> getNeighbors(EncloseGridTile tile) {
    final Set<EncloseGridTile> neighbors = {
      getDirectionalNeighbor(tile, AxisDirection.left),
      getDirectionalNeighbor(tile, AxisDirection.up),
      getDirectionalNeighbor(tile, AxisDirection.right),
      getDirectionalNeighbor(tile, AxisDirection.down)
    }.nonNulls.toSet();

    if (tile.isPortal) {
      for (final portalTile in portals[tile.portalIndex!]!) {
        if (portalTile.index != tile.index) {
          neighbors.add(portalTile);
        }
      }
    }

    return neighbors;
  }

  void updateEnclosure() {
    // BFS from moosey.

    final oldEnclosure = getEnclosure();

    final Queue<EncloseGridTile> queue = Queue();
    final Map<EncloseGridTile, int> visited = {};
    final Map<EncloseGridTile, EncloseGridTile?> parentMap = {};

    queue.add(mooseTile);
    visited[mooseTile] = 0;
    parentMap[mooseTile] = null;

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();

      for (final neighbor in getNeighbors(current)) {
        final isVisited = visited.containsKey(neighbor);
        if (isVisited || !neighbor.isOpen) continue;

        parentMap[neighbor] = current;
        visited[neighbor] = visited[current]! + 1;

        final neighborEscapeDirections = getEscapeDirections(neighbor);
        if (neighborEscapeDirections.isNotEmpty) {
          List<EncloseGridTile> backtrackPath = [];
          EncloseGridTile? currentNode = neighbor;
          while (currentNode != null) {
            backtrackPath.add(currentNode);
            currentNode = parentMap[currentNode];
          }

          escapePath = backtrackPath.reversed.toList();
          escapeDirection = neighborEscapeDirections.first;
          score = null;
          for (final EncloseGridTile tile in oldEnclosure ?? {}) {
            tile.update(
              newIsEnclosed: false,
              newWaitFrames: null,
              newReverseWaitFrames: null
            );
          }
          notifyListeners();

          return;
        }

        queue.add(neighbor);
      }
    }

    final enclosure = visited.keys.toSet();
    final enclosureDistances = {
      for (final key in enclosure) key: visited[key]!
    };

    escapePath = null;
    escapeDirection = null;

    var currentScore = enclosure.length;
    for (final tile in enclosure) {
      currentScore += tile.bonusScore;
    }
    score = currentScore;

    Map<EncloseGridTile, int>? expandDistances;
    if (oldEnclosure != null) {
      // Special case if the enclosure is expanded to make wheat start growing immediately (instead of waiting {distance to moose} frames to start)
      expandDistances = {};
      for (final key in enclosure) {
        if (oldEnclosure.contains(key)) {
          expandDistances[key] = visited[key]!;
        } else {
          expandDistances[key] = 0;
          EncloseGridTile currentNode = key;
          while (!oldEnclosure.contains(currentNode)) {
            expandDistances[key] = expandDistances[key]! + 1;
            currentNode = parentMap[currentNode]!;
          }
        }
      }
    }

    final maxDistance = enclosureDistances.values.reduce(max);
    final affectedTiles = enclosure.difference(oldEnclosure ?? {}).union(oldEnclosure?.difference(enclosure) ?? {});
    for (final tile in affectedTiles) {
      final distance = enclosureDistances[tile];
      final expandDistance = expandDistances?[tile] ?? distance;

      tile.update(
        newIsEnclosed: enclosure.contains(tile),
        newWaitFrames: expandDistance == null ? null : expandDistance.toDouble(),  // Could multiply these to change spread speed
        newReverseWaitFrames: distance == null ? null : (maxDistance - distance).toDouble()
      );
    }

    notifyListeners();
  }

  Set<int> getWallIndices() {
    return flatGrid
      .where((tile) => tile.isWall)
      .map((tile) => tile.index)
      .toSet();
  }

  Set<EncloseGridTile>? getEnclosure() {
    if (escapePath != null || score == null) return null;

    return flatGrid
      .where((tile) => tile.isEnclosed)
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
