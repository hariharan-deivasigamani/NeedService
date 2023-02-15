import 'package:flutter/material.dart';
import 'package:on_demand_home_service/ADMIN/admin_dashboard.dart';
import 'package:on_demand_home_service/SERVICEPROVIDER_DASHBORAD/Service_Provider_DashBoard.dart';

import 'CustomerScreen/navigationbar.dart';

class EnterancePage extends StatefulWidget {
  const EnterancePage({Key? key}) : super(key: key);

  @override
  State<EnterancePage> createState() => _EnterancePageState();
}

class _EnterancePageState extends State<EnterancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 150.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomUpNavigationBar()),
                );
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.black45,
                child: Text(" User Page"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminHomePage()),
                );
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.green,
                child: Text("Admin Page"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ServiceProviderDashBoard()),
                );
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blueGrey,
                child: Text("Service Provider Page"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
