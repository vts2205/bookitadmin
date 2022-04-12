import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/layout.dart';
import 'package:bookitadminpanel/services/apiservices.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forgotpassword.dart';

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({Key key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset('assets/icons/logo.png', width: 50),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text("Login",
                        style: GoogleFonts.roboto(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: blue)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Welcome back to the admin panel.",
                      color: green,
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: "Email",
                      labelStyle: TextStyle(color: blue),
                      hintText: "abc@domain.com",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onSaved: (value) {
                    email.text = value;
                  },
                  validator: (value) {
                    if (value.isEmpty
                        // ||
                        // !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //     .hasMatch(value)
                        ) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: "Password",
                      labelStyle: TextStyle(color: blue),
                      hintText: "123",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onSaved: (value) {
                    password.text = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        const CustomText(
                          text: "Remember Me",
                          size: 15,
                          weight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(ForgotPassword());
                        },
                        child: Text("Forgot Password ?",
                            style: TextStyle(fontSize: 15, color: blue)))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.offAll(SiteLayout());
                    // if (formKey.currentState.validate()) {
                    //   // var response = await APIService().createLogin(email.text);
                    //   // if (response.statusCode == 200) {
                    //   //   print("token:${response.token}");
                    //   showLoading();
                    //   Future.delayed(const Duration(milliseconds: 2000), () {
                    //     Get.back();
                    //
                    //   });
                    // } else {
                    //   print("failed....");
                    //  }
                    // }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [blue, green]),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const CustomText(
                      text: "Login",
                      color: Colors.white,
                      size: 20,
                      weight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showLoading({String title = "Loading..."}) {
    Get.dialog(
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              width: 100,
              height: 40,
              child: Row(
                children: [
                  CircularProgressIndicator(color: dark),
                  const SizedBox(width: 20),
                  Text(title)
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }
  // Future <void> login(BuildContext context) async{
  //   if(phoneNumber.text.isNotEmpty){
  //     var response = await http.post(Uri.parse("http://65.2.146.244:8800/api/v1/users/login"),body: ({
  //       "phoneNumber": phoneNumber.text,
  //     }));
  //     if (response.statusCode==200){
  //       Get.offAll(SiteLayout());
  //     }else {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Invalid credentials")));
  //     }
  //   } else{
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Black fields not allowed")));
  //   }
  // }
}
