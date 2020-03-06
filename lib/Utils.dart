import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Utils{
  static  showToast({String msg,Toast toastLength,ToastGravity gravity,int timeInSecForIos,Color backgroundColor,Color textColor,double fontSize}){
     Fluttertoast.showToast(
         msg: msg,
         toastLength: toastLength,
         gravity:gravity,
         timeInSecForIos: timeInSecForIos,
         backgroundColor:backgroundColor,
         textColor: textColor,
         fontSize: fontSize
     );
   }
}