import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarDocumentPage extends StatelessWidget {
  CarDocumentPage({Key key}) : super(key: key);

  final List<Map<String, String>> carDoc = [
    {
      "id": "1",
      "name": "nivy",
      "frontimg": "view",
      "chaseimg": "view",
      "rcfront": "view",
      "rcback": "view",
      "insurance": "view",
      "fccopy": "view",
      "action": "Delete"
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
            children: [buildCarDocTable()],
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

  buildCarDocTable() {
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
                DataColumn(label: Text("Id")),
                DataColumn(label: Text("Driver Name")),
                DataColumn(
                  label: Text("Front Image"),
                ),
                DataColumn(label: Text("Chase Number Image")),
                DataColumn(label: Text("RC Book Front")),
                DataColumn(label: Text("RC Book back")),
                DataColumn(
                  label: Text('Insurance'),
                ),
                DataColumn(
                  label: Text('FC Copy'),
                ),
                DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: carDoc
                  .map((e) => DataRow(cells: [
                        DataCell(CustomText(
                          text: (e['id']),
                          size: 12,
                          weight: FontWeight.normal,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                          text: (e['name']),
                          size: 12,
                          weight: FontWeight.normal,
                          color: Colors.black,
                        )),
                        DataCell(Container(
                            decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: active, width: .5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: CustomText(
                              text: (e["frontimg"]),
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                              size: 12,
                            ))),
                        DataCell(Container(
                            decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: active, width: .5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: CustomText(
                              text: (e["chaseimg"]),
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                              size: 12,
                            ))),
                        DataCell(Container(
                            decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: active, width: .5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: CustomText(
                              text: (e["rcfront"]),
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                              size: 12,
                            ))),
                        DataCell(Container(
                            decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: active, width: .5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: CustomText(
                              text: (e["rcback"]),
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                              size: 12,
                            ))),
                        DataCell(Container(
                            decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: active, width: .5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: CustomText(
                              text: (e["insurance"]),
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                              size: 12,
                            ))),
                        DataCell(Container(
                            decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: active, width: .5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: CustomText(
                              text: (e["fccopy"]),
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                              size: 12,
                            ))),
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
