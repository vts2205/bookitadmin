import 'package:bookitadminpanel/constants/controllers.dart';
import 'package:bookitadminpanel/constants/style.dart';
import 'package:bookitadminpanel/helpers/responsiveness.dart';
import 'package:bookitadminpanel/widgets/custom_text.dart';
import 'package:bookitadminpanel/widgets/driverbarchart.dart';
import 'package:bookitadminpanel/widgets/info_card.dart';
import 'package:bookitadminpanel/widgets/info_card_small.dart';
import 'package:bookitadminpanel/widgets/revenue_info.dart';
import 'package:bookitadminpanel/widgets/revenuebarchart.dart';
import 'package:bookitadminpanel/widgets/userbarchart.dart';
import 'package:bookitadminpanel/widgets/userinfo.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewPage extends StatelessWidget {
  OverviewPage({Key key}) : super(key: key);

  final List<Map<String, String>> availabledriersinfo = [
    {
      "id": "001",
      "name": "nivy",
      "email": "nivy@gmail.com",
      "phone": "6382136565",
      "location": "thiruvarur",
      "rating": "4.5",
      "action": "block"
    },
    {
      "id": "002",
      "name": "priya",
      "email": "priya@gmail.com",
      "phone": "7867997754",
      "location": "coimbatore",
      "rating": "4.7",
      "action": "block"
    },
    {
      "id": "003",
      "name": "arun",
      "email": "arun@gmail.com",
      "phone": "6382136556",
      "location": "cbe",
      "rating": "4.3",
      "action": "block"
    },
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
          Expanded(
              child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  buildOverviewCardsMediumScreen(context)
                else
                  buildOverviewCardsLargeScreen(context)
              else
                buildOverviewCardsSmallScreen(context),
              if (!ResponsiveWidget.isSmallScreen(context))
                buildRevenueSectionLarge(context)
              else
                buildRevenueSectionSmall(context),
              if (!ResponsiveWidget.isSmallScreen(context))
                buildUserSectionLarge(context)
              else
                buildUserSectionSmall(context),
              if (!ResponsiveWidget.isSmallScreen(context))
                buildDriverSectionLarge(context)
              else
                buildDriverSectionSmall(context),
              buildAvailableDriversTable(context)
            ],
          ))
        ],
      ),
    );
  }

  Widget buildOverviewCardsLargeScreen(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        InfoCard(
          title: "Rides in progress",
          value: "7",
          onTap: () {},
          topColor: Colors.orange,
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Rides Completed",
          value: "17",
          topColor: Colors.lightGreen,
          onTap: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Cancelled Rides",
          value: "3",
          topColor: Colors.redAccent,
          onTap: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Scheduled Rides",
          value: "32",
          onTap: () {},
          topColor: active,
        ),
      ],
    );
  }

  Widget buildOverviewCardsMediumScreen(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: "Rides in progress",
              value: "7",
              onTap: () {},
              topColor: Colors.orange,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Rides Completed",
              value: "17",
              topColor: Colors.lightGreen,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          children: [
            InfoCard(
              title: "Cancelled Rides",
              value: "3",
              topColor: Colors.redAccent,
              onTap: () {},
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Scheduled Rides",
              value: "32",
              onTap: () {},
              topColor: active,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildOverviewCardsSmallScreen(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
            title: "Rides in progress",
            value: "7",
            onTap: () {},
            isActive: true,
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Rides Completed",
            value: "17",
            onTap: () {},
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Cancelled Rides",
            value: "3",
            onTap: () {},
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Scheduled Rides",
            value: "32",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildRevenueSectionLarge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "Revenue Chart",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark,
                ),
                Container(
                    width: 600,
                    height: 200,
                    child: RevenueBarChart.withSampleData()),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 120,
            color: lightGrey,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    RevenueInfo(
                      title: "Today\'s revenue",
                      amount: "230",
                    ),
                    RevenueInfo(
                      title: "Last 7 days",
                      amount: "1,100",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    RevenueInfo(
                      title: "Last 30 days",
                      amount: "3,230",
                    ),
                    RevenueInfo(
                      title: "Last 12 months",
                      amount: "11,300",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserSectionLarge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "User Chart",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark,
                ),
                Container(
                    width: 600,
                    height: 200,
                    child: UserBarChart.withSampleData()),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 120,
            color: lightGrey,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    UserInfo(
                      title: "Today\'s users",
                      count: "2",
                    ),
                    UserInfo(
                      title: "Last 7 days",
                      count: "10",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    UserInfo(
                      title: "Last 30 days",
                      count: "50",
                    ),
                    UserInfo(
                      title: "Last 12 months",
                      count: "1300",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDriverSectionLarge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "Driver Chart",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark,
                ),
                Container(
                    width: 600,
                    height: 200,
                    child: DriverBarChart.withSampleData()),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 120,
            color: lightGrey,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    UserInfo(
                      title: "Today\'s drivers",
                      count: "2",
                    ),
                    UserInfo(
                      title: "Last 7 days",
                      count: "10",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    UserInfo(
                      title: "Last 30 days",
                      count: "50",
                    ),
                    UserInfo(
                      title: "Last 12 months",
                      count: "1300",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRevenueSectionSmall(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        children: [
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "Revenue Chart",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark,
                ),
                Container(
                    width: 600,
                    height: 200,
                    child: RevenueBarChart.withSampleData()),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 1,
            color: lightGrey,
          ),
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    RevenueInfo(
                      title: "Today\'s revenue",
                      amount: "230",
                    ),
                    RevenueInfo(
                      title: "Last 7 days",
                      amount: "1,100",
                    ),
                  ],
                ),
                Row(
                  children: const [
                    RevenueInfo(
                      title: "Last 30 days",
                      amount: "3,230",
                    ),
                    RevenueInfo(
                      title: "Last 12 months",
                      amount: "11,300",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserSectionSmall(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        children: [
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "User Chart",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark,
                ),
                Container(
                    width: 600,
                    height: 200,
                    child: UserBarChart.withSampleData()),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 1,
            color: lightGrey,
          ),
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    UserInfo(
                      title: "Today\'s users",
                      count: "2",
                    ),
                    UserInfo(
                      title: "Last 7 days",
                      count: "10",
                    ),
                  ],
                ),
                Row(
                  children: const [
                    UserInfo(
                      title: "Last 30 days",
                      count: "50",
                    ),
                    UserInfo(
                      title: "Last 12 months",
                      count: "1300",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDriverSectionSmall(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        children: [
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "Driver Chart",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark,
                ),
                Container(
                    width: 600,
                    height: 200,
                    child: DriverBarChart.withSampleData()),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 1,
            color: lightGrey,
          ),
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    UserInfo(
                      title: "Today\'s drivers",
                      count: "2",
                    ),
                    UserInfo(
                      title: "Last 7 days",
                      count: "10",
                    ),
                  ],
                ),
                Row(
                  children: const [
                    UserInfo(
                      title: "Last 30 days",
                      count: "50",
                    ),
                    UserInfo(
                      title: "Last 12 months",
                      count: "1300",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAvailableDriversTable(BuildContext context) {
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              CustomText(
                text: "Available Drivers",
                color: lightGrey,
                weight: FontWeight.bold,
                size: 20,
              ),
            ],
          ),
          DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn(label: Text("ID")),
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Email")),
                DataColumn(label: Text("Phone Number")),
                DataColumn(label: Text('Location')),
                DataColumn(label: Text('Rating')),
                DataColumn(label: Text('Action')),
              ],
              rows: availabledriersinfo
                  .map((e) => DataRow(cells: [
                        DataCell(CustomText(
                          text: (e["id"]),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                          text: (e["name"]),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                          text: (e["email"]),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                          text: (e["phone"]),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )),
                        DataCell(CustomText(
                            text: (e["location"]),
                            weight: FontWeight.normal,
                            size: 12,
                            color: Colors.black)),
                        DataCell(Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.deepOrange,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            CustomText(
                                text: (e["rating"]),
                                weight: FontWeight.normal,
                                size: 12,
                                color: Colors.black)
                          ],
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
                              text: (e["action"]),
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                              size: 12,
                            ))),
                      ]))
                  .toList()),
        ],
      ),
    );
  }
}
