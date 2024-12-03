import 'package:app/src/cart/presentation/pages/cart_page.dart';import 'package:app/src/home/presentation/pages/home_page.dart';import 'package:app/src/main_index.dart';import '../../../../core/widgets/check_version.dart';import '../../../categories/presentation/pages/categories_page.dart';import '../../../orders/orders_screen.dart';import '../../../profile/presentation/pages/profile_page.dart';import '../bloc/nav_bar_bloc.dart';import '../widgets/ff_navigation_bar_plus.dart';class NavigationBarPage extends BaseStatelessWidget {  NavigationBarPage({    Key? key,  }) : super(key: key);  @override  Widget build(BuildContext context) {    AppVersionChecker().checkVersion(context, isWillPop: false);    List<NavigatorModel> items = [      NavigatorModel(        title: strings.home,        screen: HomePage(),        icon: AppIcons.bike,      ),      NavigatorModel(        title: strings.rules,        screen: CategoriesPage(),        icon: AppIcons.cart,      ),      NavigatorModel(        title: strings.news,        screen: CartPage(),        icon: AppIcons.profile,      ),      NavigatorModel(        title: strings.seasons,        screen: ProfilePage(),        icon: AppIcons.category,      ),      NavigatorModel(        title: strings.more,        screen: OrdersScreen(),        icon: AppIcons.file,      ),    ];    return BlocProvider(      create: (context) => NavBarBloc(),      child: BlocBuilder<NavBarBloc, NavBarState>(        builder: (context, state) {          NavBarBloc bloc = NavBarBloc.get(context);          return Scaffold(            extendBody: true,            bottomNavigationBar: FFNavigationBar(              theme: FFNavigationBarTheme(                barBackgroundColor: Color(0xFF2B325F),                selectedItemBorderColor: Colors.transparent,                selectedItemBackgroundColor: Colors.transparent,                selectedItemLabelColor: Colors.transparent,                itemWidth: 150,                barHeight: 50,              ),              selectedIndex: bloc.currentIndex,              onSelectTab: (index) {                bloc.changeIndex(index);              },              items: [                FFNavigationBarItem(                  iconData: AppIcons.bike,                  label: 'Schedule',                ),                FFNavigationBarItem(                  iconData: AppIcons.category,                  label: 'Contacts',                ),                FFNavigationBarItem(                  iconData: AppIcons.cart,                  label: 'Bills',                ),                FFNavigationBarItem(                  iconData: AppIcons.profile,                  label: 'Notes',                ),                FFNavigationBarItem(                  iconData: AppIcons.file,                  label: 'Settings',                ),              ],            ),            body: items[bloc.currentIndex].screen,          );        },      ),    );  }}class NavigatorModel {  final String title;  final Widget screen;  final String icon;  NavigatorModel({    required this.title,    required this.screen,    required this.icon,  });}