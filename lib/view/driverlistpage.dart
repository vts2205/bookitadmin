import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverListPage extends StatelessWidget {
  DriverListPage({Key key}) : super(key: key);

  final List<Map<String, String>> driverInfo = [
    {
      "id": "1",
      "name": "nivy",
      "no": "6382136965",
      "ownername": "priya",
      "ownerno": "7867997754",
      "location": "Coimbatore",
      "license": "abdc123",
      "expirydate": "21/05/2025",
      "rating": "4.5",
      "wallet": "1000",
      "action": "Block"
    }
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
      child:
          // Visibility(
          //   visible: isLoading,
          //   child: isLoading == false
          //       ? Container()
          //       :
          DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn(label: Text("ID")),
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(label: Text("Phone Number")),
                DataColumn(label: Text("Owner Name")),
                DataColumn(label: Text("Owner phone Number")),
                DataColumn(
                  label: Text('Location'),
                ),
                DataColumn(
                  label: Text('Licence'),
                ),
                DataColumn(
                  label: Text('Expiry Date'),
                ),
                DataColumn(
                  label: Text('Rating'),
                ),
                DataColumn(
                  label: Text('Wallet'),
                ),
                DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: driverInfo
                  .map((e) => DataRow(cells: [
                        DataCell(CustomText(
                          text: (e['id']),
                          size: 12,
                          weight: FontWeight.normal,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                          text: (e['name']),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                          text: (e['no']),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                          text: (e['ownername']),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                          text: (e['ownerno']),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                          text: (e['location']),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                          text: (e['license']),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                          text: (e['expirydate']),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.deepOrange,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: (e['rating']),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )
                          ],
                        )),
                        DataCell(CustomText(
                          text: (e["wallet"]),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: blue),
                            onPressed: () {},
                            child: CustomText(
                              text: e['action'],
                              color: Colors.white,
                            )))
                      ]))
                  .toList()),
      // replacement: const Center(
      //   child: CircularProgressIndicator(),
      // ),
    );
  }
}
