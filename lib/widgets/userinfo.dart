import 'package:bookitadminpanel/constants/style.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String title;
  final String count;

  const UserInfo({Key key, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "$title \n\n",
                style: TextStyle(color: dark, fontSize: 16)),
            TextSpan(
                text: "$count",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ])),
    );
  }
}
