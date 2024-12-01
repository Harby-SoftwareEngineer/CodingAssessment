library ff_navigation_bar_plus;

import 'package:app/core/widgets/container/LinearGradientContainer.dart';
import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:provider/provider.dart';
import 'ff_navigation_bar_theme.dart';
import 'ff_navigation_bar_item.dart';

export 'ff_navigation_bar_theme.dart';
export 'ff_navigation_bar_item.dart';

class FFNavigationBar extends StatefulWidget {
  final Function onSelectTab;
  final List<FFNavigationBarItem> items;
  final FFNavigationBarTheme theme;

  final int selectedIndex;

  FFNavigationBar({
    Key? key,
    this.selectedIndex = 0,
    required this.onSelectTab,
    required this.items,
    required this.theme,
  }) {
    // assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    // assert(onSelectTab != null);
  }

  @override
  _FFNavigationBarState createState() =>
      _FFNavigationBarState(selectedIndex: selectedIndex);
}

class _FFNavigationBarState extends State<FFNavigationBar> {
  int selectedIndex = 0;
  _FFNavigationBarState({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final FFNavigationBarTheme theme = widget.theme;
    final bgColor =
        theme.barBackgroundColor ?? Theme.of(context).bottomAppBarColor;
    ShapeBorder rectangle=RectangleShapeBorder(
      cornerStyles: RectangleCornerStyles.only(
        topLeft: CornerStyle.straight
      ),
        borderRadius: DynamicBorderRadius.only(
            topLeft: DynamicRadius.elliptical(1000.0.toPXLength, 80.toPercentLength),
        ),
    );
    return MultiProvider(
      providers: [
        Provider<FFNavigationBarTheme>.value(value: theme),
        Provider<int>.value(value: widget.selectedIndex),
      ],
      child: SafeArea(
        child: LinearGradientContainer(
          radius: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.items.map((item) {
              var index = widget.items.indexOf(item);
              item.setIndex(index);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.onSelectTab(index);
                    selectedIndex = index;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /
                      widget.items.length,
                  height: theme.barHeight,
                  child: item,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
