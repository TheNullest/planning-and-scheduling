import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zamaan/data/data.dart';
import 'package:zamaan/model/models.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';
import 'package:zamaan/utilities/providers/providers.dart';
import 'package:zamaan/widgets/custom_icon_button_without_field_widget.dart';
import 'package:zamaan/widgets/custom_widgets.dart';

class CustomTaskButtonOptionsWidget extends StatefulWidget {
  final bool opensOptionsSection;
  final void Function()? optionsSectionClosed;
  final CustomThemeExtension myTheme;
  final MainTaskModel mainTask;

  const CustomTaskButtonOptionsWidget(
      {super.key,
      required this.opensOptionsSection,
      this.optionsSectionClosed,
      required this.myTheme,
      required this.mainTask});

  @override
  State<CustomTaskButtonOptionsWidget> createState() =>
      _CustomTaskButtonOptionsWidgetState();
}

class _CustomTaskButtonOptionsWidgetState
    extends State<CustomTaskButtonOptionsWidget> {
  late bool _displayed = false;
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(
            milliseconds: widget.opensOptionsSection && !_displayed ? 200 : 0),
        () => setState(() {
              _displayed = widget.opensOptionsSection;
            }));

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
          child: Consumer<ProjectModelProvider>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomNormalButtonWidget(onPressed: () {}, text: 'لغو انجام'),
                  CustomIconButtonWithoutFieldWidget(
                    onTap: () {},
                    icon: Icons.bar_chart,
                    iconSize: 50,
                    iconColor: Colors.white,
                  ),
                  Expanded(
                    flex: 3,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Center(
                              child: Container(
                                color: Colors.red,
                                height: 150,
                                child: Text(
                                    (widget.mainTask.timeFrames![index].endAt)
                                        .toString()),
                              ),
                            );
                          }, childCount: widget.mainTask.timeFrames!.length),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () => {
                      Provider.of<HideUnhideBarsProvider>(context,
                              listen: false)
                          .barsDisplay = true,
                      widget.optionsSectionClosed!()
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
