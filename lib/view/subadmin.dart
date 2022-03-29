import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubAdminPage extends StatelessWidget {
  SubAdminPage({Key key}) : super(key: key);

  final List<Map<String, String>> subadmininfo = [
    {
      "id": "001",
      "name": "nivy",
      "phone": "6382136565",
      "designation": "Manager",
      "email": "nivy@gmail.com",
      "password": "nivy123",
      "action": "block"
    },
    {
      "id": "002",
      "name": "priya",
      "phone": "7867997754",
      "designation": "Manager",
      "email": "priya@gmail.com",
      "password": "priya123",
      "action": "block"
    },
    {
      "id": "003",
      "name": "arun",
      "phone": "6382136556",
      "designation": "manager",
      "email": "arun@gmail.com",
      "password": "arun123",
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: blue,
                ),
                child: IconButton(
                    onPressed: () {
                      buildAddSubAdmin();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              )),
          Expanded(
              child: ListView(
            children: [buildSubAdminTable()],
          ))
        ],
      ),
    );
  }

  buildAddSubAdmin() {
    return Get.defaultDialog(
        title: "Sub-Admin",
        titleStyle:
            TextStyle(color: blue, fontSize: 15, fontWeight: FontWeight.w900),
        radius: 5,
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: blue, padding: const EdgeInsets.all(15)),
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "Add",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ))
        ],
        content: Column(children: [
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
                hintText: "Enter Designation",
                border: const OutlineInputBorder(),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: green))),
          ),
          const SizedBox(height: 10),
          TextField(
            cursorColor: green,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: "Enter Email Address",
                border: const OutlineInputBorder(),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: green))),
          ),
          const SizedBox(height: 10),
          TextField(
            cursorColor: green,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: "Enter Password",
                border: const OutlineInputBorder(),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: green))),
          )
        ]));
  }

  buildSubAdminTable() {
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
              DataColumn(label: Text("Phone Number")),
              DataColumn(
                label: Text('Designation'),
              ),
              DataColumn(label: Text("Email")),
              DataColumn(
                label: Text('Password'),
              ),
              DataColumn(
                label: Text('Action'),
              ),
            ],
            rows: subadmininfo
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
                        text: (e["phone"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["designation"]),
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
                        text: (e["password"]),
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
                            text: (e["action"]),
                            color: active.withOpacity(.7),
                            weight: FontWeight.bold,
                            size: 12,
                          ))),
                    ]))
                .toList()));
  }
}
