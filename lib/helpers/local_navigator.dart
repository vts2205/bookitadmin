import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/routing/router.dart';
import 'package:bookitadminpanel/routing/routes.dart';
import 'package:flutter/cupertino.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: OverviewPageRoute,
    );
