import 'package:flutter/material.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/my_custom_clipper.dart';
import 'package:zamaan/utilities/providers/providers.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';
import 'package:zamaan/widgets/custom_widgets.dart';
import 'package:zamaan/utilities/responsive_helper.dart';
import 'package:zamaan/views/views.dart';

class MainView extends StatefulWidget {
  static String routeName = 'main-view';

  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  final TextEditingController _taskNameTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();
  late TabController _tabController;

  final List<Widget> _views = const [
    AccomplishmentsView(),
    CalendarView(),
    ReminderView(),
    ReportsView(),
    ActiveTasksView(),
    TodaysTasksView(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _views.length, vsync: this);
    _tabController.index = 5;

    super.initState();
  }

  @override
  void dispose() {
    _taskNameTextController.dispose();
    _descriptionTextController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  late double currentHeight = 0;

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension myTheme =
        context.watch<ThemeProvider>().myTheme(context);

    final bool barsDisplay =
        Provider.of<HideUnhideBarsProvider>(context).barsDisplay;

    return PopScope(
      canPop: false,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            ResponsiveHelper.statusBarHeight =
                MediaQuery.sizeOf(context).height -
                    constraints.constrainHeight();
            return DefaultTabController(
              initialIndex: _tabController.index,
              length: _views.length,
              child: NestedScrollView(
                  headerSliverBuilder: (context, isScrolled) {
                    return barsDisplay
                        ? [
                            CustomSliverAppBarWidget(
                                appBarDisplay: barsDisplay,
                                myTheme: myTheme,
                                viewTitle:
                                    (_views[_tabController.index] as BaseView)
                                        .viewTitle)
                          ]
                        : [];
                  },
                  body: Stack(children: [
                    Scaffold(
                      backgroundColor: myTheme.backgroundColor,
                      body:
                          // The key to move between tabs and windows just by using scrolling
                          // is the TabBarView
                          TabBarView(
                        physics: barsDisplay
                            ? const AlwaysScrollableScrollPhysics()
                            : const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: _views,
                      ),

                      // return IndexedStack(

                      //   index: _tabController.index,

                      //   /// Reversed for the Persian language
                      //   /// It can be adjusted for English language later
                      //   children: _views,
                      // );

                      bottomNavigationBar:
                          !ResponsiveHelper.largeScreenSize(context)
                              ? CustomTabBarWidget(
                                  bottomBarDisplay: barsDisplay,
                                  tabController: _tabController,

                                  /// Reversed for the Persian language
                                  /// It can be adjusted for English language later
                                  icons: _views
                                      .map<IconData>(
                                          (view) => (view as BaseView).icon)
                                      .toList(),
                                  onTap: (index) => setState(() {
                                    _tabController.index = index;
                                  }),

                                  selectedIndex: _tabController.index,
                                )
                              : const SizedBox.shrink(),
                    ),
                    AnimatedPositioned(
                        duration: const Duration(milliseconds: 200),
                        bottom: barsDisplay ? 40 : -40,
                        left:
                            ResponsiveHelper.screenSizeWidth(context) / 2 - 25,
                        child: ClipPath(
                          clipper: MyCustomClipper(top: 40, left: 40),
                          child: Container(
                            height: 40,
                            width: 40,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: myTheme.backgroundColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )),
                    AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.bounceOut,
                        bottom: barsDisplay ? 45 : -40,
                        left:
                            ResponsiveHelper.screenSizeWidth(context) / 2 - 20,
                        child: CustomAddNewTaskButtonWidget(
                          taskNameTextController: _taskNameTextController,
                          descriptionTextController: _descriptionTextController,
                        )),
                  ])),
            );
          },
        ),
      ),
    );
  }
}
