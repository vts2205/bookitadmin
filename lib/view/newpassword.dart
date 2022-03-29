import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'authentication.dart';

class NewPassword extends StatelessWidget {
  NewPassword({Key key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final createpass = TextEditingController();
  final newpass = TextEditingController();

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
                    Text("Create new password",
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: blue)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: createpass,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: "New Password",
                      labelStyle: TextStyle(color: blue),
                      hintText: "a123",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onSaved: (value) {
                    createpass.text = value;
                  },
                  validator: (value) {
                    if (value.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: newpass,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: "Re-Enter Password",
                      labelStyle: TextStyle(color: blue),
                      hintText: "a123",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onSaved: (value) {
                    newpass.text = value;
                  },
                  validator: (value) {
                    if (value.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    // if(formKey.currentState.validate()) {
                    //   print("Success");
                    Get.to(AuthenticationPage());
                    // } else {
                    //   print("failed....");
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
                      text: "Save",
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
}
