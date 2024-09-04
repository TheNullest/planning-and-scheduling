import 'package:flutter/material.dart';
import 'package:zamaan/repositories/hive_repositories.dart';
import 'package:zamaan/utilities/routes/views_route.dart';
import 'package:zamaan/utilities/themes/custom_theme_extension.dart';
import 'package:zamaan/utilities/enums.dart';
import 'package:zamaan/utilities/providers/providers.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/view_models/user_view_model.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';
import 'package:zamaan/views/widgets/custom_widgets.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
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

            // users
            SizedBox(
              height: 400,
              child: Consumer<UserViewModel>(builder: (context, userVM, child) {
                if (userVM.isLoading) {
                  return const CircularProgressIndicator();
                } else if (userVM.entities!.isNotEmpty) {
                  return ListView.builder(
                      itemCount: userVM.entities!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  userVM.entities![index].userName,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                20.0.sizedBoxWidth,
                                Text(
                                  userVM.entities![index].password,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                      child: Text(
                    'No data',
                    style: TextStyle(color: Colors.black),
                  ));
                }
              }),
            ),
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
          ],
        ),
      ),
    );
  }

  @override
  IconData get icon => Icons.settings;
}
