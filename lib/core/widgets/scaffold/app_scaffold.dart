import 'package:app/core/widgets/texts/black_texts.dart';
import 'package:app/src/main_index.dart';

import '../container/background_container.dart';
import 'custom_back_appbar.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final TextStyle? titleStyle;
  final Widget body;
  final Widget? floatingActionButton;
  final bool? isDrawer;
  final bool? isNotifications;
  final PreferredSizeWidget? appBar;
  final Color? backgroundAppBar;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final List<Widget>? actions;
  final Widget? leading;

  const AppScaffold(
      {Key? key,
      this.title,
      this.titleWidget,
      required this.body,
      this.floatingActionButton,
      this.isDrawer = false,
      this.isNotifications = false,
      this.appBar,
      this.backgroundAppBar,
      this.bottomSheet,
      this.bottomNavigationBar,
      this.backgroundColor,
      this.actions,
      this.titleStyle,
      this.foregroundColor,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false, // this code remove the keyboard overflow.
      // drawer: isDrawer! ? SideMenuPage(isCaptain: true) : null,
      // primary: true,

      //SafeArea to save content from the phone top par.
      body: BackgroundContainer(
        child: ((title == null && titleWidget == null) && appBar == null) ? body : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            appBar ??
                Row(
                  children: [
                    CustomBackAppBar(),
                    Expanded(
                      child: Text(
                        title ?? "",
                        textAlign: TextAlign.start,
                        style: titleStyle ??
                            theme.appBarTheme.titleTextStyle
                      ).paddingOnly(top: 20, end: 10),
                    ),
                  ],
                ),
            Expanded(child: body),
          ],
        ),
      ),
      // extendBody: true,
      backgroundColor: backgroundColor ?? theme.cardColor,
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      // appBar: ((title == null && titleWidget == null) && appBar == null)
      //     ? null
      //     : appBar ??
      //         AppBar(
      //           toolbarHeight: 70,
      //           title: Text(
      //             title ?? "",
      //             style: theme.appBarTheme.titleTextStyle
      //           ),
      //
      //           backgroundColor: backgroundAppBar ?? theme.cardColor,
      //           centerTitle: true,
      //           flexibleSpace: titleWidget,
      //           // foregroundColor:
      //           //     foregroundColor ?? theme.cardColor,
      //           surfaceTintColor: theme.cardColor,
      //           // leadingWidth: 22,
      //
      //           systemOverlayStyle: SystemUiOverlayStyle(
      //             statusBarColor: backgroundAppBar ?? theme.cardColor,
      //             statusBarBrightness: Brightness.light,
      //           ),
      //           // bottom: PreferredSize(
      //           //     preferredSize: Size.fromHeight(1),
      //           //     child: Divider(),
      //           // ),
      //           leading:
      //               Navigator.canPop(context) ? CustomBackAppBar() : leading,
      //         ),
    );
  }
}
