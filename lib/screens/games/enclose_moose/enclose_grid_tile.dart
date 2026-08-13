import "dart:math";
import "package:flutter/foundation.dart";

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

  static const wheatFrameDuration = Duration(milliseconds: 40);

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


class EncloseGridTile extends ChangeNotifier {
  EncloseGridTile({
    required this.index,
    required this.rowIndex,
    required this.columnIndex,
    required EncloseGridCellType type,
    this.portalIndex
  }) : _type = type;

  final int index;
  final int rowIndex;
  final int columnIndex;
  EncloseGridCellType _type;
  final int? portalIndex;

  bool _isEnclosed = false;
  // int? distance;
  // int? expandDistance;
  Duration? _waitTime;  // Don't really like these being properties of tile since they are really UI things
  Duration? _reverseWaitTime;

  EncloseGridCellType get type => _type;
  bool get isEnclosed => _isEnclosed;
  Duration? get waitTime => _waitTime;
  Duration? get reverseWaitTime => _reverseWaitTime;

  bool get isWall => _type == EncloseGridCellType.wall;
  bool get isWater => _type == EncloseGridCellType.water;
  bool get isGrass => _type == EncloseGridCellType.grass;
  bool get isPortal => _type == EncloseGridCellType.portal;
  bool get isMoose => _type == EncloseGridCellType.moose;
  bool get isBonus => _type == EncloseGridCellType.cherry || _type == EncloseGridCellType.apple || _type == EncloseGridCellType.bees;
  bool get isOpen => !(isWater || isWall);
  bool get canToggleWall => isGrass || isWall;

  /// Toggles wall/grass state directly on the tile object.
  void toggleWall({bool doUpdate = true}) {
    if (!canToggleWall) return;

    final newType = isGrass ? EncloseGridCellType.wall : EncloseGridCellType.grass;
    if (doUpdate) {
      update(newType: newType);
    }
  }

  void update({EncloseGridCellType? newType, bool? newIsEnclosed, Duration? newWaitTime, Duration? newReverseWaitTime}) {
    bool hasChanged = false;

    if (newType != null && newType != _type) {
      _type = newType;
      hasChanged = true;
    }

    if (newIsEnclosed != null && newIsEnclosed != _isEnclosed) {
      _isEnclosed = newIsEnclosed;
      hasChanged = true;
    }

    if (newWaitTime != _waitTime) {
      _waitTime = newWaitTime;
      hasChanged = true;
    }

    if (newReverseWaitTime != _reverseWaitTime) {
      _reverseWaitTime = newReverseWaitTime;
      hasChanged = true;
    }

    if (hasChanged) {
      notifyListeners(); // Triggers only the attached TileWidget!
    }
  }
}
