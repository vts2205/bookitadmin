import 'package:bookitadminpanel/model/get_profile_model.dart';
import 'package:bookitadminpanel/model/profile_update_model.dart';
import 'package:bookitadminpanel/services/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var getProfileInfo = <GetProfileModel>[].obs;
  var updateProfileInfo = <ProfileUpdateModel>[].obs;
  var isLoading = true.obs;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void onInit() {
    fetchProfileInfo();
    super.onInit();
  }

  void fetchProfileInfo() async {
    try {
      isLoading(true);
      var profileInfo = await APIService().fetchProfile();
      if (profileInfo != null) {
        getProfileInfo.assign(profileInfo);

        namecontroller.text = getProfileInfo[0].name;
        phonecontroller.text = getProfileInfo[0].phonenumber;
        emailcontroller.text = getProfileInfo[0].email;
        passwordcontroller.text = getProfileInfo[0].passwordText;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchProfileUpdate() async {
    try {
      isLoading(true);
      var profileUpdateInfo = await APIService().updateProfile(
          namecontroller.text,
          phonecontroller.text,
          emailcontroller.text,
          passwordcontroller.text);
      if (profileUpdateInfo != null) {
        updateProfileInfo.assign(profileUpdateInfo);
        passwordcontroller.text =
            profileUpdateInfo.profileEdit[0].password ?? '';
      }
      return null;
    } finally {
      isLoading(false);
    }
  }
}
