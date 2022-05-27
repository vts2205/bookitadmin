import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/model/car_documents_list_model.dart';
import 'package:bookitadminpanel/model/driver_documents_list_model.dart';
import 'package:bookitadminpanel/model/owner_documents_list_model.dart';
import 'package:bookitadminpanel/services/apiservices.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerDocumentPage extends StatefulWidget {
  const OwnerDocumentPage({Key key}) : super(key: key);

  @override
  State<OwnerDocumentPage> createState() => _OwnerDocumentPageState();
}

class _OwnerDocumentPageState extends State<OwnerDocumentPage> {
  OwnerDocumentsListModel ownerDocumentsListModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    ownerDocumentsListModel = (await APIService().ownerDocumentsList());
    if (ownerDocumentsListModel != null) {
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
                      label: Text("Aadhaar Front"),
                    ),
                    DataColumn(label: Text("Aadhaar Back")),
                    DataColumn(label: Text("Pan Card")),
                    DataColumn(label: Text("Passbook")),
                    DataColumn(
                      label: Text('Rental Agreement 1'),
                    ),
                    DataColumn(
                      label: Text('Rental Agreement 2'),
                    ),
                    // DataColumn(
                    //   label: Text('Action'),
                    // ),
                  ],
                  rows: ownerDocumentsListModel.body
                      .map((e) => DataRow(cells: [
                            DataCell(CustomText(
                              text: (e.driverDriverDriverId),
                              size: 12,
                              weight: FontWeight.normal,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.driverDriverName),
                              size: 12,
                              weight: FontWeight.normal,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.driverDriverContact),
                              size: 12,
                              weight: FontWeight.normal,
                              color: Colors.black,
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
                              child: Image.network(e.panCard),
                            )),
                            DataCell(Container(
                              width: 50,
                              height: 50,
                              child: Image.network(e.passbook ?? ''),
                            )),
                            DataCell(Container(
                              width: 50,
                              height: 50,
                              child: Image.network(e.rentalAgreement1 ?? ''),
                            )),
                            DataCell(Container(
                              width: 50,
                              height: 50,
                              child: Image.network(e.rentalAgreement2 ?? ''),
                            )),
                          ]))
                      .toList()),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
