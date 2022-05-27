import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/model/approved_drivers_list_model.dart';
import 'package:bookitadminpanel/model/rejected_drivers_list_model.dart';
import 'package:bookitadminpanel/services/apiservices.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RejectedDriverListPage extends StatefulWidget {
  const RejectedDriverListPage({Key key}) : super(key: key);

  @override
  State<RejectedDriverListPage> createState() => _RejectedDriverListPageState();
}

class _RejectedDriverListPageState extends State<RejectedDriverListPage> {
  RejectedDriversListModel rejectedDriversListModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    rejectedDriversListModel = (await APIService().rejectedDriversList());
    if (rejectedDriversListModel != null) {
      setState(() {
        isLoading = true;
      });
    }
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
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.topLeft,
            child: buildSearchBar(),
          ),
          Expanded(
              child: ListView(
            children: [buildDriversTable()],
          )),
        ],
      ),
    );
  }

  buildSearchBar() {
    return Container(
      width: 300,
      height: 40,
      child: TextField(
        cursorColor: green,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: green)),
          suffixIcon: Icon(Icons.search, color: green),
          hintText: "Search by ID",
        ),
      ),
    );
  }

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
        child: Visibility(
          visible: isLoading,
          child: isLoading == false
              ? Container()
              : DataTable2(
                  columnSpacing: 5,
                  horizontalMargin: 12,
                  minWidth: 400,
                  columns: const [
                    DataColumn(label: Text("ID")),
                    DataColumn(
                      label: Text("Name"),
                    ),
                    DataColumn(label: Text("Contact")),
                    DataColumn(label: Text("Owner Name")),
                    DataColumn(label: Text("Owner Contact")),
                    DataColumn(
                      label: Text('Location'),
                    ),
                    DataColumn(
                      label: Text('License'),
                    ),
                    DataColumn(
                      label: Text('Expiry Date'),
                    ),
                    DataColumn(
                      label: Text('Referral'),
                    ),
                    // DataColumn(
                    //   label: Text('Wallet'),
                    // ),
                    // DataColumn(
                    //   label: Text('Action'),
                    // ),
                  ],
                  rows: rejectedDriversListModel.body.approvedDrivers
                      .map((e) => DataRow(cells: [
                            DataCell(CustomText(
                              text: (e.driverId),
                              size: 12,
                              weight: FontWeight.normal,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.name),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.contact),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.ownerName),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.ownerNumber),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.location),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.licenseNumber),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.expiryDate),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.referral),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            // DataCell(Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     const Icon(
                            //       Icons.star,
                            //       color: Colors.deepOrange,
                            //       size: 15,
                            //     ),
                            //     const SizedBox(
                            //       width: 5,
                            //     ),
                            //     CustomText(
                            //       text: (e['rating']),
                            //       weight: FontWeight.normal,
                            //       size: 12,
                            //       color: Colors.black,
                            //     )
                            //   ],
                            // )),
                            // DataCell(CustomText(
                            //   text: (e["wallet"]),
                            //   weight: FontWeight.normal,
                            //   size: 12,
                            //   color: Colors.black,
                            // )),
                            // DataCell(ElevatedButton(
                            //     style: ElevatedButton.styleFrom(primary: blue),
                            //     onPressed: () {},
                            //     child: CustomText(
                            //       text: e['action'],
                            //       color: Colors.white,
                            //     )))
                          ]))
                      .toList()),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
