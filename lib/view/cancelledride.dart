import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:bookitadminpanel/widgets/shimmerwidget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelledRides extends StatelessWidget {
  CancelledRides({Key key}) : super(key: key);

  final List<Map<String, String>> cancelinfo = [
    {
      "from": "31/05/2021",
      "to": "04/06/2021",
      "userid": "001",
      "driverid": "002",
      "pickup": "coimbatore",
      "drop": "thiruvarur",
      "package": "local",
      "cab": "Sedan",
      "cancelledby": "User",
      "reason": "xxx"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: "Cancelled Rides",
                      size: 20,
                      weight: FontWeight.bold,
                      color: green,
                    )),
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                buildRideCancelTable()
                //buildRideCancelShimmer()
              ],
            )),
          ],
        ),
      ),
    );
  }

  buildRideCancelTable() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: active.withOpacity(.4), width: .5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 30),
        child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: const [
              DataColumn(label: Text("From")),
              DataColumn(label: Text("To")),
              DataColumn(label: Text("User ID")),
              DataColumn(label: Text("Driver ID")),
              DataColumn(label: Text("Pickup Location")),
              DataColumn(label: Text('Drop Location')),
              DataColumn(label: Text('Package')),
              DataColumn(label: Text('Cab')),
              DataColumn(label: Text('Cancelled By')),
              DataColumn(label: Text('Reason')),
            ],
            rows: cancelinfo
                .map((e) => DataRow(cells: [
                      DataCell(CustomText(
                        text: (e["from"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["to"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["userid"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["driverid"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["pickup"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["drop"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["package"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["cab"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["cancelledby"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["reason"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                    ]))
                .toList()),
      ),
    );
  }

  buildRideCancelShimmer() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: active.withOpacity(.4), width: .5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 30),
        child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: const [
              DataColumn(label: ShimmerWidget.rectangular(height: 16)),
              DataColumn(label: ShimmerWidget.rectangular(height: 16)),
              DataColumn(label: ShimmerWidget.rectangular(height: 16)),
              DataColumn(label: ShimmerWidget.rectangular(height: 16)),
              DataColumn(
                label: ShimmerWidget.rectangular(height: 16),
              ),
              DataColumn(
                label: ShimmerWidget.rectangular(height: 16),
              ),
              DataColumn(
                label: ShimmerWidget.rectangular(height: 16),
              ),
              DataColumn(
                label: ShimmerWidget.rectangular(height: 16),
              ),
            ],
            rows: cancelinfo
                .map((e) => const DataRow(cells: [
                      DataCell(ShimmerWidget.rectangular(height: 16)),
                      DataCell(ShimmerWidget.rectangular(height: 16)),
                      DataCell(ShimmerWidget.rectangular(height: 16)),
                      DataCell(ShimmerWidget.rectangular(height: 16)),
                      DataCell(ShimmerWidget.rectangular(height: 16)),
                      DataCell(ShimmerWidget.rectangular(height: 16)),
                      DataCell(ShimmerWidget.rectangular(height: 16)),
                      DataCell(ShimmerWidget.rectangular(height: 16)),
                    ]))
                .toList()));
  }
}
