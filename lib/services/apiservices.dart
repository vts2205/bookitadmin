import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:typed_data';
import 'package:bookitadminpanel/constants/api.dart';
import 'package:bookitadminpanel/model/add_driver_list_model.dart';
import 'package:bookitadminpanel/model/approved_drivers_list_model.dart';
import 'package:bookitadminpanel/model/car_documents_list_model.dart';
import 'package:bookitadminpanel/model/driver_documents_list_model.dart';
import 'package:bookitadminpanel/model/driver_list_model.dart';
import 'package:bookitadminpanel/model/get_profile_model.dart';
import 'package:bookitadminpanel/model/owner_documents_list_model.dart';
import 'package:bookitadminpanel/model/rejected_drivers_list_model.dart';
import 'package:bookitadminpanel/model/sub_admin_list_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';

class APIService {
  final box = GetStorage();

  Future createLogin(String email, password) async {
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.login;
    var uri = Uri.parse(completeUrl);
    final response =
        await client.post(uri, body: {"email": email, "password": password});
    var convertedDataToJson = jsonDecode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }

  Future<GetProfileModel> fetchProfile() async {
    var client = http.Client();
    var token = box.read('token');
    var completeUrl = APIConstants.baseUrl + APIConstants.getProfile;
    var uri = Uri.parse(completeUrl);
    try {
      final response =
          await client.get(uri, headers: {'Authorization': '$token'});
      print('token:$token');
      print(response.body);
      print('StatusCode: ${response.statusCode}');
      if (response.statusCode == 200) {
        print(response.body.toString());
        GetProfileModel getProfileModel =
            GetProfileModel.fromJson(json.decode(response.body));
        print(getProfileModel.toJson());
        return getProfileModel;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future updateProfile(String name, phonenumber, email, password) async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.profileUpdate;
    var uri = Uri.parse(completeUrl);
    final response = await client.put(uri, headers: {
      'Authorization': '$token'
    }, body: {
      'name': email,
      'phonenumber': phonenumber,
      'email': email,
      'password': password
    });
    var convertedDataToJson = json.decode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }

  Future uploadImage(Stream<List<int>> imagefile, int fileLength,
      String fileName, String url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(http.MultipartFile('Photofile', imagefile, fileLength,
        filename: fileName));
    var res = await request.send();
    String result = await res.stream.bytesToString();
    print(result);
    print(res);
  }

  Future createSubAdmin(String name, phonenumber, designation, email, password,
      imageFilePath) async {
    var token = box.read('token');
    var completeUrl = APIConstants.baseUrl + APIConstants.subAdmin;
    var uri = Uri.parse(completeUrl);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll({'Authorization': '$token'});
    request.fields['name'] = name;
    request.fields['phonenumber'] = phonenumber;
    request.fields['designation'] = designation;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['image'] = imageFilePath;
    print(imageFilePath);
    request.send().then((response) {
      print(response);
      print(response.statusCode);
      if (response.statusCode == 200) print("Uploaded!");
    });
  }

  Future<SubAdminListModel> subAdminList() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.subAdmin;
    var uri = Uri.parse(completeUrl);
    final response =
        await client.get(uri, headers: {'Authorization': '$token'});
    print('token:$token');
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return subAdminListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future createDriver(String name, email, phonenumber, location) async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.driver;
    var uri = Uri.parse(completeUrl);
    final response = await client.post(uri, headers: {
      'Authorization': '$token'
    }, body: {
      'name': name,
      'email': email,
      'phonenumber': phonenumber,
      'location': location
    });
    var convertedDataToJson = json.decode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }

  Future<DriverListModel> driverList() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.driver;
    var uri = Uri.parse(completeUrl);
    final response =
        await client.get(uri, headers: {'Authorization': '$token'});
    print('token:$token');
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return driverListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<AddDriverListModel> addDriverList() async {
    print('====API called====');
    var client = http.Client();
    var uri = Uri.parse('http://3.110.225.148:9200/api/mobile/admin/addDriver');
    print(uri);
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return addDriverListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future driverApproval(id) async {
    print('====API called====');
    var driverId = id;
    var client = http.Client();
    var uri =
        Uri.parse('http://3.110.225.148:9200/api/mobile/admin/driverApproval');
    print(uri);
    final response = await client
        .post(uri, body: {"driverId": "$driverId", "status": "confirmed"});
    var convertedDataToJson = jsonDecode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }

  Future driverReject(id) async {
    print('====API called====');
    var driverId = id;
    var client = http.Client();
    var uri =
        Uri.parse('http://3.110.225.148:9200/api/mobile/admin/driverApproval');
    print(uri);
    final response = await client
        .post(uri, body: {"driverId": "$driverId", "status": "rejected"});
    var convertedDataToJson = jsonDecode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }

  Future<ApprovedDriversListModel> approvedDriversList() async {
    var client = http.Client();
    var completeUrl = 'http://3.110.225.148:9200/api/mobile/admin/approvedList';
    var uri = Uri.parse(completeUrl);
    final response = await client.get(uri);
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return approvedDriversListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<RejectedDriversListModel> rejectedDriversList() async {
    var client = http.Client();
    var completeUrl = 'http://3.110.225.148:9200/api/mobile/admin/rejectedList';
    var uri = Uri.parse(completeUrl);
    final response = await client.get(uri);
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return rejectedDriversListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<CarDocumentsListModel> carDocumentsList() async {
    var client = http.Client();
    var completeUrl = 'http://3.110.225.148:9200/api/mobile/admin/carDocuments';
    var uri = Uri.parse(completeUrl);
    final response = await client.get(uri);
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return carDocumentsListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<DriverDocumentsListModel> driverDocumentsList() async {
    var client = http.Client();
    var completeUrl =
        'http://3.110.225.148:9200/api/mobile/admin/driverDocuments';
    var uri = Uri.parse(completeUrl);
    final response = await client.get(uri);
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return driverDocumentsListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<OwnerDocumentsListModel> ownerDocumentsList() async {
    var client = http.Client();
    var completeUrl =
        'http://3.110.225.148:9200/api/mobile/admin/ownerDocuments';
    var uri = Uri.parse(completeUrl);
    final response = await client.get(uri);
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return ownerDocumentsListModelFromJson(json);
    } else {
      return null;
    }
  }
}
