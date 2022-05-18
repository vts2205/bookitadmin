import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/model/driver_list_model.dart';
import 'package:bookitadminpanel/services/apiservices.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DriversPage extends StatefulWidget {
  DriversPage({Key key}) : super(key: key);

  @override
  State<DriversPage> createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  // DriverListModel driverListModel;
  //
  // var isLoading = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }
  //
  // getData() async {
  //   driverListModel = (await APIService().driverList());
  //   if (driverListModel != null) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //   }
  // }
  //
  // final box = GetStorage();

  final List<Map<String, String>> driverInfo = [
    {
      "id": "1",
      "name": "nivy",
      "no": "6382136965",
      "ownername": "priya",
      "ownerno": "7867997754",
      "location": "Coimbatore",
      "license": "abdc123",
      "expirydate": "21/05/2025"
    }
  ];
  final List<Map<String, String>> carDoc = [
    {
      "id": "1",
      "frontimg": "view",
      "chaseimg": "view",
      "rcfront": "view",
      "rcback": "view",
      "insurance": "view",
      "fccopy": "view"
    }
  ];

  final List<Map<String, String>> driverDoc = [
    {
      "id": "1",
      "profileimg": "view",
      "licencefront": "view",
      "licenceback": "view",
      "aadhaarfront": "view",
      "aadhaarback": "view"
    }
  ];

  final List<Map<String, String>> ownerDoc = [
    {
      "id": "1",
      "aadhaarfront": "view",
      "aadhaarback": "view",
      "pan": "view",
      "passbook": "view",
      "rentalagre1": "view",
      "rentalagre2": "view"
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
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  // buildAddDriverLarge(context)
                  // else
                  // buildAddDriverLarge(context)
                  //else
                  //buildAddDriverSmall(context),
                  const SizedBox(height: 50),
              const Divider(thickness: 2),
              const SizedBox(height: 50),
              //buildDriverShimmer()
              Text(
                'Add Driver',
                style: TextStyle(
                    fontSize: 20, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              buildDriversTable(),
              Text(
                'Car Document',
                style: TextStyle(
                    fontSize: 20, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              buildCarDocTable(),
              Text(
                'Driver Document',
                style: TextStyle(
                    fontSize: 20, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              buildDriverDocTable(),
              Text(
                'Owner Document',
                style: TextStyle(
                    fontSize: 20, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              buildOwnerDocTable()
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

  // buildAddDriverLarge(BuildContext context) {
  //   return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //     Text(
  //       'Add Driver',
  //       style:
  //           TextStyle(fontSize: 20, color: blue, fontWeight: FontWeight.bold),
  //     ),
  //     const SizedBox(height: 20),
  //     Row(
  //       children: [
  //         Expanded(
  //           child: TextFormField(
  //             controller: name,
  //             cursorColor: green,
  //             decoration: InputDecoration(
  //                 contentPadding: const EdgeInsets.all(10),
  //                 hintText: "Enter Name",
  //                 border: const OutlineInputBorder(),
  //                 focusedBorder:
  //                     OutlineInputBorder(borderSide: BorderSide(color: green))),
  //           ),
  //         ),
  //         const SizedBox(width: 10),
  //         Expanded(
  //           child: TextFormField(
  //             controller: email,
  //             cursorColor: green,
  //             decoration: InputDecoration(
  //                 contentPadding: const EdgeInsets.all(10),
  //                 hintText: "Enter Email",
  //                 border: const OutlineInputBorder(),
  //                 focusedBorder:
  //                     OutlineInputBorder(borderSide: BorderSide(color: green))),
  //           ),
  //         ),
  //         const SizedBox(width: 10),
  //         Expanded(
  //           child: TextFormField(
  //             controller: phone,
  //             cursorColor: green,
  //             decoration: InputDecoration(
  //                 contentPadding: const EdgeInsets.all(10),
  //                 hintText: "Enter Phone Number",
  //                 border: const OutlineInputBorder(),
  //                 focusedBorder:
  //                     OutlineInputBorder(borderSide: BorderSide(color: green))),
  //           ),
  //         ),
  //       ],
  //     ),
  //     const SizedBox(height: 20),
  //     Row(
  //       children: [
  //         Expanded(
  //           child: TextFormField(
  //             controller: location,
  //             cursorColor: green,
  //             decoration: InputDecoration(
  //                 contentPadding: const EdgeInsets.all(10),
  //                 hintText: "Enter Location",
  //                 border: const OutlineInputBorder(),
  //                 focusedBorder:
  //                     OutlineInputBorder(borderSide: BorderSide(color: green))),
  //           ),
  //         ),
  //         const SizedBox(width: 10),
  //         Expanded(
  //           child: TextField(
  //             cursorColor: green,
  //             decoration: InputDecoration(
  //                 contentPadding: const EdgeInsets.all(10),
  //                 hintText: "Enter Licence Number",
  //                 border: const OutlineInputBorder(),
  //                 focusedBorder:
  //                     OutlineInputBorder(borderSide: BorderSide(color: green))),
  //           ),
  //         ),
  //         const SizedBox(width: 10),
  //         Expanded(
  //           child: TextField(
  //             cursorColor: green,
  //             decoration: InputDecoration(
  //                 contentPadding: const EdgeInsets.all(10),
  //                 hintText: "Enter Licence Expiry date",
  //                 border: const OutlineInputBorder(),
  //                 focusedBorder:
  //                     OutlineInputBorder(borderSide: BorderSide(color: green))),
  //           ),
  //         ),
  //       ],
  //     ),
  //     const SizedBox(height: 20),
  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         const Text(
  //           'Photo :',
  //           style: TextStyle(fontSize: 15),
  //         ),
  //         TextButton(
  //             onPressed: () async {
  //               final result = FilePickerWeb.platform.pickFiles();
  //               if (result == null) return;
  //             },
  //             child: Text(
  //               'Upload',
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   color: green,
  //                   decoration: TextDecoration.underline),
  //             )),
  //         const Text(
  //           'Licence :',
  //           style: TextStyle(fontSize: 15),
  //         ),
  //         TextButton(
  //             onPressed: () async {
  //               final result = FilePickerWeb.platform.pickFiles();
  //               if (result == null) return;
  //             },
  //             child: Text(
  //               'Upload',
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   color: green,
  //                   decoration: TextDecoration.underline),
  //             )),
  //         const Text(
  //           'Aadhaar :',
  //           style: TextStyle(fontSize: 15),
  //         ),
  //         TextButton(
  //             onPressed: () async {
  //               final result = FilePickerWeb.platform.pickFiles();
  //               if (result == null) return;
  //             },
  //             child: Text(
  //               'Upload',
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   color: green,
  //                   decoration: TextDecoration.underline),
  //             )),
  //         const Text(
  //           'Pan :',
  //           style: TextStyle(fontSize: 15),
  //         ),
  //         TextButton(
  //             onPressed: () async {
  //               final result = FilePickerWeb.platform.pickFiles();
  //               if (result == null) return;
  //             },
  //             child: Text(
  //               'Upload',
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   color: green,
  //                   decoration: TextDecoration.underline),
  //             )),
  //         ElevatedButton(
  //             style: ElevatedButton.styleFrom(primary: blue),
  //             onPressed: () async {
  //               var data = await APIService().createDriver(
  //                   name.text, email.text, phone.text, location.text);
  //               if (data['success'] == true) {
  //                 box.write("token", data["token"]);
  //                 print('success');
  //               } else {
  //                 print('failed');
  //                 return null;
  //               }
  //             },
  //             child: Container(
  //               width: MediaQuery.of(context).size.width * 0.20,
  //               height: 45,
  //               padding: const EdgeInsets.all(10),
  //               child: const Center(
  //                 child: Text(
  //                   'Submit',
  //                   style: TextStyle(fontSize: 20, color: Colors.white),
  //                 ),
  //               ),
  //             )),
  //       ],
  //     ),
  //   ]);
  // }
  //
  // buildAddDriverSmall(BuildContext context) {
  //   return Column(children: [
  //     TextField(
  //       cursorColor: green,
  //       decoration: InputDecoration(
  //           contentPadding: const EdgeInsets.all(10),
  //           hintText: "Enter Name",
  //           border: const OutlineInputBorder(),
  //           focusedBorder:
  //               OutlineInputBorder(borderSide: BorderSide(color: green))),
  //     ),
  //     const SizedBox(height: 10),
  //     TextField(
  //       cursorColor: green,
  //       decoration: InputDecoration(
  //           contentPadding: const EdgeInsets.all(10),
  //           hintText: "Enter Email",
  //           border: const OutlineInputBorder(),
  //           focusedBorder:
  //               OutlineInputBorder(borderSide: BorderSide(color: green))),
  //     ),
  //     const SizedBox(height: 10),
  //     TextField(
  //       cursorColor: green,
  //       decoration: InputDecoration(
  //           contentPadding: const EdgeInsets.all(10),
  //           hintText: "Enter Phone Number",
  //           border: const OutlineInputBorder(),
  //           focusedBorder:
  //               OutlineInputBorder(borderSide: BorderSide(color: green))),
  //     ),
  //     const SizedBox(height: 10),
  //     TextField(
  //       cursorColor: green,
  //       decoration: InputDecoration(
  //           contentPadding: const EdgeInsets.all(10),
  //           hintText: "Enter Location",
  //           border: const OutlineInputBorder(),
  //           focusedBorder:
  //               OutlineInputBorder(borderSide: BorderSide(color: green))),
  //     ),
  //     const SizedBox(height: 10),
  //     TextField(
  //       cursorColor: green,
  //       decoration: InputDecoration(
  //           contentPadding: const EdgeInsets.all(10),
  //           hintText: "Enter Licence Number",
  //           border: const OutlineInputBorder(),
  //           focusedBorder:
  //               OutlineInputBorder(borderSide: BorderSide(color: green))),
  //     ),
  //     const SizedBox(height: 10),
  //     TextField(
  //       cursorColor: green,
  //       decoration: InputDecoration(
  //           contentPadding: const EdgeInsets.all(10),
  //           hintText: "Enter Licence Expiry date",
  //           border: const OutlineInputBorder(),
  //           focusedBorder:
  //               OutlineInputBorder(borderSide: BorderSide(color: green))),
  //     ),
  //     const SizedBox(height: 10),
  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         const Text(
  //           'Photo :',
  //           style: TextStyle(fontSize: 12),
  //         ),
  //         TextButton(
  //             onPressed: () async {
  //               final result = FilePickerWeb.platform.pickFiles();
  //               if (result == null) return;
  //             },
  //             child: Text(
  //               'Upload',
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   color: green,
  //                   decoration: TextDecoration.underline),
  //             )),
  //         const Text(
  //           'Licence :',
  //           style: TextStyle(fontSize: 12),
  //         ),
  //         TextButton(
  //             onPressed: () async {
  //               final result = FilePickerWeb.platform.pickFiles();
  //               if (result == null) return;
  //             },
  //             child: Text(
  //               'Upload',
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   color: green,
  //                   decoration: TextDecoration.underline),
  //             ))
  //       ],
  //     ),
  //     const SizedBox(height: 10),
  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         const Text(
  //           'Aadhaar :',
  //           style: TextStyle(fontSize: 12),
  //         ),
  //         TextButton(
  //             onPressed: () async {
  //               final result = FilePickerWeb.platform.pickFiles();
  //               if (result == null) return;
  //             },
  //             child: Text(
  //               'Upload',
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   color: green,
  //                   decoration: TextDecoration.underline),
  //             )),
  //         const Text(
  //           'Pan :',
  //           style: TextStyle(fontSize: 12),
  //         ),
  //         TextButton(
  //             onPressed: () async {
  //               final result = FilePickerWeb.platform.pickFiles();
  //               if (result == null) return;
  //             },
  //             child: Text(
  //               'Upload',
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   color: green,
  //                   decoration: TextDecoration.underline),
  //             ))
  //       ],
  //     ),
  //     const SizedBox(height: 20),
  //     Center(
  //       child: ElevatedButton(
  //           style: ElevatedButton.styleFrom(primary: blue),
  //           onPressed: () {},
  //           child: Container(
  //             width: MediaQuery.of(context).size.width * 0.20,
  //             height: 45,
  //             padding: const EdgeInsets.all(10),
  //             child: const Center(
  //               child: Text(
  //                 'Submit',
  //                 style: TextStyle(fontSize: 20, color: Colors.white),
  //               ),
  //             ),
  //           )),
  //     ),
  //   ]);
  // }

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
                // DataColumn(
                //   label: Text('Rating'),
                // ),
                // DataColumn(
                //   label: Text('Wallet'),
                // ),
                // DataColumn(
                //   label: Text('Aadhaar'),
                // ),
                // DataColumn(
                //   label: Text('Pan'),
                // ),
                DataColumn(
                  label: Text('Licence'),
                ),
                DataColumn(
                  label: Text('Expiry Date'),
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
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.green.shade100,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ))),
                            const SizedBox(width: 5),
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.red.shade100,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ))),
                          ],
                        ))
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
                        //       text: (e.),
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
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["aadhaar"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["pan"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["licence"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e.status.toString()),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                      ]))
                  .toList()),
      // replacement: const Center(
      //   child: CircularProgressIndicator(),
      // ),
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
                DataColumn(
                  label: Text("Front Image"),
                ),
                DataColumn(label: Text("Chase Number Image")),
                DataColumn(label: Text("RC Book Front")),
                DataColumn(label: Text("RC Book back")),
                DataColumn(
                  label: Text('Insurance'),
                ),
                // DataColumn(
                //   label: Text('Rating'),
                // ),
                // DataColumn(
                //   label: Text('Wallet'),
                // ),
                // DataColumn(
                //   label: Text('Aadhaar'),
                // ),
                // DataColumn(
                //   label: Text('Pan'),
                // ),
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
                        DataCell(Row(
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.green.shade100,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ))),
                            const SizedBox(width: 5),
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.red.shade100,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ))),
                          ],
                        ))
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
                        //       text: (e.),
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
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["aadhaar"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["pan"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["licence"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e.status.toString()),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                      ]))
                  .toList()),
      // replacement: const Center(
      //   child: CircularProgressIndicator(),
      // ),
    );
  }

  buildDriverDocTable() {
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
                DataColumn(
                  label: Text("Profile Image"),
                ),
                DataColumn(label: Text("Licence Front")),
                DataColumn(label: Text("Licence Back")),
                DataColumn(label: Text("Aadhaar Front")),
                DataColumn(
                  label: Text('Aadhaar Back'),
                ),
                // DataColumn(
                //   label: Text('Rating'),
                // ),
                // DataColumn(
                //   label: Text('Wallet'),
                // ),
                // DataColumn(
                //   label: Text('Aadhaar'),
                // ),
                // DataColumn(
                //   label: Text('Pan'),
                // ),
                // DataColumn(
                //   label: Text('FC Copy'),
                // ),
                DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: driverDoc
                  .map((e) => DataRow(cells: [
                        DataCell(CustomText(
                          text: (e['id']),
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
                              text: (e["profileimg"]),
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
                              text: (e["licencefront"]),
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
                              text: (e["licenceback"]),
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
                              text: (e["aadhaarfront"]),
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
                              text: (e["aadhaarback"]),
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                              size: 12,
                            ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["fccopy"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        DataCell(Row(
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.green.shade100,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ))),
                            const SizedBox(width: 5),
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.red.shade100,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ))),
                          ],
                        ))
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
                        //       text: (e.),
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
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["aadhaar"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["pan"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["licence"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e.status.toString()),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                      ]))
                  .toList()),
      // replacement: const Center(
      //   child: CircularProgressIndicator(),
      // ),
    );
  }

  buildOwnerDocTable() {
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
                DataColumn(
                  label: Text("Aadhaar Front"),
                ),
                DataColumn(label: Text("Aadhaar Back")),
                DataColumn(label: Text("pan")),
                DataColumn(label: Text("Passbook")),
                DataColumn(
                  label: Text('Rental Agreement 1st Page'),
                ),
                // DataColumn(
                //   label: Text('Rating'),
                // ),
                // DataColumn(
                //   label: Text('Wallet'),
                // ),
                // DataColumn(
                //   label: Text('Aadhaar'),
                // ),
                // DataColumn(
                //   label: Text('Pan'),
                // ),
                DataColumn(
                  label: Text('Rental Agreement 2nd Page'),
                ),
                DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: ownerDoc
                  .map((e) => DataRow(cells: [
                        DataCell(CustomText(
                          text: (e['id']),
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
                              text: (e["aadhaarfront"]),
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
                              text: (e["aadhaarback"]),
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
                              text: (e["passbook"]),
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
                              text: (e["rentalagre1"]),
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
                              text: (e["rentalagre1"]),
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                              size: 12,
                            ))),
                        DataCell(Row(
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.green.shade100,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ))),
                            const SizedBox(width: 5),
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.red.shade100,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ))),
                          ],
                        ))
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
                        //       text: (e.),
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
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["aadhaar"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["pan"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e["licence"]),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                        // DataCell(Container(
                        //     decoration: BoxDecoration(
                        //       color: light,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: active, width: .5),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //     child: CustomText(
                        //       text: (e.status.toString()),
                        //       color: active.withOpacity(.7),
                        //       weight: FontWeight.bold,
                        //       size: 12,
                        //     ))),
                      ]))
                  .toList()),
      // replacement: const Center(
      //   child: CircularProgressIndicator(),
      // ),
    );
  }
}
