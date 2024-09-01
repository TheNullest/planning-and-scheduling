import 'package:flutter/material.dart';
import 'package:zamaan/utilities/themes/custom_theme_extension.dart';
import 'package:zamaan/views/settings_view.dart';

class CustomSliverAppBarWidget extends StatefulWidget {
  final CustomThemeExtension myTheme;
  final String viewTitle;
  final bool appBarDisplay;

  const CustomSliverAppBarWidget(
      {super.key,
      required this.myTheme,
      required this.viewTitle,
      required this.appBarDisplay});

  @override
  State<CustomSliverAppBarWidget> createState() =>
      _CustomSliverAppBarWidgetState();
}

class _CustomSliverAppBarWidgetState extends State<CustomSliverAppBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController headerAnimationController;
  late Animation<double> headerSizeAnimation;
  late bool appBarStateChanged = false;
  @override
  void initState() {
    headerAnimationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );

    headerSizeAnimation =
        Tween<double>(begin: 0, end: 50).animate(headerAnimationController)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (appBarStateChanged != widget.appBarDisplay) {
      widget.appBarDisplay
          ? headerAnimationController.forward()
          : headerAnimationController.reverse();
      appBarStateChanged = widget.appBarDisplay;
    }
    return SliverAppBar(
      // for removing the back button on the app bar
      automaticallyImplyLeading: false,
      backgroundColor: widget.myTheme.environmentColors.sectionBackgroundColor,
      scrolledUnderElevation: 15,
      leadingWidth: 100,

      leading: const Center(
        child: Text(
          'زمان',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      elevation: 5,
      surfaceTintColor: widget.myTheme.environmentColors.sectionBackgroundColor,
      shadowColor: widget.myTheme.environmentColors.sectionShadowColor,
      floating: true,
      toolbarHeight: headerSizeAnimation.value,
      primary: true,
      centerTitle: true,
      snap: true,
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsView())),
            ),
          ),
        )
      ],
      title: Text(
        widget.viewTitle,
        style:
            TextStyle(color: widget.myTheme.environmentColors.sectionTextColor),
      ),
    );
  }
}
