import 'dart:io';
import 'dart:typed_data';

import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/model/sub_admin_list_model.dart';
import 'package:bookitadminpanel/services/apiservices.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SubAdminPage extends StatefulWidget {
  SubAdminPage({Key key}) : super(key: key);

  @override
  State<SubAdminPage> createState() => _SubAdminPageState();
}

class _SubAdminPageState extends State<SubAdminPage> {
  final name = TextEditingController();
  final phonenumber = TextEditingController();
  final designation = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final box = GetStorage();

  SubAdminListModel subAdminList;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    subAdminList = (await APIService().subAdminList());
    if (subAdminList != null) {
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
          Expanded(
              child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  buildAddSubAdminLarge(context)
                else
                  buildAddSubAdminLarge(context)
              else
                buildAddSubAdminSmall(context),
              const SizedBox(height: 50),
              const Divider(thickness: 2),
              const SizedBox(height: 50),
              Text(
                'Sub-Admin List',
                style: TextStyle(
                    fontSize: 20, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              buildSubAdminTable()
            ],
          ))
        ],
      ),
    );
  }

  buildAddSubAdminLarge(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Sub-Admin',
          style:
              TextStyle(fontSize: 20, color: blue, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: name,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Name",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: phonenumber,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Phone Number",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: designation,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Designation",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: email,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Email Address",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: password,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Password",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Card(
              child: Row(
                children: [
                  const Text(
                    'Photo :',
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () async {
                        FilePickerResult result;

                        try {
                          result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: [
                              'jpg',
                              'pdf',
                              'doc',
                              'docx',
                              'xls',
                              'xlsx',
                              'txt'
                            ],
                          );
                        } catch (e) {
                          print(e);
                        }

                        if (result != null) {
                          try {
                            String filename = result.files.single.name;
                            print('file.name.......');
                            print(filename);
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            fontSize: 15,
                            color: green,
                            decoration: TextDecoration.underline),
                      )),
                ],
              ),
            ),
            Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: blue),
                    onPressed: () async {
                      var data = await APIService().createSubAdmin(
                        name.text,
                        phonenumber.text,
                        designation.text,
                        email.text,
                        password.text,
                      );
                      if (data['success'] == true) {
                        box.write("token", data["token"]);
                        print('success');
                      } else {
                        print('failed');
                        return null;
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: 45,
                      padding: const EdgeInsets.all(10),
                      child: const Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )))
          ],
        )
      ],
    );
  }

  buildAddSubAdminSmall(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Sub-Admin',
          style:
              TextStyle(fontSize: 20, color: blue, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: name,
          cursorColor: green,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Enter Name",
              border: const OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: green))),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: phonenumber,
          cursorColor: green,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Enter Phone Number",
              border: const OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: green))),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: designation,
          cursorColor: green,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Enter Designation",
              border: const OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: green))),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: email,
          cursorColor: green,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Enter Email Address",
              border: const OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: green))),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: password,
          cursorColor: green,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Enter Password",
              border: const OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: green))),
        ),
        const SizedBox(height: 10),
        Card(
          child: Row(
            children: [
              const Text(
                'Photo :',
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                  onPressed: () async {
                    final result = FilePickerWeb.platform.pickFiles();
                    if (result == null) return;
                  },
                  child: Text(
                    'Upload',
                    style: TextStyle(
                        fontSize: 20,
                        color: green,
                        decoration: TextDecoration.underline),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: blue),
              onPressed: () async {
                var data = await APIService().createSubAdmin(
                    name.text,
                    phonenumber.text,
                    designation.text,
                    email.text,
                    password.text);
                if (data['success'] == true) {
                  box.write("token", data["token"]);
                  print('success');
                } else {
                  print('failed');
                  return null;
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.30,
                height: 45,
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )),
        )
      ],
    );
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
        child: Visibility(
          visible: isLoading,
          child: isLoading == false
              ? Container()
              : DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  columns: const [
                    DataColumn(label: Text("ID")),
                    DataColumn(label: Text("Image")),
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
                  rows: subAdminList.userValue
                      .map((e) => DataRow(cells: [
                            DataCell(CustomText(
                              text: (e.id.toString()),
                              size: 12,
                              weight: FontWeight.normal,
                              color: Colors.black,
                            )),
                            DataCell(CircleAvatar(
                              radius: 20,
                              child: CustomText(
                                text: (e.image),
                                size: 12,
                                weight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            )),
                            DataCell(CustomText(
                              text: (e.name),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.phonenumber),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.designation),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.email),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.passwordText),
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
                                  text: (e.status.toString()),
                                  color: active.withOpacity(.7),
                                  weight: FontWeight.bold,
                                  size: 12,
                                ))),
                          ]))
                      .toList()),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
