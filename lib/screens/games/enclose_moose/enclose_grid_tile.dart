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
}


class EncloseGridTile extends ChangeNotifier {
  EncloseGridTile({
    required this.index,
    required this.rowIndex,
    required this.columnIndex,
    required EncloseGridCellType type,
    required this.bonusScore,
    this.portalIndex
  }) : _type = type;

  final int index;
  final int rowIndex;
  final int columnIndex;
  EncloseGridCellType _type;
  final int bonusScore;
  final int? portalIndex;

  bool _isEnclosed = false;
  // int? distance;
  // int? expandDistance;
  int? _waitFrames;  // Don't really like these being properties of tile since they are really UI things
  int? _reverseWaitFrames;

  EncloseGridCellType get type => _type;
  bool get isEnclosed => _isEnclosed;
  int? get waitFrames => _waitFrames;
  int? get reverseWaitFrames => _reverseWaitFrames;

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

  void update({EncloseGridCellType? newType, bool? newIsEnclosed, int? newWaitFrames, int? newReverseWaitFrames}) {
    bool hasChanged = false;

    if (newType != null && newType != _type) {
      _type = newType;
      hasChanged = true;
    }

    if (newIsEnclosed != null && newIsEnclosed != _isEnclosed) {
      _isEnclosed = newIsEnclosed;
      hasChanged = true;
    }

    if (newWaitFrames != _waitFrames) {
      _waitFrames = newWaitFrames;
      hasChanged = true;
    }

    if (newReverseWaitFrames != _reverseWaitFrames) {
      _reverseWaitFrames = newReverseWaitFrames;
      hasChanged = true;
    }

    if (hasChanged) {
      notifyListeners(); // Triggers only the attached TileWidget!
    }
  }
}
