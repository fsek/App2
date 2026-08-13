import "dart:math";
import "package:flutter/material.dart";
import "enclose_grid_tile.dart";
import "helper_widgets/animated_moose_grid_image.dart";
import "helper_widgets/wiggling_widget.dart";
import "helper_widgets/outlined_text.dart";
import "call_counter.dart";
import "asset_handler.dart";

class TileWidget extends StatelessWidget {
  TileWidget({
    super.key,
    required this.tile,
    required this.vsync,
    required this.idleController,
    required this.tileRandom,
    required this.onTap,
    this.portalFilter,
    this.neighboringWater,
    this.tooltipCallCounter
  });

  final EncloseGridTile tile;
  final TickerProvider vsync;
  final AnimationController idleController;
  final Random tileRandom;
  final VoidCallback onTap;
  final ColorFilter? portalFilter;
  final List<bool>? neighboringWater;
  final RestrictedCallCounter? tooltipCallCounter;

  late final idleFrames = AssetHandler.getIdleFrames(tile.type, random: tileRandom, extra: !tile.isWater ? null : neighboringWater);
  final wheatFrameDuration = Duration(milliseconds: 40);

  @override
  Widget build(BuildContext context) {
    final waitTime = tile.waitFrames == null ? null : wheatFrameDuration * tile.waitFrames!;
    final reverseWaitTime = tile.reverseWaitFrames == null ? null : wheatFrameDuration * tile.reverseWaitFrames!;

    return ListenableBuilder(
      listenable: tile,
      builder: (context, child) {
        return GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            children: [
              if (tile.isGrass)
                // Grass
                AnimatedMooseGridImage(
                  key: Key("grass"),  // keys needed because otherwise it would sometimes confuse them, leading to incorrect didUpdateWidget calls
                  frames: AssetHandler.getAnimationFrames(tile.type),
                  frameDuration: wheatFrameDuration,
                  vsync: vsync,
                  idleFrames: idleFrames,
                  idleController: idleController
                ),

              if (!tile.isWater)
                // Wheat
                AnimatedMooseGridImage(
                  key: Key("wheat"),
                  shouldAnimate: tile.isEnclosed,
                  frames: tile.isGrass ? AssetHandler.animationWheatFrames : AssetHandler.emptyWheatFrames,  // Would rather not animate emptyWheatFrames
                  vsync: vsync,
                  waitTime: waitTime,
                  reverseWaitTime: reverseWaitTime,
                  idleFrames: tile.isGrass ? AssetHandler.idleWheatFrames : AssetHandler.emptyWheatFrames,
                  idleController: idleController
                )
              else
                // Water
                AnimatedMooseGridImage(
                  key: Key("water"),
                  frames: AssetHandler.getAnimationFrames(tile.type),
                  frameDuration: wheatFrameDuration,
                  vsync: vsync,
                  idleFrames: idleFrames,
                  idleController: idleController
                ),

              // Wall
              AnimatedMooseGridImage(
                key: Key("wall"),
                shouldAnimate: tile.type == EncloseGridCellType.wall,
                frames: AssetHandler.getAnimationFrames(EncloseGridCellType.wall),
                vsync: vsync,
                reverseFrameDuration: const Duration(milliseconds: 20),
                idleFrames: AssetHandler.getIdleFrames(EncloseGridCellType.wall),
                idleController: idleController
              ),

              // Text(flatIndex.toString(), style: TextStyle(fontSize: 10)),

              // Text((_grid.getDistance(flatIndex) ?? -1).toString()),

              // Text(
              //   "${(tile.waitTime?.inMilliseconds ?? -1) ~/ 40}, ${(tile.reverseWaitTime?.inMilliseconds ?? -1) ~/ 40}",
              //   style: TextStyle(
              //     fontSize: 10
              //   )
              // ),

              // Portal
              if (tile.isPortal && portalFilter != null)
                ColorFiltered(
                  colorFilter: portalFilter!,
                  child: AnimatedMooseGridImage(
                    key: Key("portal"),
                    frames: AssetHandler.getAnimationFrames(tile.type),
                    vsync: vsync,
                    idleFrames: idleFrames,
                    idleController: idleController
                  )
                ),

              // Bonus (cherry, apple, bees)
              if (tile.isBonus)
                AnimatedMooseGridImage(
                  key: Key("bonus"),
                  frames: AssetHandler.getAnimationFrames(tile.type),
                  shouldAnimate: tile.isEnclosed,
                  vsync: vsync,
                  isAlwaysVisible: true,
                  frameDuration: wheatFrameDuration,  // To simplify, this is chosen so that the total duration is the same as for wheat
                  waitTime: waitTime,
                  reverseWaitTime: reverseWaitTime,
                  idleFrames: idleFrames,
                  idleController: idleController
                ),

              if (tile.isMoose)
                AnimatedMooseGridImage(
                  key: Key("moose"),
                  frames: AssetHandler.getAnimationFrames(tile.type),
                  frameDuration: wheatFrameDuration,
                  vsync: vsync,
                  idleFrames: idleFrames,
                  idleController: idleController
                ),

              // if (gridCell != EncloseGridCellType.grass && gridCell != EncloseGridCellType.wall && gridCell != EncloseGridCellType.portal && gridCell != EncloseGridCellType.apple)
              //   AnimatedMooseGridImage(
              //     frames: gridCell.getAnimationFrames(random: frameRandom),
              //     vsync: vsync,
              //     idleFrames: idleFrames,
              //     idleController: idleController
              //   ),

              // Tooltips
              if (tooltipCallCounter != null)
                Positioned(
                  top: -25,
                  child: ListenableBuilder(
                    listenable: tooltipCallCounter!,
                    builder: (context, child) {
                      if (!tooltipCallCounter!.exists()) return const SizedBox.shrink();

                      return AnimatedOpacity(
                        opacity: tooltipCallCounter!.isNotEmpty() ? 1 : 0,
                        duration: const Duration(milliseconds: 150),
                        onEnd: () {
                          tooltipCallCounter!.remove();
                        },
                        child: WigglingWidget(
                          controller: idleController,
                          child: OutlinedText(
                            text: tooltipCallCounter!.getValue()!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Schoolbell"
                            )
                          )
                        )
                      );
                    }
                  )
                )
            ]
          )
        );
      },
    );
  }
}
