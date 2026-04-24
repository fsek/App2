import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionHelper{
  static String buildName = "x.x.x";

  static void init(Function() onUpdate){
    if(!kIsWeb){
      PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
        buildName = packageInfo.version;
        onUpdate();
      });
    }
  }
}