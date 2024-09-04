import 'dart:io';
import 'package:flutter/material.dart';

enum DevicePlatform { mobile, desktop }

enum DeviceSize { small, medium, large }

class ResponsiveHelper extends ChangeNotifier {
  static Size screenSize(BuildContext context) => MediaQuery.sizeOf(context);

  static double screenSizeHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  static double screenSizeWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  static double statusBarHeight = 0;

  static bool smallScreenSize(BuildContext context) =>
      screenSize(context).width < 500;

  static bool mediumScreenSize(BuildContext context) =>
      screenSize(context).width >= 500 && screenSize(context).width < 1000;

  static bool largeScreenSize(BuildContext context) =>
      screenSize(context).width > 1000;

  // may need it
  static DeviceSize currentDeviceSize(BuildContext context) =>
      smallScreenSize(context)
          ? DeviceSize.small
          : mediumScreenSize(context)
              ? DeviceSize.medium
              : DeviceSize.large;

  static bool isMobileDevice(BuildContext context) =>
      Platform.isAndroid || Platform.isIOS;
  static DevicePlatform currentDevicePlatform(BuildContext context) =>
      isMobileDevice(context) ? DevicePlatform.mobile : DevicePlatform.desktop;
}
