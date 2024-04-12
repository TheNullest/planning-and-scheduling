import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomTabBar(
      {super.key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      this.isBottomIndicator = false});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: isBottomIndicator ? 1 : 0,
      padding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isBottomIndicator
            ? Border(
                bottom: BorderSide(
                color: Theme.of(context).colorScheme.surfaceTint,
                width: 3,
              ))
            : Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.surfaceTint,
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                                offset: const Offset(0, 1),
                                blurRadius: 3,
                              ),
                            ]
                          : null,
                      icon,
                      color: index == selectedIndex
                          ? Theme.of(context).colorScheme.surfaceTint
                          : Theme.of(context).colorScheme.surfaceVariant,
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
  }
}
