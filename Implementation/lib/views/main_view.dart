import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';
import 'package:zamaan/widgets/custom_widgets.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';
import 'package:zamaan/utilities/responsive_helper.dart';
import 'package:zamaan/views/views.dart';

class MainView extends StatefulWidget {
  static String routeName = 'main-view';

  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  final List<Widget> _views = const [
    AccomplishmentsView(),
    CalendarView(),
    ReminderView(),
    ReportsView(),
    ActiveTasksView(),
    TodaysTasksView(),
  ];

  int _selectedIndex = 5;

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension myTheme =
        context.watch<ThemeProvider>().myTheme(context);
    return DefaultTabController(
      initialIndex: _selectedIndex,
      length: _views.length,
      child: Scaffold(
        backgroundColor: myTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: myTheme.sectionColor,
          scrolledUnderElevation: 15,
          elevation: 5,
          surfaceTintColor: myTheme.sectionColor,
          shadowColor: myTheme.backgroundColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsView())),
            )
          ],
          centerTitle: true,
          title: Text(
            (_views[_selectedIndex] as BaseView).viewTitle,
            style: TextStyle(color: myTheme.textColor),
          ),
        ),
        body: Builder(
          builder: (context) {
            final appBarHeight = Scaffold.of(context).appBarMaxHeight;
            ResponsiveHelper.screenUsbaleSize =
                MediaQuery.of(context).size.height - appBarHeight! - 60;

            return IndexedStack(
              index: _selectedIndex,

              /// Reversed for the Persian language
              /// It can be adjusted for English language later
              children: _views.toList(),
            );
          },
        ),
        bottomNavigationBar: !ResponsiveHelper.isDesktop(context)
            ? Container(
                height: 60,
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
                child: CustomTabBarWidget(
                  /// Reversed for the Persian language
                  /// It can be adjusted for English language later
                  icons: _views
                      .map<IconData>((view) => (view as BaseView).icon)
                      .toList(),
                  onTap: (index) => setState(() => _selectedIndex = index),
                  selectedIndex: _selectedIndex,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
