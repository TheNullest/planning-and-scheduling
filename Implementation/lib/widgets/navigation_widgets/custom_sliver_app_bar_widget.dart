import 'package:flutter/material.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';
import 'package:zamaan/views/settings_view.dart';

class CustomSliverAppBarWidget extends StatelessWidget {
  final CustomThemeExtension myTheme;
  final String viewTitle;
  final bool appBarDisplay;

  const CustomSliverAppBarWidget(
      {super.key,
      required this.myTheme,
      required this.viewTitle,
      required this.appBarDisplay});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // for removing the back button on the app bar
      automaticallyImplyLeading: false,
      backgroundColor: myTheme.sectionColor,
      scrolledUnderElevation: 15,
      leading: const Center(
          child: Text(
        'زمان',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
      elevation: 5,
      surfaceTintColor: myTheme.sectionColor,
      shadowColor: myTheme.backgroundColor,
      floating: true,
      snap: true,
      toolbarHeight: appBarDisplay ? 50 : 0,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsView())),
          ),
        )
      ],
      title: Text(
        viewTitle,
        style: TextStyle(color: myTheme.textColor),
      ),
    );
  }
}
