import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {

  Future createLogin(String phoneNumber) async {
    String postURL = "http://65.2.146.244:8800/api/v1/users/login";

    var uri = Uri.parse(postURL);

    var response = await http.post(uri, body: {"phonenumber": phoneNumber});
    var convertedDataToJson = jsonDecode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }
}

