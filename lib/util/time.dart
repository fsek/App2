import 'package:intl/intl.dart';

class Time{

  static DateTime local(DateTime time){
    return time.toLocal(); 
  }
  
  static String ddmm(DateTime time){
    DateTime localTime = local(time);
    return DateFormat.Md('sv_SV').format(localTime);  
  }


}