import 'package:bookitadminpanel/routing/routes.dart';
import 'package:bookitadminpanel/view/Vendor.dart';
import 'package:bookitadminpanel/view/cancelledride.dart';
import 'package:bookitadminpanel/view/cardocument.dart';
import 'package:bookitadminpanel/view/completedride.dart';
import 'package:bookitadminpanel/view/driver_wallet_transaction.dart';
import 'package:bookitadminpanel/view/driverdocument.dart';
import 'package:bookitadminpanel/view/driverlistpage.dart';
import 'package:bookitadminpanel/view/drivers.dart';
import 'package:bookitadminpanel/view/location.dart';
import 'package:bookitadminpanel/view/manual_booking_history.dart';
import 'package:bookitadminpanel/view/overview.dart';
import 'package:bookitadminpanel/view/ownerdocument.dart';
import 'package:bookitadminpanel/view/profile.dart';
import 'package:bookitadminpanel/view/progressride.dart';
import 'package:bookitadminpanel/view/ridehistory.dart';
import 'package:bookitadminpanel/view/riderequest.dart';
import 'package:bookitadminpanel/view/scheduledride.dart';
import 'package:bookitadminpanel/view/subadmin.dart';
import 'package:bookitadminpanel/view/users.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverviewPageRoute:
      return _getPageRoute(OverviewPage());
    case ProfilePageRoute:
      return _getPageRoute(ProfilePage());
    case SubAdminPageRoute:
      return _getPageRoute(SubAdminPage());
    case ClientPageRoute:
      return _getPageRoute(VendorPage());
    case DriversPageRoute:
      return _getPageRoute(DriversPage());
    case DriversListPageRoute:
      return _getPageRoute(DriverListPage());
    case CarDocumentPageRoute:
      return _getPageRoute(CarDocumentPage());
    case DriverDocumentPageRoute:
      return _getPageRoute(DriverDocumentPage());
    case OwnerDocumentPageRoute:
      return _getPageRoute(OwnerDocumentPage());
    case DriverWalletTransactionRoute:
      return _getPageRoute(DriverWalletTransaction());
    case UsersPageRoute:
      return _getPageRoute(UsersPage());
    case RideRequestPageRoute:
      return _getPageRoute(RideRequestPage());
    case ProgressRidePageRoute:
      return _getPageRoute(RideInProgress());
    case CompletedRidePageRoute:
      return _getPageRoute(CompletedRides());
    case CancelledRidePageRoute:
      return _getPageRoute(CancelledRides());
    case ScheduledRidePageRoute:
      return _getPageRoute(ScheduledRides());
    case ManualBookingHistoryRoute:
      return _getPageRoute(const ManualBookingHistoryScreen());
    case LocationPageRoute:
      return _getPageRoute(const LocationPage());
    case RideHistoryPageRoute:
      return _getPageRoute(RideHistory());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
