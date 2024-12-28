import 'dart:developer';

import 'package:blueferns_taskaju/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:page_transition/page_transition.dart';

class Helper {
  static GlobalKey? key = NavigationService.navigatorKey;
  static BuildContext? context = key!.currentContext!;

  //LOG --->
  static showLog(msg) //
      // {} // comment this for deactivate-log
      =>
      log('${(msg)} '); //uncomment this this for deactivate-log

  static void showException({required String scope, required String message}) =>
      showLog("Exception occured at $scope --> $message");
  static showToast({required msg}) {
    Fluttertoast.cancel(); // for immediate stopping
    return Fluttertoast.showToast(msg: msg);
  }
  //LOG <---

  //SIZE && SPACING --->
  static final width = MediaQuery.of(context!).size.width;
  static final height = MediaQuery.of(context!).size.height;
  static allowHeight(double height) => SizedBox(height: height);
  static allowWidth(double width) => SizedBox(width: width);
  //SIZE && SPACING <---

  //NAVIGATION --------->
  static push(dynamic route) {
    return Navigator.push(
      context!,
      PageTransition(
        duration: const Duration(milliseconds: 400),
        type: PageTransitionType.fade,
        isIos: true,
        child: route,
      ),
    );
  }

  static void pop([BuildContext? passedContext]) =>
      Navigator.pop(passedContext ?? context!);

  //NAVIGATION <---------

  //FEEDBACK --------->

  static Future<void> hapticSuccess() async =>
      await Haptics.vibrate(HapticsType.success);
  static Future<void> hapticWarning() async =>
      await Haptics.vibrate(HapticsType.warning);
  static Future<void> hapticerror() async =>
      await Haptics.vibrate(HapticsType.error);
  static Future<void> hapticlight() async =>
      await Haptics.vibrate(HapticsType.light);
  static Future<void> hapticmedium() async =>
      await Haptics.vibrate(HapticsType.medium);
  static Future<void> hapticheavy() async =>
      await Haptics.vibrate(HapticsType.heavy);
  static Future<void> hapticrigid() async =>
      await Haptics.vibrate(HapticsType.rigid);
  static Future<void> hapticsoft() async =>
      await Haptics.vibrate(HapticsType.soft);
  static Future<void> hapticselection() async =>
      await Haptics.vibrate(HapticsType.selection);

  //FEEDBACK <---------

  static shrink() => const SizedBox.shrink();
}
