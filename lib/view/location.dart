import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  GoogleMapController mapsController;
  final List<Marker> _markers = [];
  bool showmaps = true;

  @override
  void initState() {
    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId("mylocation"),
        position: LatLng(11.004556, 76.961632)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 20,
                      weight: FontWeight.bold,
                      color: green,
                    )),
              ],
            ),
          ),
          Expanded(child: buildGoogleMap(context)),
        ],
      ),
    );
  }

  buildGoogleMap(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: showmaps
          ? GoogleMap(
              onMapCreated: (controller) {
                mapsController = controller.obs as GoogleMapController;
              },
              markers: Set<Marker>.of(_markers),
              initialCameraPosition: const CameraPosition(
                  target: LatLng(11.004556, 76.961632), zoom: 13))
          : CircularProgressIndicator(
              color: blue,
            ),
    );
  }
}
