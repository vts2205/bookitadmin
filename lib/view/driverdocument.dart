import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/model/car_documents_list_model.dart';
import 'package:bookitadminpanel/model/driver_documents_list_model.dart';
import 'package:bookitadminpanel/services/apiservices.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverDocumentPage extends StatefulWidget {
  const DriverDocumentPage({Key key}) : super(key: key);

  @override
  State<DriverDocumentPage> createState() => _DriverDocumentPageState();
}

class _DriverDocumentPageState extends State<DriverDocumentPage> {
  DriverDocumentsListModel driverDocumentsListModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    driverDocumentsListModel = (await APIService().driverDocumentsList());
    if (driverDocumentsListModel != null) {
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
        child: Visibility(
          visible: isLoading,
          child: isLoading == false
              ? Container()
              : DataTable2(
                  columnSpacing: 5,
                  horizontalMargin: 12,
                  minWidth: 600,
                  columns: const [
                    DataColumn(label: Text("Id")),
                    DataColumn(label: Text("Driver Name")),
                    DataColumn(label: Text("Driver Contact")),
                    DataColumn(
                      label: Text("Profile Image"),
                    ),
                    DataColumn(label: Text("Aadhaar Front")),
                    DataColumn(label: Text("Aadhaar Back")),
                    DataColumn(label: Text("License Front")),
                    DataColumn(
                      label: Text('License Back'),
                    ),
                    // DataColumn(
                    //   label: Text('Action'),
                    // ),
                  ],
                  rows: driverDocumentsListModel.body
                      .map((e) => DataRow(cells: [
                            DataCell(CustomText(
                              text: (e.driverDriverId),
                              size: 12,
                              weight: FontWeight.normal,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.driverName),
                              size: 12,
                              weight: FontWeight.normal,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.driverContact),
                              size: 12,
                              weight: FontWeight.normal,
                              color: Colors.black,
                            )),
                            DataCell(Container(
                              width: 50,
                              height: 50,
                              child: Image.network(e.profilePic),
                            )),
                            DataCell(Container(
                              width: 50,
                              height: 50,
                              child: Image.network(e.aadharFront),
                            )),
                            DataCell(Container(
                              width: 50,
                              height: 50,
                              child: Image.network(e.aadharBack),
                            )),
                            DataCell(Container(
                              width: 50,
                              height: 50,
                              child: Image.network(e.licenseFront),
                            )),
                            DataCell(Container(
                              width: 50,
                              height: 50,
                              child: Image.network(e.licenseBack),
                            )),
                          ]))
                      .toList()),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
