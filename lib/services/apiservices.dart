import 'dart:convert';
import 'package:bookitadminpanel/constants/api.dart';
import 'package:bookitadminpanel/model/get_profile_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

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

  Future<GetProfileModel> FetchProfile() async {
    var client = http.Client();
    var token = box.read('token');
    var completeUrl = APIConstants.baseUrl + APIConstants.getProfile;
    var uri = Uri.parse(completeUrl);
    try {
      final response =
          await client.get(uri, headers: {'Authorization': 'Bearer $token'});
      print('token:$token');
      print('....Map....${response.body.toString()}');
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
}
