import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'screens.dart';
import '../widgets/widgets.dart';
import '../data/data.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountChildOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context) ? PreferredSize( 
          preferredSize: Size(screenSize.width, 100.0),
          child: CustomAppBar(
            currentUser: currentUser,
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            }
          ),
        )  : null,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _screens),
        bottomNavigationBar: !Responsive.isDesktop(context) ? Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            }
          ),
        ) : const SizedBox.shrink(),
      ),
    );
  }
}