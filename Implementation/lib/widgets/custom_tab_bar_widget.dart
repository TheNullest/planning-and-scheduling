import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';

class CustomTabBarWidget extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomTabBarWidget(
      {super.key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      this.isBottomIndicator = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final CustomThemeExtension myTheme = themeProvider.myTheme(context);
      return TabBar(
        dividerHeight: isBottomIndicator ? 1 : 0,
        padding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          border: isBottomIndicator
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
        tabs: icons
            .asMap()
            .map(
              (index, icon) => MapEntry(
                index,
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Tab(
                      icon: Icon(
                        shadows: index == selectedIndex
                            ? [
                                Shadow(
                                  color: myTheme.tabIconShadowColor,
                                  offset: const Offset(0, 1),
                                  blurRadius: 3,
                                ),
                              ]
                            : null,
                        icon,
                        color: index == selectedIndex
                            ? myTheme.selectedTabColor
                            : myTheme.unSelectedTabColor,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .values
            .toList(),
        onTap: onTap,
      );
    });
  }
}
