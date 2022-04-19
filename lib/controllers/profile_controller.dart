import 'package:bookitadminpanel/model/get_profile_model.dart';
import 'package:bookitadminpanel/services/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var getProfileInfo = <GetProfileModel>[].obs;
  var isLoading = true.obs;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  void onInit() {
    fetchProfileInfo();
    super.onInit();
  }

  void fetchProfileInfo() async {
    try {
      isLoading(true);
      var profileInfo = await APIService().FetchProfile();
      if (profileInfo != null) {
        getProfileInfo.assign(profileInfo);

        namecontroller.text = getProfileInfo[0].userValue.name;
        phonecontroller.text = getProfileInfo[0].userValue.phonenumber;
        emailcontroller.text = getProfileInfo[0].userValue.email;
      }
    } finally {
      isLoading(false);
    }
  }
}
