import 'package:app/core/assets/app_images.dart';
import 'package:app/core/widgets/buttons/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/assets/app_icons.dart';
import 'ff_navigation_bar_theme.dart';

// This class has mutable instance properties as they are used to store
// calculated values required by multiple build functions but not known
// (or required to be specified) at creation of instance parameters.
// For example, a color attribute will be modified depending on whether
// the item is selected or not.
// They are also used to store values retrieved from a Provider allowing
// properties to be communicated from the navigation bar to the individual
// items of the bar.

// ignore: must_be_immutable
class FFNavigationBarItem extends StatelessWidget {
  final String label;
  final String iconData;
  final Duration animationDuration;
  Color? selectedBackgroundColor;
  Color? selectedForegroundColor;
  Color? selectedLabelColor;

  late int index;
  late int selectedIndex;
  late FFNavigationBarTheme theme;
  late bool showSelectedItemShadow;
  double itemWidth;

  void setIndex(int index) {
    this.index = index;
  }

  Color? _getDerivedBorderColor() {
    return theme.selectedItemBorderColor ?? theme.barBackgroundColor;
  }

  Color? _getBorderColor(bool isOn) {
    return isOn ? _getDerivedBorderColor() : Colors.transparent;
  }

  bool _isItemSelected() {
    return index == selectedIndex;
  }

  static const kDefaultAnimationDuration = Duration(milliseconds: 1500);

  FFNavigationBarItem({
    Key? key,
    this.label = "",
    this.itemWidth = 80,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.selectedLabelColor,
    this.iconData = '',
    this.animationDuration = kDefaultAnimationDuration,
  }) : super(key: key);

  Center _makeLabel(String label) {
    bool isSelected = _isItemSelected();
    return Center(
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isSelected
              ? theme.selectedItemTextStyle.fontSize
              : theme.unselectedItemTextStyle.fontSize,
          fontWeight: isSelected
              ? theme.selectedItemTextStyle.fontWeight
              : theme.unselectedItemTextStyle.fontWeight,
          color: isSelected
              ? selectedLabelColor ?? theme.selectedItemLabelColor
              : theme.unselectedItemLabelColor,
          letterSpacing: isSelected ? 1.1 : 1.0,
        ),
      ),
    );
  }

  Widget _makeIconArea(double itemWidth, String iconData) {
    bool isSelected = _isItemSelected();
    double innerBoxSize = itemWidth - 8;

    return SizedBox(
      width: isSelected ? (innerBoxSize / 1.6) : innerBoxSize / 4,
      height: isSelected ? innerBoxSize : innerBoxSize / 2,
      child: _makeIcon(iconData),
    );
  }

  Widget _makeIcon(
    String iconData,
  ) {
    bool isSelected = _isItemSelected();
    return isSelected ? Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.active_bg_bar,
            color: theme.unselectedItemIconColor,
            // width: 60,
            fit: BoxFit.cover,
          ),
          AppIcon(
            icon: iconData,
            color: theme.selectedItemIconColor,
          )
        ],
      ),
    ) :
      AppIcon(
      icon: iconData,
      color: theme.unselectedItemIconColor,
    );
  }

  Widget _makeShadow() {
    bool isSelected = _isItemSelected();
    double height = isSelected ? 4 : 0;
    double width = isSelected ? itemWidth + 6 : 0;

    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: height,
      width: width,
      color: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    theme = Provider.of<FFNavigationBarTheme>(context);
    showSelectedItemShadow = theme.showSelectedItemShadow;
    itemWidth = theme.itemWidth;
    selectedIndex = Provider.of<int>(context);

    selectedBackgroundColor =
        selectedBackgroundColor ?? theme.selectedItemBackgroundColor;
    selectedForegroundColor =
        selectedForegroundColor ?? theme.selectedItemIconColor;
    selectedLabelColor = selectedLabelColor ?? theme.selectedItemLabelColor;

    bool isSelected = _isItemSelected();
    double itemHeight = itemWidth;
    double topOffset = isSelected ? -40 : -5;
    double iconTopSpacer = isSelected ? 0 : 2;
    double shadowTopSpacer = 4;

    Widget labelWidget = _makeLabel(label);
    Widget iconAreaWidget = _makeIconArea(itemWidth, iconData);
    Widget shadowWidget = showSelectedItemShadow ? _makeShadow() : Container();

    return AnimatedContainer(
      width: itemWidth,
      height: double.maxFinite,
      duration: animationDuration,
      color: Colors.transparent,
      child: SizedBox(
        width: itemWidth,
        height: itemHeight,
        child: Stack(
          clipBehavior: Clip.none, children: <Widget>[
            Positioned(
              top: topOffset,
              left: -itemWidth / 2,
              right: -itemWidth / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: iconTopSpacer),
                  iconAreaWidget,
                  // labelWidget,
                  SizedBox(height: shadowTopSpacer),
                  // shadowWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
