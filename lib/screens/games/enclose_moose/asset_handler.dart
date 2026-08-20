import "dart:math";
import "enclose_grid_tile.dart";

class AssetHandler {
  static const basePath = "assets/img/enclose_moose/";
  static final animationWheatFrames = List.generate(4, (frameIndex) => "${basePath}wheat/animation${frameIndex}.png");
  static final idleWheatFrames = List.generate(4, (frameIndex) => "${basePath}wheat/idle${frameIndex}.png");
  static final cornerIdleWaterFrames = List.generate(2, (frameIndex) => "${basePath}water/corner_idle${frameIndex}.png");  // Could implement a getOverlayFrames but currently it is only used for this anyway

  static List<String> getAllFrames() {
    List<String> frames = [];
    frames.addAll(animationWheatFrames);
    frames.addAll(idleWheatFrames);
    frames.addAll(cornerIdleWaterFrames);

    for (final type in EncloseGridCellType.values) {
      frames.addAll(getAnimationFrames(type, returnAll: true) ?? []);
      frames.addAll(getIdleFrames(type, returnAll: true) ?? []);
    }

    return frames;
  }

  static List<String>? getAnimationFrames(EncloseGridCellType type, {returnAll = false, dynamic extra}) {
    switch (type) {
      case EncloseGridCellType.grass:
        return null;

      case EncloseGridCellType.water:
        return null;

      case EncloseGridCellType.wall:
        return List.generate(4, (frameIndex) => "${basePath}wall/animation${frameIndex}.png");

      case EncloseGridCellType.portal:
        return null;

      case EncloseGridCellType.cherry:
        final List<String> cherryFrames = [];
        final isForward = (extra as bool?) ?? true;
        if (isForward || returnAll) {
          cherryFrames.addAll(List.generate(4, (frameIndex) => "${basePath}cherry/forward_animation${frameIndex}.png"));
        }
        if (!isForward || returnAll) {
          cherryFrames.addAll(List.generate(3, (frameIndex) => "${basePath}cherry/reverse_animation${frameIndex}.png").reversed.toList());
        }

        return cherryFrames;

      case EncloseGridCellType.apple:
        final List<String> appleFrames = [];
        final isForward = (extra as bool?) ?? true;
        if (isForward || returnAll) {
          appleFrames.addAll(List.generate(4, (frameIndex) => "${basePath}apple/forward_animation${frameIndex}.png"));
        }
        if (!isForward || returnAll) {
          appleFrames.addAll(List.generate(3, (frameIndex) => "${basePath}apple/reverse_animation${frameIndex}.png").reversed.toList());
        }

        return appleFrames;

      case EncloseGridCellType.bees:
        return List.generate(3, (frameIndex) => "${basePath}bees/animation${frameIndex}.png");

      case EncloseGridCellType.moose:
        return const ["${basePath}moose/idle0.png"];
    }
  }

 static List<String>? getIdleFrames(EncloseGridCellType type, {bool returnAll = false, dynamic extra}) {
    switch (type) {
      case EncloseGridCellType.grass:
        if (returnAll) {
          return const [
            "${basePath}grass/0_idle0.png",
            "${basePath}grass/1_idle0.png", "${basePath}grass/1_idle1.png",
            "${basePath}grass/2_idle0.png", "${basePath}grass/2_idle1.png"
          ];
        }

        final usedRandom = (extra as Random?) ?? Random();
        if (usedRandom.nextDouble() < 0.003) {
          return const ["${basePath}grass/2_idle0.png", "${basePath}grass/2_idle1.png"];
        }

        const grasses = [
          ["${basePath}grass/0_idle0.png"],
          ["${basePath}grass/1_idle0.png", "${basePath}grass/1_idle1.png"]
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
                "${basePath}water/${binaryString}0_idle0.png",
                "${basePath}water/${binaryString}1_idle0.png",
                "${basePath}water/${binaryString}1_idle1.png",
                "${basePath}water/${binaryString}2_idle0.png",
                "${basePath}water/${binaryString}2_idle1.png"
              ]);
            } else {
              waters.addAll([
                "${basePath}water/${binaryString}_idle0.png",
                "${basePath}water/${binaryString}_idle1.png"
              ]);
            }
          }

          return waters;
        }

        final castedExtra = extra as (Random, List<bool>);
        final usedRandom = castedExtra.$1;
        final usedNeighboringWater = castedExtra.$2;
        final slicedNeighboringWater = usedNeighboringWater.sublist(0, 4);

        final extraString = slicedNeighboringWater.map((val) => val ? "1" : "0").join("");
        if (extraString == "0000") {
          if (usedNeighboringWater.any((element) => element)) {
            return ["${basePath}water/${extraString}0_idle0.png"];
          }

          if (usedRandom.nextDouble() < 0.003) {
            return ["${basePath}water/${extraString}2_idle0.png", "${basePath}water/${extraString}2_idle1.png"];
          }

          final waters = [
            ["${basePath}water/${extraString}0_idle0.png"],
            ["${basePath}water/${extraString}1_idle0.png", "${basePath}water/${extraString}1_idle1.png"]
          ];
          return waters[usedRandom.nextInt(waters.length)];
        }

        return [
          "${basePath}water/${extraString}_idle0.png",
          "${basePath}water/${extraString}_idle1.png"
        ];

      case EncloseGridCellType.wall:
        return const ["${basePath}wall/idle0.png"];

      case EncloseGridCellType.portal:
        return List.generate(4, (frameIndex) => "${basePath}portal/idle${frameIndex}.png");

      case EncloseGridCellType.cherry:
        final List<String> cherryFrames = [];
        final isStart = (extra as bool?) ?? true;
        if (isStart || returnAll) {
          cherryFrames.addAll(List.generate(2, (frameIndex) => "${basePath}cherry/start_idle${frameIndex}.png"));
        }
        if (!isStart || returnAll) {
          cherryFrames.addAll(List.generate(2, (frameIndex) => "${basePath}cherry/end_idle${frameIndex}.png"));
        }

        return cherryFrames;

      case EncloseGridCellType.apple:
        final List<String> appleFrames = [];
        final isStart = (extra as bool?) ?? true;
        if (isStart || returnAll) {
          appleFrames.addAll(List.generate(2, (frameIndex) => "${basePath}apple/start_idle${frameIndex}.png"));
        }
        if (!isStart || returnAll) {
          appleFrames.addAll(List.generate(2, (frameIndex) => "${basePath}apple/end_idle${frameIndex}.png"));
        }

        return appleFrames;

      case EncloseGridCellType.bees:
        final List<String> beeFrames = [];
        final isStart = (extra as bool?) ?? true;
        if (isStart || returnAll) {
          beeFrames.addAll(List.generate(2, (frameIndex) => "${basePath}bees/start_idle${frameIndex}.png"));
        }
        if (!isStart || returnAll) {
          beeFrames.addAll(List.generate(2, (frameIndex) => "${basePath}bees/end_idle${frameIndex}.png"));
        }

        return beeFrames;

      case EncloseGridCellType.moose:
        return List.generate(2, (frameIndex) => "${basePath}moose/idle${frameIndex}.png");
    }
  }
}
