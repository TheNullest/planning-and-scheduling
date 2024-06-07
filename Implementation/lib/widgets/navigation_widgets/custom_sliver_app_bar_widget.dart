import 'package:flutter/material.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';
import 'package:zamaan/views/settings_view.dart';

class CustomSliverAppBarWidget extends StatelessWidget {
  final CustomThemeExtension myTheme;
  final String viewTitle;

  const CustomSliverAppBarWidget(
      {super.key, required this.myTheme, required this.viewTitle});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: myTheme.sectionColor,
      scrolledUnderElevation: 15,
      elevation: 5,
      surfaceTintColor: myTheme.sectionColor,
      shadowColor: myTheme.backgroundColor,
      floating: true,
      snap: true,
      toolbarHeight: 50,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SettingsView())),
        )
      ],
      title: Text(
        viewTitle,
        style: TextStyle(color: myTheme.textColor),
      ),
    );
  }
}
