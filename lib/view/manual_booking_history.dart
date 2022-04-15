import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:bookitadminpanel/widgets/shimmerwidget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ManualBookingHistoryScreen extends StatefulWidget {
  const ManualBookingHistoryScreen({Key key}) : super(key: key);

  @override
  State<ManualBookingHistoryScreen> createState() =>
      _ManualBookingHistoryScreenState();
}

class _ManualBookingHistoryScreenState
    extends State<ManualBookingHistoryScreen> {
  DateTime _dateTime = DateTime(25, 03, 2022, 6, 51);

  bool isVisible = false;

  final List<Map<String, String>> driversinfo = [
    {
      "id": "001",
      "name": "nivy",
      "package": "Outstation",
      "cabtype": "XUV",
      "pickup": "Coimbatore",
      "drop": "Thiruvarur",
      "pickupdate": "20/02/2022",
      "dropdate": "25/02/2022",
      "km": "100 KM",
      "price": "2000",
      "bookedby": "Kalai",
      "status": "completed"
    },
  ];
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
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.topLeft,
            child: buildFromToDate(),
          ),
          Expanded(
              child: ListView(
            children: [
              //buildDriverShimmer()
              if (isVisible) buildDriversTable()
            ],
          )),
        ],
      ),
    );
  }

  buildFromToDate() {
    return Column(
      children: [
        Row(
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child:
                    Text('Today', style: TextStyle(fontSize: 15, color: blue))),
            Container(
              width: 1,
              height: 30,
              color: Colors.black,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Text('Yesterday',
                    style: TextStyle(fontSize: 15, color: blue))),
          ],
        ),
        Row(
          children: [
            const Text('From :', style: TextStyle(fontSize: 15)),
            TextButton(
                onPressed: () {
                  pickDateTime();
                },
                child: Text(
                  '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                  style: TextStyle(fontSize: 15, color: blue),
                )),
            Container(
              width: 1,
              height: 30,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            const Text('To :', style: TextStyle(fontSize: 15)),
            TextButton(
                onPressed: () {
                  pickDateTime();
                },
                child: Text(
                  '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                  style: TextStyle(fontSize: 15, color: blue),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: blue),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        )
      ],
    );
  }

  Future pickDateTime() async {
    DateTime date = await pickDate();
    if (date == null) return;

    final dateTime = DateTime(date.day, date.month, date.year);

    setState(() {
      this._dateTime = dateTime;
    });
  }

  Future<DateTime> pickDate() => showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2021),
      lastDate: DateTime(2100));

  buildDriversTable() {
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
              DataColumn(label: Text("ID")),
              DataColumn(
                label: Text("Name"),
              ),
              DataColumn(
                label: Text('Package'),
              ),
              DataColumn(
                label: Text('Cab'),
              ),
              DataColumn(
                label: Text('Pickup Location'),
              ),
              DataColumn(
                label: Text('Drop Location'),
              ),
              DataColumn(
                label: Text('Pickup Date'),
              ),
              DataColumn(
                label: Text('Drop Date'),
              ),
              DataColumn(
                label: Text('KM'),
              ),
              DataColumn(
                label: Text('Price'),
              ),
              DataColumn(
                label: Text('Booked By'),
              ),
              DataColumn(
                label: Text('Status'),
              ),
            ],
            rows: driversinfo
                .map((e) => DataRow(cells: [
                      DataCell(CustomText(
                        text: (e["id"]),
                        size: 12,
                        weight: FontWeight.normal,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["name"]),
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
                        text: (e["cabtype"]),
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
                        text: (e["pickupdate"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["dropdate"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["km"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["price"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["bookedby"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["status"]),
                        weight: FontWeight.bold,
                        size: 15,
                        color: Colors.green,
                      )),
                    ]))
                .toList()));
  }

  buildDriverShimmer() {
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
            rows: driversinfo
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
