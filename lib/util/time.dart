
import 'package:intl/intl.dart';

class Time{

  static DateTime local(DateTime time){
    return time.toLocal(); 
  }

  /// %d - day , %D - weekday, %mm - num Month, %M - month, %y - year
  ///  %h - hour, %m - min
  static String format(DateTime time, String formatString, {bool padded = false}){
    DateTime localTime = local(time);
    Map<String, Function> funcMap = {
      "%d": DateFormat('d').format, 
      "%dd": DateFormat('dd').format,
      "%D": DateFormat.EEEE('sv_SE').format,
      "%mm": DateFormat('MM').format,
      "%M": DateFormat.MMMM('sv_SE').format,
      "%y": DateFormat('yy').format, 
      "%Y": DateFormat('y').format, 
      "%h": DateFormat('HH').format, 
      "%m": DateFormat('mm').format,
    };
    for(String key in funcMap.keys) {
      formatString = formatString.replaceAll(key, funcMap[key]!(localTime));
    }
    return formatString; 
  }


}