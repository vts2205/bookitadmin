import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/model/add_driver_list_model.dart';
import 'package:bookitadminpanel/model/driver_list_model.dart';
import 'package:bookitadminpanel/services/apiservices.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:http/http.dart' as http;

class DriversPage extends StatefulWidget {
  DriversPage({Key key}) : super(key: key);

  @override
  State<DriversPage> createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  AddDriverListModel addDriverListModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    addDriverListModel = (await APIService().addDriverList());
    if (addDriverListModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  Future<void> downloadImage(String imageUrl) async {
    try {
      // first we make a request to the url like you did
      // in the android and ios version
      final http.Response r = await http.get(
        Uri.parse('https://www.pexels.com/photo/clear-glass-sphere-302743/'),
      );

      // we get the bytes from the body
      final data = r.bodyBytes;
      // and encode them to base64
      final base64data = base64Encode(data);

      // then we create and AnchorElement with the html package
      final a = html.AnchorElement(href: 'data:image/jpeg;base64,$base64data');

      // set the name of the file we want the image to get
      // downloaded to
      a.download = 'front image.jpg';

      // and we click the AnchorElement which downloads the image
      a.click();
      // finally we remove the AnchorElement
      a.remove();
    } catch (e) {
      print(e);
    }
  }

  // final box = GetStorage();

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
              // if (ResponsiveWidget.isLargeScreen(context) ||
              //     ResponsiveWidget.isMediumScreen(context))
              //   if (ResponsiveWidget.isCustomSize(context))
              // buildAddDriverLarge(context)
              // else
              // buildAddDriverLarge(context)
              //else
              //buildAddDriverSmall(context),
              //     const SizedBox(height: 50),
              // const Divider(thickness: 2),
              // const SizedBox(height: 50),
              //buildDriverShimmer()
              buildAddDriver(),
              //buildListView()
              // Text(
              //   'Add Driver',
              //   style: TextStyle(
              //       fontSize: 20, color: blue, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // buildDriversTable(),
              // Text(
              //   'Car Document',
              //   style: TextStyle(
              //       fontSize: 20, color: blue, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // buildCarDocTable(),
              // Text(
              //   'Driver Document',
              //   style: TextStyle(
              //       fontSize: 20, color: blue, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // buildDriverDocTable(),
              // Text(
              //   'Owner Document',
              //   style: TextStyle(
              //       fontSize: 20, color: blue, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // buildOwnerDocTable()
            ],
          )),
        ],
      ),
    );
  }

  // buildSearchBar() {
  //   return Container(
  //     width: 300,
  //     height: 40,
  //     child: TextField(
  //       cursorColor: green,
  //       decoration: InputDecoration(
  //         contentPadding: const EdgeInsets.all(10),
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
  //         focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(5),
  //             borderSide: BorderSide(color: green)),
  //         suffixIcon: Icon(Icons.search, color: green),
  //         hintText: "Search by ID",
  //       ),
  //     ),
  //   );
  // }

  buildAddDriver() {
    return isLoading == false
        ? Center(
            child: CircularProgressIndicator(
              color: green,
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: addDriverListModel.body.length,
                itemBuilder: (context, index) {
                  var driverList = addDriverListModel.body[index];

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Driver Name :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  Text(addDriverListModel.body[index].name,
                                      style: const TextStyle(fontSize: 17)),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Driver Phone Number :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  Text(addDriverListModel.body[index].contact,
                                      style: const TextStyle(fontSize: 17)),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Owner Name :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  Text(addDriverListModel.body[index].ownerName,
                                      style: const TextStyle(fontSize: 17)),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Owner Phone Number :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  Text(
                                      addDriverListModel
                                          .body[index].ownerNumber,
                                      style: const TextStyle(fontSize: 17)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Location :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  Text(addDriverListModel.body[index].location,
                                      style: const TextStyle(fontSize: 17)),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('License Number :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  Text(
                                      addDriverListModel
                                          .body[index].licenseNumber,
                                      style: const TextStyle(fontSize: 17)),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('License Expiry Date :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  Text(
                                      addDriverListModel.body[index].expiryDate,
                                      style: const TextStyle(fontSize: 17)),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Car Front Image :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        driverList.currentCar.frontImage),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var carUrl =
                                            driverList.currentCar.frontImage ??
                                                '';
                                        testdownload(carUrl);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Chase Number Image :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        driverList.currentCar.chaseImage ?? ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var chaseUrl =
                                            driverList.currentCar.chaseImage ??
                                                '';
                                        testdownload(chaseUrl);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('RC Book Front :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        driverList.currentCar.rcFront ?? ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var rcUrl1 =
                                            driverList.currentCar.rcFront ?? '';
                                        testdownload(rcUrl1);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('RC Book Back :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        driverList.currentCar.rcBack ?? ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var rcUrl2 =
                                            driverList.currentCar.rcBack ?? '';
                                        testdownload(rcUrl2);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Insurance :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        driverList.currentCar.insurance ?? ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var insuranceUrl =
                                            driverList.currentCar.insurance ??
                                                '';
                                        testdownload(insuranceUrl);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('FC Copy :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        driverList.currentCar.fc ?? ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var fcUrl =
                                            driverList.currentCar.fc ?? '';
                                        testdownload(fcUrl);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Profile Photo :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(driverList
                                            .documentDocument.profilePic ??
                                        ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var profileUrl = driverList
                                                .documentDocument.profilePic ??
                                            '';
                                        testdownload(profileUrl);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('License Front :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(driverList
                                            .documentDocument.licenseFront ??
                                        ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var licenseUrl1 = driverList
                                                .documentDocument
                                                .licenseFront ??
                                            '';
                                        testdownload(licenseUrl1);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('License Back :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(driverList
                                            .documentDocument.licenseBack ??
                                        ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var licenseUrl2 = driverList
                                                .documentDocument.licenseBack ??
                                            '';
                                        testdownload(licenseUrl2);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Driver Aadhaar Front :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(driverList
                                            .documentDocument.aadharFront ??
                                        ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var aadhaarUrl1 = driverList
                                                .documentDocument.aadharFront ??
                                            '';
                                        testdownload(aadhaarUrl1);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Driver Aadhaar Back :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(driverList
                                            .documentDocument.aadharBack ??
                                        ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var aadhaarUrl2 = driverList
                                                .documentDocument.aadharBack ??
                                            '';
                                        testdownload(aadhaarUrl2);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Owner Aadhaar Front :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        driverList.driverOwners.aadharFront ??
                                            ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var ownAadhaarUrl2 = driverList
                                                .driverOwners.aadharFront ??
                                            '';
                                        testdownload(ownAadhaarUrl2);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Owner Aadhaar Back :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        driverList.driverOwners.aadharBack ??
                                            ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var ownAadhaarUrl1 = driverList
                                                .driverOwners.aadharBack ??
                                            '';
                                        testdownload(ownAadhaarUrl1);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Owner Pan :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        driverList.driverOwners.panCard ?? ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var panUrl =
                                            driverList.driverOwners.panCard ??
                                                '';
                                        testdownload(panUrl);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Passbook :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        driverList.driverOwners.passbook ?? ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var passbookUrl =
                                            driverList.driverOwners.passbook ??
                                                '';
                                        testdownload(passbookUrl);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Rental Agreement 1st page :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(driverList
                                            .driverOwners.rentalAgreement1 ??
                                        ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var rentalUrl1 = driverList.driverOwners
                                                .rentalAgreement1 ??
                                            '';
                                        testdownload(rentalUrl1);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text('Rental Agreement 2nd page :',
                                      style:
                                          TextStyle(fontSize: 17, color: blue)),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(driverList
                                            .driverOwners.rentalAgreement2 ??
                                        ''),
                                  ),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: green)),
                                      onPressed: () {
                                        var rentalUrl2 = driverList.driverOwners
                                                .rentalAgreement2 ??
                                            '';
                                        testdownload(rentalUrl2);
                                      },
                                      child: const Text('View',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  minimumSize: const Size(300, 50)),
                              onPressed: () async {
                                var data = await APIService()
                                    .driverApproval(driverList.driverId);
                                print(data);
                                if (data['statusCode'] == 1) {
                                  Fluttertoast.showToast(
                                      msg: 'Driver Accepted', fontSize: 18);
                                  print('====success====');
                                } else {
                                  print('====failed====');
                                }
                              },
                              child: const Text(
                                'ACCEPT',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  minimumSize: const Size(300, 50)),
                              onPressed: () async {
                                var data = await APIService()
                                    .driverReject(driverList.driverId);
                                print(data);
                                if (data['statusCode'] == 1) {
                                  Fluttertoast.showToast(
                                      msg: 'Driver Rejected', fontSize: 18);
                                  print('====success====');
                                } else {
                                  print('====failed====');
                                }
                              },
                              child: const Text(
                                'REJECT',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ))
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 2),
                      const SizedBox(height: 10),
                    ],
                  );
                }),
          );
  }
  //
  // Future openFile({@required String url, String fileName}) async {
  //   final file = await downloadFile(url, fileName);
  //   print('fie...........');
  //   print(file.uri);
  //   print(file.path);
  //   // if (file == null) return;
  //   // print('path:${file.path}');
  //   // OpenFile.open(file.path);
  // }

  void testdownload(url) async {
    print('tes download.....');
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }

  // Future<File> downloadFile(String url, name) async {
  //   final appStorage = await getApplicationDocumentsDirectory();
  //   final file = File('${appStorage.path}/$name');
  //
  //   try {
  //     final response = await Dio().get(url,
  //         options: Options(
  //             responseType: ResponseType.bytes,
  //             followRedirects: false,
  //             receiveTimeout: 0));
  //
  //     final raf = file.openSync(mode: FileMode.write);
  //     raf.writeFromSync(response.data);
  //     await raf.close();
  //     return file;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // buildListView() {
  //   return Container(
  //       height: MediaQuery.of(context).size.height,
  //       width: MediaQuery.of(context).size.width,
  //       child: OutlinedButton(
  //           style: OutlinedButton.styleFrom(side: BorderSide(color: green)),
  //           onPressed: () {
  //             testdownload();
  //             // openFile(
  //             //     url:
  //             //         'https://bookitbucket.s3.ap-south-1.amazonaws.com/cars/chaseNumber/driver_3_1653407036760.png',
  //             //     fileName: 'Front Image');
  //           },
  //           child: const Text('View',
  //               style: TextStyle(fontSize: 15, color: Colors.black))));
  // }

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

  // buildDriversTable() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border.all(color: active.withOpacity(.4), width: .5),
  //       boxShadow: [
  //         BoxShadow(
  //             offset: const Offset(0, 6),
  //             color: lightGrey.withOpacity(.1),
  //             blurRadius: 12)
  //       ],
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     padding: const EdgeInsets.all(16),
  //     margin: const EdgeInsets.only(bottom: 30),
  //     child:
  //         // Visibility(
  //         //   visible: isLoading,
  //         //   child: isLoading == false
  //         //       ? Container()
  //         //       :
  //         DataTable2(
  //             columnSpacing: 12,
  //             horizontalMargin: 12,
  //             minWidth: 600,
  //             columns: const [
  //               DataColumn(label: Text("ID")),
  //               DataColumn(
  //                 label: Text("Name"),
  //               ),
  //               DataColumn(label: Text("Phone Number")),
  //               DataColumn(label: Text("Owner Name")),
  //               DataColumn(label: Text("Owner phone Number")),
  //               DataColumn(
  //                 label: Text('Location'),
  //               ),
  //               // DataColumn(
  //               //   label: Text('Rating'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Wallet'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Aadhaar'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Pan'),
  //               // ),
  //               DataColumn(
  //                 label: Text('Licence'),
  //               ),
  //               DataColumn(
  //                 label: Text('Expiry Date'),
  //               ),
  //               DataColumn(
  //                 label: Text('Action'),
  //               ),
  //             ],
  //             rows: driverInfo
  //                 .map((e) => DataRow(cells: [
  //                       DataCell(CustomText(
  //                         text: (e['id']),
  //                         size: 12,
  //                         weight: FontWeight.normal,
  //                         color: Colors.black,
  //                       )),
  //                       DataCell(CustomText(
  //                         text: (e['name']),
  //                         weight: FontWeight.normal,
  //                         size: 12,
  //                         color: Colors.black,
  //                       )),
  //                       DataCell(CustomText(
  //                         text: (e['no']),
  //                         weight: FontWeight.normal,
  //                         size: 12,
  //                         color: Colors.black,
  //                       )),
  //                       DataCell(CustomText(
  //                         text: (e['ownername']),
  //                         weight: FontWeight.normal,
  //                         size: 12,
  //                         color: Colors.black,
  //                       )),
  //                       DataCell(CustomText(
  //                         text: (e['ownerno']),
  //                         weight: FontWeight.normal,
  //                         size: 12,
  //                         color: Colors.black,
  //                       )),
  //                       DataCell(CustomText(
  //                         text: (e['location']),
  //                         weight: FontWeight.normal,
  //                         size: 12,
  //                         color: Colors.black,
  //                       )),
  //                       DataCell(CustomText(
  //                         text: (e['license']),
  //                         weight: FontWeight.normal,
  //                         size: 12,
  //                         color: Colors.black,
  //                       )),
  //                       DataCell(CustomText(
  //                         text: (e['expirydate']),
  //                         weight: FontWeight.normal,
  //                         size: 12,
  //                         color: Colors.black,
  //                       )),
  //                       DataCell(Row(
  //                         children: [
  //                           CircleAvatar(
  //                               radius: 20,
  //                               backgroundColor: Colors.green.shade100,
  //                               child: IconButton(
  //                                   onPressed: () {},
  //                                   icon: const Icon(
  //                                     Icons.check,
  //                                     color: Colors.green,
  //                                   ))),
  //                           const SizedBox(width: 5),
  //                           CircleAvatar(
  //                               radius: 20,
  //                               backgroundColor: Colors.red.shade100,
  //                               child: IconButton(
  //                                   onPressed: () {},
  //                                   icon: const Icon(
  //                                     Icons.clear,
  //                                     color: Colors.red,
  //                                   ))),
  //                         ],
  //                       ))
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
  //                     ]))
  //                 .toList()),
  //     // replacement: const Center(
  //     //   child: CircularProgressIndicator(),
  //     // ),
  //   );
  // }
  //
  // buildCarDocTable() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border.all(color: active.withOpacity(.4), width: .5),
  //       boxShadow: [
  //         BoxShadow(
  //             offset: const Offset(0, 6),
  //             color: lightGrey.withOpacity(.1),
  //             blurRadius: 12)
  //       ],
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     padding: const EdgeInsets.all(16),
  //     margin: const EdgeInsets.only(bottom: 30),
  //     child:
  //         // Visibility(
  //         //   visible: isLoading,
  //         //   child: isLoading == false
  //         //       ? Container()
  //         //       :
  //         DataTable2(
  //             columnSpacing: 12,
  //             horizontalMargin: 12,
  //             minWidth: 600,
  //             columns: const [
  //               DataColumn(label: Text("Id")),
  //               DataColumn(
  //                 label: Text("Front Image"),
  //               ),
  //               DataColumn(label: Text("Chase Number Image")),
  //               DataColumn(label: Text("RC Book Front")),
  //               DataColumn(label: Text("RC Book back")),
  //               DataColumn(
  //                 label: Text('Insurance'),
  //               ),
  //               // DataColumn(
  //               //   label: Text('Rating'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Wallet'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Aadhaar'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Pan'),
  //               // ),
  //               DataColumn(
  //                 label: Text('FC Copy'),
  //               ),
  //               DataColumn(
  //                 label: Text('Action'),
  //               ),
  //             ],
  //             rows: carDoc
  //                 .map((e) => DataRow(cells: [
  //                       DataCell(CustomText(
  //                         text: (e['id']),
  //                         size: 12,
  //                         weight: FontWeight.normal,
  //                         color: Colors.black,
  //                       )),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["frontimg"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["chaseimg"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["rcfront"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["rcback"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["insurance"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["fccopy"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Row(
  //                         children: [
  //                           CircleAvatar(
  //                               radius: 20,
  //                               backgroundColor: Colors.green.shade100,
  //                               child: IconButton(
  //                                   onPressed: () {},
  //                                   icon: const Icon(
  //                                     Icons.check,
  //                                     color: Colors.green,
  //                                   ))),
  //                           const SizedBox(width: 5),
  //                           CircleAvatar(
  //                               radius: 20,
  //                               backgroundColor: Colors.red.shade100,
  //                               child: IconButton(
  //                                   onPressed: () {},
  //                                   icon: const Icon(
  //                                     Icons.clear,
  //                                     color: Colors.red,
  //                                   ))),
  //                         ],
  //                       ))
  //                       // DataCell(Row(
  //                       //   mainAxisSize: MainAxisSize.min,
  //                       //   children: [
  //                       //     const Icon(
  //                       //       Icons.star,
  //                       //       color: Colors.deepOrange,
  //                       //       size: 15,
  //                       //     ),
  //                       //     const SizedBox(
  //                       //       width: 5,
  //                       //     ),
  //                       //     CustomText(
  //                       //       text: (e.),
  //                       //       weight: FontWeight.normal,
  //                       //       size: 12,
  //                       //       color: Colors.black,
  //                       //     )
  //                       //   ],
  //                       // )),
  //                       // DataCell(CustomText(
  //                       //   text: (e["wallet"]),
  //                       //   weight: FontWeight.normal,
  //                       //   size: 12,
  //                       //   color: Colors.black,
  //                       // )),
  //                       // DataCell(Container(
  //                       //     decoration: BoxDecoration(
  //                       //       color: light,
  //                       //       borderRadius: BorderRadius.circular(20),
  //                       //       border: Border.all(color: active, width: .5),
  //                       //     ),
  //                       //     padding: const EdgeInsets.symmetric(
  //                       //         horizontal: 12, vertical: 6),
  //                       //     child: CustomText(
  //                       //       text: (e["aadhaar"]),
  //                       //       color: active.withOpacity(.7),
  //                       //       weight: FontWeight.bold,
  //                       //       size: 12,
  //                       //     ))),
  //                       // DataCell(Container(
  //                       //     decoration: BoxDecoration(
  //                       //       color: light,
  //                       //       borderRadius: BorderRadius.circular(20),
  //                       //       border: Border.all(color: active, width: .5),
  //                       //     ),
  //                       //     padding: const EdgeInsets.symmetric(
  //                       //         horizontal: 12, vertical: 6),
  //                       //     child: CustomText(
  //                       //       text: (e["pan"]),
  //                       //       color: active.withOpacity(.7),
  //                       //       weight: FontWeight.bold,
  //                       //       size: 12,
  //                       //     ))),
  //                       // DataCell(Container(
  //                       //     decoration: BoxDecoration(
  //                       //       color: light,
  //                       //       borderRadius: BorderRadius.circular(20),
  //                       //       border: Border.all(color: active, width: .5),
  //                       //     ),
  //                       //     padding: const EdgeInsets.symmetric(
  //                       //         horizontal: 12, vertical: 6),
  //                       //     child: CustomText(
  //                       //       text: (e["licence"]),
  //                       //       color: active.withOpacity(.7),
  //                       //       weight: FontWeight.bold,
  //                       //       size: 12,
  //                       //     ))),
  //                       // DataCell(Container(
  //                       //     decoration: BoxDecoration(
  //                       //       color: light,
  //                       //       borderRadius: BorderRadius.circular(20),
  //                       //       border: Border.all(color: active, width: .5),
  //                       //     ),
  //                       //     padding: const EdgeInsets.symmetric(
  //                       //         horizontal: 12, vertical: 6),
  //                       //     child: CustomText(
  //                       //       text: (e.status.toString()),
  //                       //       color: active.withOpacity(.7),
  //                       //       weight: FontWeight.bold,
  //                       //       size: 12,
  //                       //     ))),
  //                     ]))
  //                 .toList()),
  //     // replacement: const Center(
  //     //   child: CircularProgressIndicator(),
  //     // ),
  //   );
  // }
  //
  // buildDriverDocTable() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border.all(color: active.withOpacity(.4), width: .5),
  //       boxShadow: [
  //         BoxShadow(
  //             offset: const Offset(0, 6),
  //             color: lightGrey.withOpacity(.1),
  //             blurRadius: 12)
  //       ],
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     padding: const EdgeInsets.all(16),
  //     margin: const EdgeInsets.only(bottom: 30),
  //     child:
  //         // Visibility(
  //         //   visible: isLoading,
  //         //   child: isLoading == false
  //         //       ? Container()
  //         //       :
  //         DataTable2(
  //             columnSpacing: 12,
  //             horizontalMargin: 12,
  //             minWidth: 600,
  //             columns: const [
  //               DataColumn(label: Text("Id")),
  //               DataColumn(
  //                 label: Text("Profile Image"),
  //               ),
  //               DataColumn(label: Text("Licence Front")),
  //               DataColumn(label: Text("Licence Back")),
  //               DataColumn(label: Text("Aadhaar Front")),
  //               DataColumn(
  //                 label: Text('Aadhaar Back'),
  //               ),
  //               // DataColumn(
  //               //   label: Text('Rating'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Wallet'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Aadhaar'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Pan'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('FC Copy'),
  //               // ),
  //               DataColumn(
  //                 label: Text('Action'),
  //               ),
  //             ],
  //             rows: driverDoc
  //                 .map((e) => DataRow(cells: [
  //                       DataCell(CustomText(
  //                         text: (e['id']),
  //                         size: 12,
  //                         weight: FontWeight.normal,
  //                         color: Colors.black,
  //                       )),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["profileimg"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["licencefront"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["licenceback"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["aadhaarfront"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["aadhaarback"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       // DataCell(Container(
  //                       //     decoration: BoxDecoration(
  //                       //       color: light,
  //                       //       borderRadius: BorderRadius.circular(20),
  //                       //       border: Border.all(color: active, width: .5),
  //                       //     ),
  //                       //     padding: const EdgeInsets.symmetric(
  //                       //         horizontal: 12, vertical: 6),
  //                       //     child: CustomText(
  //                       //       text: (e["fccopy"]),
  //                       //       color: active.withOpacity(.7),
  //                       //       weight: FontWeight.bold,
  //                       //       size: 12,
  //                       //     ))),
  //                       DataCell(Row(
  //                         children: [
  //                           CircleAvatar(
  //                               radius: 20,
  //                               backgroundColor: Colors.green.shade100,
  //                               child: IconButton(
  //                                   onPressed: () {},
  //                                   icon: const Icon(
  //                                     Icons.check,
  //                                     color: Colors.green,
  //                                   ))),
  //                           const SizedBox(width: 5),
  //                           CircleAvatar(
  //                               radius: 20,
  //                               backgroundColor: Colors.red.shade100,
  //                               child: IconButton(
  //                                   onPressed: () {},
  //                                   icon: const Icon(
  //                                     Icons.clear,
  //                                     color: Colors.red,
  //                                   ))),
  //                         ],
  //                       ))
  //                       // DataCell(Row(
  //                       //   mainAxisSize: MainAxisSize.min,
  //                       //   children: [
  //                       //     const Icon(
  //                       //       Icons.star,
  //                       //       color: Colors.deepOrange,
  //                       //       size: 15,
  //                       //     ),
  //                       //     const SizedBox(
  //                       //       width: 5,
  //                       //     ),
  //                       //     CustomText(
  //                       //       text: (e.),
  //                       //       weight: FontWeight.normal,
  //                       //       size: 12,
  //                       //       color: Colors.black,
  //                       //     )
  //                       //   ],
  //                       // )),
  //                       // DataCell(CustomText(
  //                       //   text: (e["wallet"]),
  //                       //   weight: FontWeight.normal,
  //                       //   size: 12,
  //                       //   color: Colors.black,
  //                       // )),
  //                       // DataCell(Container(
  //                       //     decoration: BoxDecoration(
  //                       //       color: light,
  //                       //       borderRadius: BorderRadius.circular(20),
  //                       //       border: Border.all(color: active, width: .5),
  //                       //     ),
  //                       //     padding: const EdgeInsets.symmetric(
  //                       //         horizontal: 12, vertical: 6),
  //                       //     child: CustomText(
  //                       //       text: (e["aadhaar"]),
  //                       //       color: active.withOpacity(.7),
  //                       //       weight: FontWeight.bold,
  //                       //       size: 12,
  //                       //     ))),
  //                       // DataCell(Container(
  //                       //     decoration: BoxDecoration(
  //                       //       color: light,
  //                       //       borderRadius: BorderRadius.circular(20),
  //                       //       border: Border.all(color: active, width: .5),
  //                       //     ),
  //                       //     padding: const EdgeInsets.symmetric(
  //                       //         horizontal: 12, vertical: 6),
  //                       //     child: CustomText(
  //                       //       text: (e["pan"]),
  //                       //       color: active.withOpacity(.7),
  //                       //       weight: FontWeight.bold,
  //                       //       size: 12,
  //                       //     ))),
  //                       // DataCell(Container(
  //                       //     decoration: BoxDecoration(
  //                       //       color: light,
  //                       //       borderRadius: BorderRadius.circular(20),
  //                       //       border: Border.all(color: active, width: .5),
  //                       //     ),
  //                       //     padding: const EdgeInsets.symmetric(
  //                       //         horizontal: 12, vertical: 6),
  //                       //     child: CustomText(
  //                       //       text: (e["licence"]),
  //                       //       color: active.withOpacity(.7),
  //                       //       weight: FontWeight.bold,
  //                       //       size: 12,
  //                       //     ))),
  //                       // DataCell(Container(
  //                       //     decoration: BoxDecoration(
  //                       //       color: light,
  //                       //       borderRadius: BorderRadius.circular(20),
  //                       //       border: Border.all(color: active, width: .5),
  //                       //     ),
  //                       //     padding: const EdgeInsets.symmetric(
  //                       //         horizontal: 12, vertical: 6),
  //                       //     child: CustomText(
  //                       //       text: (e.status.toString()),
  //                       //       color: active.withOpacity(.7),
  //                       //       weight: FontWeight.bold,
  //                       //       size: 12,
  //                       //     ))),
  //                     ]))
  //                 .toList()),
  //     // replacement: const Center(
  //     //   child: CircularProgressIndicator(),
  //     // ),
  //   );
  // }
  //
  // buildOwnerDocTable() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border.all(color: active.withOpacity(.4), width: .5),
  //       boxShadow: [
  //         BoxShadow(
  //             offset: const Offset(0, 6),
  //             color: lightGrey.withOpacity(.1),
  //             blurRadius: 12)
  //       ],
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     padding: const EdgeInsets.all(16),
  //     margin: const EdgeInsets.only(bottom: 30),
  //     child:
  //         // Visibility(
  //         //   visible: isLoading,
  //         //   child: isLoading == false
  //         //       ? Container()
  //         //       :
  //         DataTable2(
  //             columnSpacing: 12,
  //             horizontalMargin: 12,
  //             minWidth: 600,
  //             columns: const [
  //               DataColumn(label: Text("Id")),
  //               DataColumn(
  //                 label: Text("Aadhaar Front"),
  //               ),
  //               DataColumn(label: Text("Aadhaar Back")),
  //               DataColumn(label: Text("pan")),
  //               DataColumn(label: Text("Passbook")),
  //               DataColumn(
  //                 label: Text('Rental Agreement 1st Page'),
  //               ),
  //               // DataColumn(
  //               //   label: Text('Rating'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Wallet'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Aadhaar'),
  //               // ),
  //               // DataColumn(
  //               //   label: Text('Pan'),
  //               // ),
  //               DataColumn(
  //                 label: Text('Rental Agreement 2nd Page'),
  //               ),
  //               DataColumn(
  //                 label: Text('Action'),
  //               ),
  //             ],
  //             rows: ownerDoc
  //                 .map((e) => DataRow(cells: [
  //                       DataCell(CustomText(
  //                         text: (e['id']),
  //                         size: 12,
  //                         weight: FontWeight.normal,
  //                         color: Colors.black,
  //                       )),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["aadhaarfront"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["aadhaarback"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["pan"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["passbook"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["rentalagre1"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Container(
  //                           decoration: BoxDecoration(
  //                             color: light,
  //                             borderRadius: BorderRadius.circular(20),
  //                             border: Border.all(color: active, width: .5),
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 12, vertical: 6),
  //                           child: CustomText(
  //                             text: (e["rentalagre1"]),
  //                             color: active.withOpacity(.7),
  //                             weight: FontWeight.bold,
  //                             size: 12,
  //                           ))),
  //                       DataCell(Row(
  //                         children: [
  //                           CircleAvatar(
  //                               radius: 20,
  //                               backgroundColor: Colors.green.shade100,
  //                               child: IconButton(
  //                                   onPressed: () {},
  //                                   icon: const Icon(
  //                                     Icons.check,
  //                                     color: Colors.green,
  //                                   ))),
  //                           const SizedBox(width: 5),
  //                           CircleAvatar(
  //                               radius: 20,
  //                               backgroundColor: Colors.red.shade100,
  //                               child: IconButton(
  //                                   onPressed: () {},
  //                                   icon: const Icon(
  //                                     Icons.clear,
  //                                     color: Colors.red,
  //                                   ))),
  //                         ],
  //                       ))
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
  //                     ]))
  //                 .toList()),
  //     // replacement: const Center(
  //     //   child: CircularProgressIndicator(),
  //     // ),
  //   );
  // }
}
