import 'dart:io';

import 'package:bookitadminpanel/api/PdfInvoiceApi.dart';
import 'package:bookitadminpanel/api/pdf_api.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/model/customer.dart';
import 'package:bookitadminpanel/model/invoice.dart';
import 'package:bookitadminpanel/model/supplier.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:bookitadminpanel/widgets/shimmerwidget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class CompletedRides extends StatelessWidget {
  CompletedRides({Key key}) : super(key: key);

  final List<Map<String, String>> completeinfo = [
    {
      "from": "31/05/2021",
      "to": "04/06/2021",
      "userid": "001",
      "driverid": "002",
      "pickup": "coimbatore",
      "drop": "thiruvarur",
      "package": "local",
      "cab": "Mini",
      "km": "10",
      "amount": "100",
      "otp1": "1234",
      "otp2": "1234",
      "feedback": "good",
      "invoice": "Download"
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
                      text: "Rides Completed",
                      size: 20,
                      weight: FontWeight.bold,
                      color: green,
                    )),
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                buildRideCompletedTable()
                //buildRideCompleteShimmer()
              ],
            )),
          ],
        ),
      ),
    );
  }

  buildRideCompletedTable() {
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
              DataColumn(label: Text('KM')),
              DataColumn(label: Text('Amount')),
              DataColumn(label: Text('Start OTP')),
              DataColumn(label: Text('End OTP')),
              DataColumn(label: Text('Feedback')),
              DataColumn(label: Text('Invoice')),
            ],
            rows: completeinfo
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
                        text: (e["km"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["amount"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["otp1"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["otp2"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["feedback"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(
                        TextButton(
                          onPressed: () async {
                            final date = DateTime.now();
                            final invoice = Invoice(
                              supplier: const Supplier(
                                name: 'Bookit Cabs',
                                address: 'Address',
                              ),
                              customer: const Customer(
                                name: 'Nivy',
                                address: 'Address',
                              ),
                              info: InvoiceInfo(
                                date: date,
                                number: '${DateTime.now().year}-9999',
                              ),
                              items: const [
                                InvoiceItem(
                                  description: 'Base Fare',
                                  unitPrice: 1305,
                                ),
                                InvoiceItem(
                                  description: 'Fare for remaining km',
                                  unitPrice: 100,
                                ),
                                InvoiceItem(
                                  description: 'Convenience Fee',
                                  unitPrice: 5,
                                ),
                                InvoiceItem(
                                  description: 'Taxes & Fees',
                                  unitPrice: 100,
                                ),
                              ],
                            );
                            final pdfFile =
                                await PdfInvoiceApi.generate(invoice);

                            PdfApi.openFile(pdfFile);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: light,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: active, width: .5),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              child: CustomText(
                                text: (e["invoice"]),
                                color: active.withOpacity(.7),
                                weight: FontWeight.bold,
                                size: 12,
                              )),
                        ),
                      ),
                    ]))
                .toList()),
      ),
    );
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  buildRideCompleteShimmer() {
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
            rows: completeinfo
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
