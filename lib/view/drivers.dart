import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:bookitadminpanel/widgets/shimmerwidget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

class DriversPage extends StatelessWidget {
  DriversPage({Key key}) : super(key: key);

  final List<Map<String, String>> driversinfo = [
    {
      "id": "001",
      "name": "nivy",
      "email": "nivy@gmail.com",
      "phone": "6382136565",
      "location": "thiruvarur",
      "rating": "4.5",
      "wallet": "2000",
      "aadhaar": "pdf",
      "pan": "pdf",
      "rcbook": "pdf",
      "licence": "pdf",
      "action": "block"
    },
    {
      "id": "002",
      "name": "priya",
      "email": "priya@gmail.com",
      "phone": "7867997754",
      "location": "coimbatore",
      "rating": "4.7",
      "wallet": "2500",
      "aadhaar": "pdf",
      "pan": "pdf",
      "rcbook": "pdf",
      "licence": "pdf",
      "action": "block"
    },
    {
      "id": "003",
      "name": "arun",
      "email": "arun@gmail.com",
      "phone": "6382136556",
      "location": "cbe",
      "rating": "4.3",
      "wallet": "1000",
      "aadhaar": "pdf",
      "pan": "pdf",
      "rcbook": "pdf",
      "licence": "pdf",
      "action": "block"
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
            child: buildSearchBar(),
          ),
          Expanded(
              child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  buildAddDriverLarge(context)
                else
                  buildAddDriverLarge(context)
              else
                buildAddDriverSmall(context),
              const SizedBox(height: 50),
              const Divider(thickness: 2),
              const SizedBox(height: 50),
              //buildDriverShimmer()
              Text(
                'Driver List',
                style: TextStyle(
                    fontSize: 20, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              buildDriversTable()
            ],
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

  buildAddDriverLarge(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Add Driver',
        style:
            TextStyle(fontSize: 20, color: blue, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: green,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Enter Name",
                  border: const OutlineInputBorder(),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green))),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              cursorColor: green,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Enter Email",
                  border: const OutlineInputBorder(),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green))),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              cursorColor: green,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Enter Phone Number",
                  border: const OutlineInputBorder(),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green))),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: green,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Enter Location",
                  border: const OutlineInputBorder(),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green))),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              cursorColor: green,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Enter Licence Number",
                  border: const OutlineInputBorder(),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green))),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              cursorColor: green,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Enter Licence Expiry date",
                  border: const OutlineInputBorder(),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green))),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Photo :',
            style: TextStyle(fontSize: 15),
          ),
          TextButton(
              onPressed: () async {
                final result = FilePickerWeb.platform.pickFiles();
                if (result == null) return;
              },
              child: Text(
                'Upload',
                style: TextStyle(
                    fontSize: 15,
                    color: green,
                    decoration: TextDecoration.underline),
              )),
          const Text(
            'Licence :',
            style: TextStyle(fontSize: 15),
          ),
          TextButton(
              onPressed: () async {
                final result = FilePickerWeb.platform.pickFiles();
                if (result == null) return;
              },
              child: Text(
                'Upload',
                style: TextStyle(
                    fontSize: 15,
                    color: green,
                    decoration: TextDecoration.underline),
              )),
          const Text(
            'Aadhaar :',
            style: TextStyle(fontSize: 15),
          ),
          TextButton(
              onPressed: () async {
                final result = FilePickerWeb.platform.pickFiles();
                if (result == null) return;
              },
              child: Text(
                'Upload',
                style: TextStyle(
                    fontSize: 15,
                    color: green,
                    decoration: TextDecoration.underline),
              )),
          const Text(
            'Pan :',
            style: TextStyle(fontSize: 15),
          ),
          TextButton(
              onPressed: () async {
                final result = FilePickerWeb.platform.pickFiles();
                if (result == null) return;
              },
              child: Text(
                'Upload',
                style: TextStyle(
                    fontSize: 15,
                    color: green,
                    decoration: TextDecoration.underline),
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: blue),
              onPressed: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: 45,
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )),
        ],
      ),
    ]);
  }

  buildAddDriverSmall(BuildContext context) {
    return Column(children: [
      TextField(
        cursorColor: green,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: "Enter Name",
            border: const OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: green))),
      ),
      const SizedBox(height: 10),
      TextField(
        cursorColor: green,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: "Enter Email",
            border: const OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: green))),
      ),
      const SizedBox(height: 10),
      TextField(
        cursorColor: green,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: "Enter Phone Number",
            border: const OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: green))),
      ),
      const SizedBox(height: 10),
      TextField(
        cursorColor: green,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: "Enter Location",
            border: const OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: green))),
      ),
      const SizedBox(height: 10),
      TextField(
        cursorColor: green,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: "Enter Licence Number",
            border: const OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: green))),
      ),
      const SizedBox(height: 10),
      TextField(
        cursorColor: green,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: "Enter Licence Expiry date",
            border: const OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: green))),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Photo :',
            style: TextStyle(fontSize: 12),
          ),
          TextButton(
              onPressed: () async {
                final result = FilePickerWeb.platform.pickFiles();
                if (result == null) return;
              },
              child: Text(
                'Upload',
                style: TextStyle(
                    fontSize: 15,
                    color: green,
                    decoration: TextDecoration.underline),
              )),
          const Text(
            'Licence :',
            style: TextStyle(fontSize: 12),
          ),
          TextButton(
              onPressed: () async {
                final result = FilePickerWeb.platform.pickFiles();
                if (result == null) return;
              },
              child: Text(
                'Upload',
                style: TextStyle(
                    fontSize: 15,
                    color: green,
                    decoration: TextDecoration.underline),
              ))
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Aadhaar :',
            style: TextStyle(fontSize: 12),
          ),
          TextButton(
              onPressed: () async {
                final result = FilePickerWeb.platform.pickFiles();
                if (result == null) return;
              },
              child: Text(
                'Upload',
                style: TextStyle(
                    fontSize: 15,
                    color: green,
                    decoration: TextDecoration.underline),
              )),
          const Text(
            'Pan :',
            style: TextStyle(fontSize: 12),
          ),
          TextButton(
              onPressed: () async {
                final result = FilePickerWeb.platform.pickFiles();
                if (result == null) return;
              },
              child: Text(
                'Upload',
                style: TextStyle(
                    fontSize: 15,
                    color: green,
                    decoration: TextDecoration.underline),
              ))
        ],
      ),
      const SizedBox(height: 20),
      Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: blue),
            onPressed: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.20,
              height: 45,
              padding: const EdgeInsets.all(10),
              child: const Center(
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )),
      ),
    ]);
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
        child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: const [
              DataColumn(label: Text("ID")),
              DataColumn(
                label: Text("Name"),
              ),
              DataColumn(label: Text("Email")),
              DataColumn(label: Text("Phone Number")),
              DataColumn(
                label: Text('Location'),
              ),
              DataColumn(
                label: Text('Rating'),
              ),
              DataColumn(
                label: Text('Wallet'),
              ),
              DataColumn(
                label: Text('Aadhaar'),
              ),
              DataColumn(
                label: Text('Pan'),
              ),
              DataColumn(
                label: Text('RC Book'),
              ),
              DataColumn(
                label: Text('Licence'),
              ),
              DataColumn(
                label: Text('Action'),
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
                        text: (e["email"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["phone"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["location"]),
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
                            text: (e["rating"]),
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
                      DataCell(Container(
                          decoration: BoxDecoration(
                            color: light,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: active, width: .5),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: CustomText(
                            text: (e["aadhaar"]),
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
                            text: (e["pan"]),
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
                            text: (e["rcbook"]),
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
                            text: (e["licence"]),
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
                            text: (e["action"]),
                            color: active.withOpacity(.7),
                            weight: FontWeight.bold,
                            size: 12,
                          ))),
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
