import "dart:math";
import "enclose_grid_tile.dart";

class AssetHandler {
  static const baseImgPath = "assets/img/enclose_moose/";
  static const baseAudioPath = "audio/enclose_moose/";  // why should this not have "assets/" in front? Because it is used with assetSource later maybe?

  static final animationWheatFrames = List.generate(4, (frameIndex) => "${baseImgPath}wheat/animation${frameIndex}.png");
  static final idleWheatFrames = List.generate(4, (frameIndex) => "${baseImgPath}wheat/idle${frameIndex}.png");
  static final cornerIdleWaterFrames = List.generate(2, (frameIndex) => "${baseImgPath}water/corner_idle${frameIndex}.png");  // Could implement a getOverlayFrames but currently it is only used for this anyway

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
        return List.generate(4, (frameIndex) => "${baseImgPath}wall/animation${frameIndex}.png");

      case EncloseGridCellType.portal:
        return null;

      case EncloseGridCellType.cherry:
        final List<String> cherryFrames = [];
        final isForward = (extra as bool?) ?? true;
        if (isForward || returnAll) {
          cherryFrames.addAll(List.generate(4, (frameIndex) => "${baseImgPath}cherry/forward_animation${frameIndex}.png"));
        }
        if (!isForward || returnAll) {
          cherryFrames.addAll(List.generate(3, (frameIndex) => "${baseImgPath}cherry/reverse_animation${frameIndex}.png").reversed.toList());
        }

        return cherryFrames;

      case EncloseGridCellType.apple:
        final List<String> appleFrames = [];
        final isForward = (extra as bool?) ?? true;
        if (isForward || returnAll) {
          appleFrames.addAll(List.generate(4, (frameIndex) => "${baseImgPath}apple/forward_animation${frameIndex}.png"));
        }
        if (!isForward || returnAll) {
          appleFrames.addAll(List.generate(3, (frameIndex) => "${baseImgPath}apple/reverse_animation${frameIndex}.png").reversed.toList());
        }

        return appleFrames;

      case EncloseGridCellType.bees:
        return List.generate(3, (frameIndex) => "${baseImgPath}bees/animation${frameIndex}.png");

      case EncloseGridCellType.moose:
        return [];  // needs to be empty and not null to allow for seperate start and end idles.
    }
  }

 static List<String>? getIdleFrames(EncloseGridCellType type, {bool returnAll = false, dynamic extra}) {
    switch (type) {
      case EncloseGridCellType.grass:
        if (returnAll) {
          return const [
            "${baseImgPath}grass/0_idle0.png",
            "${baseImgPath}grass/1_idle0.png", "${baseImgPath}grass/1_idle1.png",
            "${baseImgPath}grass/2_idle0.png", "${baseImgPath}grass/2_idle1.png"
          ];
        }

        final usedRandom = (extra as Random?) ?? Random();
        if (usedRandom.nextDouble() < 0.003) {
          return const ["${baseImgPath}grass/2_idle0.png", "${baseImgPath}grass/2_idle1.png"];
        }

        const grasses = [
          ["${baseImgPath}grass/0_idle0.png"],
          ["${baseImgPath}grass/1_idle0.png", "${baseImgPath}grass/1_idle1.png"]
        ];
        final grassFrames = grasses[usedRandom.nextInt(grasses.length)];

        return grassFrames;

      case EncloseGridCellType.water:
        if (returnAll) {
          List<String> waters = [];
          for (final i in List.generate(16, (index) => index)) {
            final binaryString = i.toRadixString(2).padLeft(4, "0");

            if (binaryString == "0000") {
              waters.addAll([
                "${baseImgPath}water/${binaryString}0_idle0.png",
                "${baseImgPath}water/${binaryString}1_idle0.png",
                "${baseImgPath}water/${binaryString}1_idle1.png",
                "${baseImgPath}water/${binaryString}2_idle0.png",
                "${baseImgPath}water/${binaryString}2_idle1.png"
              ]);
            } else {
              waters.addAll([
                "${baseImgPath}water/${binaryString}_idle0.png",
                "${baseImgPath}water/${binaryString}_idle1.png"
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
            return ["${baseImgPath}water/${extraString}0_idle0.png"];
          }

          if (usedRandom.nextDouble() < 0.003) {
            return ["${baseImgPath}water/${extraString}2_idle0.png", "${baseImgPath}water/${extraString}2_idle1.png"];
          }

          final waters = [
            ["${baseImgPath}water/${extraString}0_idle0.png"],
            ["${baseImgPath}water/${extraString}1_idle0.png", "${baseImgPath}water/${extraString}1_idle1.png"]
          ];
          return waters[usedRandom.nextInt(waters.length)];
        }

        return [
          "${baseImgPath}water/${extraString}_idle0.png",
          "${baseImgPath}water/${extraString}_idle1.png"
        ];

      case EncloseGridCellType.wall:
        return const ["${baseImgPath}wall/idle0.png"];

      case EncloseGridCellType.portal:
        return List.generate(4, (frameIndex) => "${baseImgPath}portal/idle${frameIndex}.png");

      case EncloseGridCellType.cherry:
        final List<String> cherryFrames = [];
        final isStart = (extra as bool?) ?? true;
        if (isStart || returnAll) {
          cherryFrames.addAll(List.generate(2, (frameIndex) => "${baseImgPath}cherry/start_idle${frameIndex}.png"));
        }
        if (!isStart || returnAll) {
          cherryFrames.addAll(List.generate(2, (frameIndex) => "${baseImgPath}cherry/end_idle${frameIndex}.png"));
        }

        return cherryFrames;

      case EncloseGridCellType.apple:
        final List<String> appleFrames = [];
        final isStart = (extra as bool?) ?? true;
        if (isStart || returnAll) {
          appleFrames.addAll(List.generate(2, (frameIndex) => "${baseImgPath}apple/start_idle${frameIndex}.png"));
        }
        if (!isStart || returnAll) {
          appleFrames.addAll(List.generate(2, (frameIndex) => "${baseImgPath}apple/end_idle${frameIndex}.png"));
        }

        return appleFrames;

      case EncloseGridCellType.bees:
        final List<String> beeFrames = [];
        final isStart = (extra as bool?) ?? true;
        if (isStart || returnAll) {
          beeFrames.addAll(List.generate(2, (frameIndex) => "${baseImgPath}bees/start_idle${frameIndex}.png"));
        }
        if (!isStart || returnAll) {
          beeFrames.addAll(List.generate(2, (frameIndex) => "${baseImgPath}bees/end_idle${frameIndex}.png"));
        }

        return beeFrames;

      case EncloseGridCellType.moose:
      final List<String> mooseFrames = [];
        final isStart = (extra as bool?) ?? true;
        if (isStart || returnAll) {
          mooseFrames.addAll(List.generate(2, (frameIndex) => "${baseImgPath}moose/start_idle${frameIndex}.png"));
        }
        if (!isStart || returnAll) {
          mooseFrames.addAll(List.generate(2, (frameIndex) => "${baseImgPath}moose/end_idle${frameIndex}.png"));
        }

        return mooseFrames;
    }
  }

  static (String, String) getMooseVoiceline(bool isEnclosed, {Random? random}) {
    final usedRandom = random ?? Random();

    if (usedRandom.nextDouble() < 0.01) {
      return ("Testinspelning. Test, testing, testing!", "${baseAudioPath}test.mp3");
    }

    const freedVoicelines = [
      ("I love being a moose, and being free!", "${baseAudioPath}being_a_moose_and_being_free.mp3"),
      ("Moohoho... I can escape thiiis wayyyyy", "${baseAudioPath}escape_this_way_2.mp3"),
      ("Moohoho... I can escape this way", "${baseAudioPath}escape_this_way_3.mp3"),
      ("Moo... I can escape this waaayy", "${baseAudioPath}escape_this_way_4.mp3"),
      ("I can escape this wayyy", "${baseAudioPath}escape_this_way.mp3"),
      ("I love being free, because I'm a moose! Moo moo", "${baseAudioPath}free_because_im_a_moose.mp3"),
      ("Goodbye! Mooo", "${baseAudioPath}goodbye_moo.mp3"),
      ("I'm a mooooose", "${baseAudioPath}im_a_moose_2.mp3"),
      ("I'm a moose. Moo!", "${baseAudioPath}im_a_moose_3.mp3"),
      ("Moo! I'm a moose", "${baseAudioPath}im_a_moose_4.mp3"),
      ("Moo moo, I'm a moose!", "${baseAudioPath}im_a_moose_5.mp3"),
      ("I'm a moose!", "${baseAudioPath}im_a_moose.mp3"),
      ("I'm freeeee!", "${baseAudioPath}im_free_2.mp3"),
      ("I'm freeeee! Mooooo", "${baseAudioPath}im_free.mp3"),
      ("I'm moosing it!", "${baseAudioPath}moosing_it.mp3"),
      ("Iiit's moosing tiiime!", "${baseAudioPath}moosing_time.mp3"),
      ("Moo! You will never catch me", "${baseAudioPath}never_catch_me.mp3"),
      ("You will never be able to enclose ME!", "${baseAudioPath}never_be_able_to_enclose_me.mp3"),
      ("I'm out of here!", "${baseAudioPath}out_of_here.mp3"),
      ("Moo! I'll sneak away like sooo...", "${baseAudioPath}sneak_away_like_so_2.mp3"),
      ("I'll sneak away like sooo... Moohoho", "${baseAudioPath}sneak_away_like_so_3.mp3"),
      ("Moo! I'll sneak away like sooo...", "${baseAudioPath}sneak_away_like_so_4.mp3"),
      ("I'll sneak away like sooo...", "${baseAudioPath}sneak_away_like_so_5.mp3"),
      ("I'll sneak away like sooo... Moohoho", "${baseAudioPath}sneak_away_like_so.mp3"),
      ("I'll sneak away like sooo... Moohoho", "${baseAudioPath}sneak_away_like_so.mp3"),
      ("I will first go THIS way and then I will go THAT way and then I'm free!", "${baseAudioPath}this_way_that_way_2.mp3"),
      ("I will go THIS way and then I will go THAT way and then I will be free!", "${baseAudioPath}this_way_that_way.mp3"),
      ("You can't enclose me, I'm a moose!", "${baseAudioPath}you_cant_enclose_me.mp3")
    ];
    const enclosedVoicelines = [
      ("Moo... I don't want to be enclosed... Moo... );", "${baseAudioPath}dont_want_to_be_enclosed.mp3"),
      ("I just want to be free... Like a moose!", "${baseAudioPath}free_like_a_moose.mp3"),
      ("I want to hang out with the other mooses", "${baseAudioPath}hang_out_with_the_others.mp3"),
      ("Moo... I have been enclosed. Oh no );", "${baseAudioPath}have_been_enclosed.mp3"),
      ("Moohoho... I just want to be free. Why won't you let me? );", "${baseAudioPath}just_want_to_be_free.mp3"),
      ("Why won't you let me be free? Moooo );", "${baseAudioPath}let_me_be_free.mp3"),
      ("Why won't you let me be go?", "${baseAudioPath}let_me_go.mp3"),
      ("Moo );", "${baseAudioPath}moo_sad_2.mp3"),
      ("Moo );", "${baseAudioPath}moo_sad.mp3"),
      ("I moost be free", "${baseAudioPath}moost_be_free.mp3"),
      ("Why moost this happen to me?", "${baseAudioPath}moost_this_happen.mp3"),
      ("Why moost you do this to me?", "${baseAudioPath}moost_you_do_this.mp3"),
      ("Why must I be enclosed like this?", "${baseAudioPath}must_i_be_enclosed.mp3"),
      ("A moose is not supposed to be enclosed. A moose is supposed to be free. Free me... Mooo", "${baseAudioPath}not_supposed_to_be_enclosed.mp3"),
      ("I want to be freee );", "${baseAudioPath}want_to_be_free.mp3"),
      ("Moo, you enclosed me );", "${baseAudioPath}you_enclosed_me.mp3"),
    ];

    final possibleVoicelines = isEnclosed ? enclosedVoicelines : freedVoicelines;
    final chosenVoiceline = possibleVoicelines[usedRandom.nextInt(possibleVoicelines.length)];

    return chosenVoiceline;
  }
}
