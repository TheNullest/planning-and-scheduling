import 'package:flutter/material.dart';
import 'package:zamaan/routes/views_route.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';
import 'package:zamaan/utilities/enums.dart';
import 'package:zamaan/utilities/providers/providers.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';
import 'package:zamaan/widgets/custom_widgets.dart';

class SettingsView extends StatelessWidget implements BaseView {
  const SettingsView({super.key});
  static String routeName = 'settings-view';

  @override
  String get viewTitle => 'تنظیمات';

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension myTheme =
        Provider.of<ThemeProvider>(context).myTheme(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: myTheme.environmentColors.sectionBorderColor,
      ),
      backgroundColor: myTheme.environmentColors.mainBackgroundColor,
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.all(50),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: myTheme.environmentColors.sectionBackgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomNormalButtonWidget(
                  onPressed: () =>
                      ViewsRoute.goToSelectedView(context, view: 'login'),
                  text: 'خروج'),
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.all(50),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: myTheme.environmentColors.sectionBackgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Provider.of<ThemeProvider>(context).selectedMode,
                ),
                20.0.sizedBoxWidth,
                CustomSwitchWidget(
                    value: !Provider.of<ThemeProvider>(context).isDarkMode,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    }),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: myTheme.environmentColors.sectionBackgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Provider.of<ChangeTaskTileSizeProvider>(context)
                    .tileSize
                    .toString()),
                20.0.sizedBoxWidth,
                CustomSwitchWidget(
                    value: Provider.of<ChangeTaskTileSizeProvider>(context)
                            .tileSize ==
                        TaskTileSizes.big,
                    onChanged: (value) {
                      Provider.of<ChangeTaskTileSizeProvider>(context,
                                  listen: false)
                              .tileSize =
                          value ? TaskTileSizes.big : TaskTileSizes.small;
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  IconData get icon => Icons.settings;
}
