import 'package:flutter/material.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/theme.service.dart';

import 'obstacle_def.dart';
import 'sprite.dart';

/// Simple toggle to switch between space and regular theme.
const bool spaceTheme = true;

const String _dir = "assets/img/moose_game/";

String _themed(String light, String dark) =>
    locator<ThemeService>().theme.brightness == Brightness.light ? light : dark;

Color? get backgroundColor =>
    spaceTheme ? const Color.fromRGBO(95, 84, 159, 1.0) : null;

/// How high above the ground the flying obstacles (the UFOs) hover.
/// Very specific number to give a tiny window for a jump to pass over the UFO.
const double flyingObstacleHeight = 1.89;

/// Wall guard protects against a stack of a ground obstacle and a flying obstacle
/// this double is the smallest arrival time difference between the two which is allowed
const double wallGuardSeconds = 0.4;

/// Native pixel size of each space moose frame. These have to match the actual
/// PNGs; see [_spaceMoose] for why they can't all just be 24x24.
const Map<String, List<double>> _spaceMooseFrames = {
  "hilbert_space_run_1": [27, 25],
  "hilbert_space_run_2": [27, 24],
  "hilbert_space_run_3": [27, 24],
  "hilbert_space_run_4": [27, 25],
  "hilbert_space_jump": [28, 32],
  "hilbert_space_fall": [27, 23],
};

/// The moose is drawn with BoxFit.scaleDown, which fits the whole image inside
/// the sprite box. Since frames have different pixel widths and heights, we
/// have to scale the image properly so that the moose doesn't shrink or grow between
/// frames or jump and fall.
const double _mooseFrameScale = 24 / 27; // the run frames are 27px wide

/// Nudge in pixelart pixels, centers the moose head and body when jumping
const Map<String, double> _spaceMooseNudge = {"hilbert_space_jump": 2};

Sprite _spaceMoose(String name) {
  final List<double> size = _spaceMooseFrames[name]!;
  return Sprite(
    "$_dir$name.png",
    size[0] * _mooseFrameScale,
    size[1] * _mooseFrameScale,
    (_spaceMooseNudge[name] ?? 0) * _mooseFrameScale,
  );
}

/// 4 frames, from 1..4
Sprite mooseRunSprite(int frame) => spaceTheme
    ? _spaceMoose("hilbert_space_run_$frame")
    : Sprite(
        _themed(
          "${_dir}hilbert_pixel_run_$frame.png",
          "${_dir}hilbert_pixel_run_${frame}_d.png",
        ),
        24,
        24,
      );

Sprite get mooseJumpSprite => spaceTheme
    ? _spaceMoose("hilbert_space_jump")
    : Sprite(
        _themed(
          "${_dir}hilbert_pixel_jump.png",
          "${_dir}hilbert_pixel_jump_d.png",
        ),
        24,
        24,
      );

Sprite get mooseFallSprite => spaceTheme
    ? _spaceMoose("hilbert_space_fall")
    : Sprite(
        _themed(
          "${_dir}hilbert_pixel_fall.png",
          "${_dir}hilbert_pixel_fall_d.png",
        ),
        24,
        24,
      );

Sprite get pickupSprite => spaceTheme
    ? Sprite("${_dir}o2_bottle.png", 10, 24)
    : Sprite(
        _themed("${_dir}hilbert_sandwich.png", "${_dir}hilbert_sandwich_d.png"),
        24,
        24,
      );

List<ObstacleDef> buildObstacles() => spaceTheme
    ? [
        ObstacleDef(Sprite("${_dir}galaxy.png", 19, 18, 2), 1.0),
        ObstacleDef(Sprite("${_dir}rocket.png", 21, 24), 1.0),
        ObstacleDef(Sprite("${_dir}antenna.png", 24, 24), 1.0),
        ObstacleDef(Sprite("${_dir}alien_voi_l.png", 15, 24), 0.4, 1.0, 2.0),
        ObstacleDef(Sprite("${_dir}alien_voi_r.png", 15, 24), 0.2, -1.0, -2.0),
        ObstacleDef(Sprite("${_dir}ufo_l.png", 24, 24), 0.2, 2.0, 4.0, true),
        ObstacleDef(Sprite("${_dir}ufo_r.png", 24, 24), 0.1, -2.0, -4.0, true),
      ]
    : [
        ObstacleDef(
          Sprite(_themed("${_dir}kiosk.png", "${_dir}kiosk_d.png"), 24, 24),
          1.0,
        ),
        ObstacleDef(
          Sprite(_themed("${_dir}v_nails.png", "${_dir}v_nails_d.png"), 24, 24),
          1.0,
        ),
        ObstacleDef(
          Sprite(
            _themed("${_dir}f_rubik_2.png", "${_dir}f_rubik_2_d.png"),
            24,
            24,
          ),
          1.0,
        ),
        ObstacleDef(
          Sprite(_themed("${_dir}bike_l.png", "${_dir}bike_l_d.png"), 24, 24),
          0.4,
          1.0,
          2.0,
        ),
        ObstacleDef(
          Sprite(_themed("${_dir}bike_r.png", "${_dir}bike_r_d.png"), 24, 24),
          0.2,
          -1.0,
          -2.0,
        ),
        ObstacleDef(
          Sprite(
            _themed("${_dir}scooter_l.png", "${_dir}scooter_l_d.png"),
            24,
            24,
          ),
          0.4,
          1.0,
          2.0,
        ),
        ObstacleDef(
          Sprite(
            _themed("${_dir}scooter_r.png", "${_dir}scooter_r_d.png"),
            24,
            24,
          ),
          0.2,
          -1.0,
          -2.0,
        ),
      ];
