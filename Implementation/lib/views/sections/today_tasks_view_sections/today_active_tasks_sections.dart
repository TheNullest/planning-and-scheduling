import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';

class TodayActiveTasksSection extends StatelessWidget {
  const TodayActiveTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension myTheme =
        context.watch<ThemeProvider>().myTheme(context);
    final List<int> list = [];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      constraints:
          const BoxConstraints(minHeight: 100, minWidth: double.maxFinite),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'در حال انجام  :',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 70,
            width: double.infinity,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (list.isEmpty) {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text('.کاری در حال انجام ندارید'),
                      ));
                    }
                    return Text(list[index].toString());
                  }, childCount: list.length + 1),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
