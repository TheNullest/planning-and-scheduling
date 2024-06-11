import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';

class CustomTabBarWidget extends StatefulWidget {
  final bool bottomBarDisplay;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  final TabController tabController;
  const CustomTabBarWidget({
    super.key,
    required this.tabController,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.isBottomIndicator = false,
    required this.bottomBarDisplay,
  });

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension myTheme =
        Provider.of<ThemeProvider>(context).myTheme(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: widget.bottomBarDisplay ? 60 : 0,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: myTheme.sectionColor,
        boxShadow: [
          BoxShadow(
            color: myTheme.backgroundColor,
            blurRadius: 15,
          ),
        ],
      ),
      child: TabBar(
        controller: widget.tabController,
        dividerHeight: widget.isBottomIndicator ? 1 : 0,
        padding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          border: widget.isBottomIndicator
              ? Border(
                  bottom: BorderSide(
                  color: myTheme.selectedTabColor,
                  width: 3,
                ))
              : Border(
                  top: BorderSide(
                    color: myTheme.selectedTabColor,
                    width: 3,
                  ),
                ),
        ),
        tabs: widget.icons
            .asMap()
            .map(
              (index, icon) => MapEntry(
                index,
                Tab(
                  icon: Icon(
                    shadows: index == widget.selectedIndex
                        ? [
                            Shadow(
                              color: myTheme.tabIconShadowColor,
                              offset: const Offset(0, 1),
                              blurRadius: 3,
                            ),
                          ]
                        : null,
                    icon,
                    color: index == widget.selectedIndex
                        ? myTheme.selectedTabColor
                        : myTheme.unSelectedTabColor,
                  ),
                ),
              ),
            )
            .values
            .toList(),
        onTap: (index) => widget.onTap(index),
      ),
    );
  }
}
