import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';
import 'package:zamaan/widgets/custom_widgets.dart';

import '../utilities/providers/theme_provider.dart';

class SettingsView extends StatelessWidget implements BaseView {
  const SettingsView({super.key});
  static String routeName = 'settings-view';

  @override
  String get viewTitle => 'Settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomSwitchWidget(
              value: !Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              }),
          Text(Provider.of<ThemeProvider>(context).selectedMode)
        ],
      ),
    );
  }

  @override
  IconData get icon => Icons.settings;
}
