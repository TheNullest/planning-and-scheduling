import 'package:flutter/material.dart';

enum Device { mobile, tablet, desktop }

class ResponsiveHelper extends StatelessWidget {
  final Widget mobileView;
  final Widget tabletView;
  final Widget desktopView;

  const ResponsiveHelper(
      {super.key,
      required this.mobileView,
      required this.tabletView,
      required this.desktopView});

  static Size screenSize(BuildContext context) => MediaQuery.sizeOf(context);

  static double screenSizeHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  static double screenSizeWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  static late double screenUsbaleSize;

  static double screenUsableSize() => screenUsbaleSize;

  static bool isMobile(BuildContext context) => screenSize(context).width < 500;

  static bool isTablet(BuildContext context) =>
      screenSize(context).width >= 500 && screenSize(context).width < 1000;

  static bool isDesktop(BuildContext context) =>
      screenSize(context).width >= 1000;

  // may need it
  static Device currentDevice(BuildContext context) => isMobile(context)
      ? Device.mobile
      : isTablet(context)
          ? Device.tablet
          : Device.desktop;

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? mobileView
        : isTablet(context)
            ? tabletView
            : desktopView;
  }
}
