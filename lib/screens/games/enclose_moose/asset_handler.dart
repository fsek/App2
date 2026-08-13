import "dart:math";
import "enclose_grid_tile.dart";

class AssetHandler {
  static final animationWheatFrames = List.generate(5, (frameIndex) => "assets/img/enclose_moose/wheat/animation${frameIndex}.png");
  static final idleWheatFrames = List.generate(4, (frameIndex) => "assets/img/enclose_moose/wheat/idle${frameIndex}.png");
  static final emptyWheatFrames = List.generate(5, (frameIndex) => "assets/img/enclose_moose/wheat/animation_empty.png");  // Don't love this not being a single frame but needed for timing

  static List<String> getAllFrames() {
    List<String> frames = [];
    frames.addAll(animationWheatFrames);
    frames.addAll(idleWheatFrames);
    frames.addAll(emptyWheatFrames);

    for (final type in EncloseGridCellType.values) {
      frames.addAll(getAnimationFrames(type, returnAll: true));
      frames.addAll(getIdleFrames(type, returnAll: true));
    }

    return frames;
  }

  static List<String> getAnimationFrames(EncloseGridCellType type, {Random? random, bool returnAll = false}) {
    const basePath = "assets/img/enclose_moose/";

    switch (type) {
      case EncloseGridCellType.grass:
        return const [basePath + "grass/0_idle0.png"];
      case EncloseGridCellType.water:
        return const [basePath + "water/00000_idle0.png"];
      case EncloseGridCellType.wall:
        return List.generate(5, (frameIndex) => basePath + "wall/animation${frameIndex}.png");
      case EncloseGridCellType.portal:
        return const [basePath + "portal/idle0.png"];
      case EncloseGridCellType.cherry:
        return const [basePath + "cherry/idle0.png"];
      case EncloseGridCellType.apple:
        return List.generate(5, (frameIndex) => basePath + "apple/animation${frameIndex}.png");
      case EncloseGridCellType.bees:
        return const [basePath + "bees/idle0.png"];
      case EncloseGridCellType.moose:
        return const [basePath + "moose/idle0.png"];
    }
  }

 static List<String> getIdleFrames(EncloseGridCellType type, {Random? random, bool returnAll = false, dynamic extra}) {
    final usedRandom = random ?? Random();
    const basePath = "assets/img/enclose_moose/";

    switch (type) {
      case EncloseGridCellType.grass:
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
      case EncloseGridCellType.water:
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
      case EncloseGridCellType.wall:
        return List.generate(2, (frameIndex) => basePath + "wall/idle${frameIndex}.png");
      case EncloseGridCellType.portal:
        return List.generate(4, (frameIndex) => basePath + "portal/idle${frameIndex}.png");
      case EncloseGridCellType.cherry:
        return List.generate(2, (frameIndex) => basePath + "cherry/idle${frameIndex}.png");
      case EncloseGridCellType.apple:
        return List.generate(2, (frameIndex) => basePath + "apple/idle${frameIndex}.png");
      case EncloseGridCellType.bees:
        return List.generate(2, (frameIndex) => basePath + "bees/idle${frameIndex}.png");
      case EncloseGridCellType.moose:
        return List.generate(2, (frameIndex) => basePath + "moose/idle${frameIndex}.png");
    }
  }
}
