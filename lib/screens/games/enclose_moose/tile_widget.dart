import "dart:math";
import "package:flutter/material.dart";
import "enclose_grid_tile.dart";
import "helper_widgets/animated_sprite.dart";
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
    return ListenableBuilder(
      listenable: tile,
      builder: (context, child) {
        final waitTime = tile.waitFrames == null ? null : wheatFrameDuration * tile.waitFrames!;
        final reverseWaitTime = tile.reverseWaitFrames == null ? null : wheatFrameDuration * tile.reverseWaitFrames!;

        return GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            children: [
              if (tile.isGrass)
                // Grass
                AnimatedSprite(
                  key: Key("grass"),  // keys needed because otherwise it would sometimes confuse them, leading to incorrect didUpdateWidget calls
                  vsync: vsync,
                  idleFrames: idleFrames,
                  idleController: idleController
                ),

              if (!tile.isWater)
                // Wheat
                AnimatedSprite(
                  key: Key("wheat"),
                  vsync: vsync,
                  shouldAnimate: tile.isEnclosed,
                  animationFrames: tile.isGrass ? AssetHandler.animationWheatFrames : AssetHandler.emptyWheatFrames,  // Would rather not animate emptyWheatFrames
                  animationFrameDuration: wheatFrameDuration,
                  animationWaitTime: waitTime,
                  animationReverseWaitTime: reverseWaitTime,
                  endIdleFrames: tile.isGrass ? AssetHandler.idleWheatFrames : AssetHandler.emptyWheatFrames,
                  idleController: idleController
                )
              else
                // Water
                AnimatedSprite(
                  key: Key("water"),
                  vsync: vsync,
                  idleFrames: idleFrames,
                  idleController: idleController
                ),

              // Wall
              AnimatedSprite(
                key: Key("wall"),
                vsync: vsync,
                shouldAnimate: tile.type == EncloseGridCellType.wall,
                animationFrames: AssetHandler.getAnimationFrames(EncloseGridCellType.wall),
                animationReverseFrameDuration: const Duration(milliseconds: 20),
                endIdleFrames: AssetHandler.getIdleFrames(EncloseGridCellType.wall),
                idleController: idleController
              ),

              // Text(flatIndex.toString(), style: TextStyle(fontSize: 10)),

              // Text((_grid.getDistance(flatIndex) ?? -1).toString()),

              // Text(
              //   "${tile.waitFrames}, ${tile.reverseWaitFrames}",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 10
              //   )
              // ),

              // Portal
              if (tile.isPortal && portalFilter != null)
                ColorFiltered(
                  colorFilter: portalFilter!,
                  child: AnimatedSprite(
                    key: Key("portal"),
                    vsync: vsync,
                    idleFrames: idleFrames,
                    idleController: idleController
                  )
                ),

              // Bonus (cherry, apple, bees)
              if (tile.isBonus)
                AnimatedSprite(
                  key: Key("bonus"),
                  vsync: vsync,
                  animationFrames: AssetHandler.getAnimationFrames(tile.type),
                  shouldAnimate: tile.isEnclosed,
                  animationFrameDuration: const Duration(milliseconds: 100),  // This means the total animation time is way longer than for wheat, which can lead to some weird looking behavior but worth it
                  animationWaitTime: waitTime,
                  animationReverseWaitTime: reverseWaitTime,
                  startIdleFrames: idleFrames,
                  endIdleFrames: AssetHandler.getAnimationFrames(.apple),
                  idleController: idleController
                ),

              if (tile.isMoose)
                AnimatedSprite(
                  key: Key("moose"),
                  vsync: vsync,
                  idleFrames: idleFrames,
                  idleController: idleController
                ),

              // if (gridCell != EncloseGridCellType.grass && gridCell != EncloseGridCellType.wall && gridCell != EncloseGridCellType.portal && gridCell != EncloseGridCellType.apple)
              //   AnimatedSprite(
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
