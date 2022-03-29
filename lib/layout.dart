import 'package:bookitadminpanel/helpers/local_navigator.dart';
import 'package:bookitadminpanel/widgets/custom_screen.dart';
import 'package:bookitadminpanel/widgets/large_screen.dart';
import 'package:bookitadminpanel/widgets/medium_screen.dart';
import 'package:bookitadminpanel/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'helpers/responsiveness.dart';
import 'widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: ResponsiveWidget(
          largeScreen: const LargeScreen(),
          smallScreen: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: localNavigator(),
          ),
          mediumScreen: const MediumScreen(),
          customScreen: const CustomScreen(),
        ),
      ),
    );
  }
}
