import 'package:flutter/material.dart';

class Utils {

  static kWidth(context) => MediaQuery.of(context).size.width;
  static kHeight(context) => MediaQuery.of(context).size.height;
  static kStatusBarHeight(context) => MediaQuery.of(context).viewPadding.top;
  static navigatePage(context, Widget page) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  static navigateBack(context) => Navigator.of(context).pop();

  static dateToReadable(String string) {
    DateTime dateTime = DateTime.parse(string);
    Duration dateDiff = DateTime.now().difference(dateTime);

    if (dateDiff.inDays > 365) {
      var year = dateDiff.inDays / 365;
      return '${year.toInt()} year(s) ago';
    } else if (dateDiff.inDays >= 1) {
      return '${dateDiff.inDays} day(s) ago';
    } else if (dateDiff.inHours >= 1) {
      return '${dateDiff.inHours} hour(s) ago';
    } else if (dateDiff.inMinutes >= 1) {
      return '${dateDiff.inMinutes} minutes(s) ago';
    } else {
      return '${dateDiff.inDays} day(s) ago';
    }
  }

}