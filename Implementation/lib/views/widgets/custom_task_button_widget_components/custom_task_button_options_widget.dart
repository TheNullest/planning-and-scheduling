import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zamaan/models/models.dart';
import 'package:zamaan/utilities/themes/custom_theme_extension.dart';
import 'package:zamaan/utilities/providers/providers.dart';
import 'package:zamaan/views/widgets/custom_task_button_widget_components/option_section/active_custom_task_button_option_widget.dart';
import 'package:zamaan/views/widgets/custom_task_button_widget_components/option_section/idle_custom_task_button_option_widget.dart';
import 'package:zamaan/views/widgets/custom_widgets.dart';

class CustomTaskButtonOptionsWidget extends StatefulWidget {
  final bool opensOptionsSection;
  final void Function()? optionsSectionClosed;
  final CustomThemeExtension myTheme;
  final MainTaskModel mainTask;
  final bool taskActivated;

  const CustomTaskButtonOptionsWidget(
      {super.key,
      required this.opensOptionsSection,
      this.optionsSectionClosed,
      required this.myTheme,
      required this.mainTask,
      required this.taskActivated});

  @override
  State<CustomTaskButtonOptionsWidget> createState() =>
      _CustomTaskButtonOptionsWidgetState();
}

class _CustomTaskButtonOptionsWidgetState
    extends State<CustomTaskButtonOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.opensOptionsSection) {
      Timer(const Duration(milliseconds: 200), () => setState(() {}));
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        Provider.of<HideUnhideBarsProvider>(context, listen: false)
            .barsDisplay = true;
        widget.optionsSectionClosed!();
      },
      child: Expanded(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: widget.opensOptionsSection ? 1 : 0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Consumer(
              builder: (context, provider, child) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.exit_to_app),
                            style: ButtonStyle(
                              maximumSize:
                                  WidgetStateProperty.all(const Size(200, 50)),
                              minimumSize:
                                  WidgetStateProperty.all(const Size(150, 40)),
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.red),
                            ),
                            onPressed: () => {
                              Provider.of<HideUnhideBarsProvider>(context,
                                      listen: false)
                                  .barsDisplay = true,
                              widget.optionsSectionClosed!()
                            },
                            label: const Text('پیهودن ( لغو )'),
                          ),
                          ElevatedButton.icon(
                            style: ButtonStyle(
                              maximumSize:
                                  WidgetStateProperty.all(const Size(200, 50)),
                              minimumSize:
                                  WidgetStateProperty.all(const Size(150, 40)),
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.purple),
                            ),
                            icon: const Icon(Icons.bar_chart),
                            label: const Text('گزارش'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    widget.taskActivated
                        ? const ActiveCustomTaskButtonOptionWidget()
                        : const IdleCustomTaskButtonOptionWidget(),
                    widget.mainTask.timeIntervalsId != null
                        ? SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              return Center(
                                child: ReporterTimeFrameButtonWidget(
                                  myTheme: widget.myTheme,
                                  timeFrame:
                                      widget.mainTask.timeIntervalsId![index],
                                ),
                              );
                            },
                                childCount:
                                    widget.mainTask.timeIntervalsId!.length),
                          )
                        : const SliverToBoxAdapter(child: SizedBox.shrink()),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
