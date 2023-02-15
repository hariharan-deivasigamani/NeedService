// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:on_demand_home_service/ADMIN/Catogery/form_for_adding_maincatogery.dart';
import 'package:on_demand_home_service/ADMIN/Customer_details/customer_details_list_page.dart';
import 'package:on_demand_home_service/ADMIN/Payment_Details/Payment_Details.dart';
import 'package:on_demand_home_service/ADMIN/Services/service_detailing_form.dart';
import 'package:on_demand_home_service/ADMIN/ServiceProvider/service_providers.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  int total_booking = 0 ,providers_count = 0 ,total_customer = 0;
  double total_earnings = 0.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("Welcome! Admin"),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text("APP Management",style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.w700
                    ),),
                  ), // APP  MANAGEMENT
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ServiceProvider()),
                      );

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        children: const [
                          Icon(Icons.people_outline),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Service Providers"),
                          Spacer(),
                          Icon(Icons.chevron_right_outlined)
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CustomerDetailsList()),
                      );

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: const [
                          Icon(Icons.supervised_user_circle ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Customers"),
                          Spacer(),
                          Icon(Icons.chevron_right_outlined)
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainCatogeryAdding()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: const [
                          Icon(Icons.folder_open_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Catogery"),
                          Spacer(),
                          Icon(Icons.chevron_right_outlined)
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ServiceDetailingForm(
                            )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: const [
                          Icon(Icons.design_services_outlined ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Services"),
                          Spacer(),
                          Icon(Icons.chevron_right_outlined)
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: const [
                          Icon(Icons.book_online_outlined ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Booking Maintenance"),
                          Spacer(),
                          Icon(Icons.chevron_right_outlined)
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: const [
                          Icon(Icons.preview_outlined ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Ratings & Review"),
                          Spacer(),
                          Icon(Icons.chevron_right_outlined)
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const BottomUpNavigationBar(
                      //       )),
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: const [
                          Icon(Icons.monetization_on_outlined ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Subscription Details"),
                          Spacer(),
                          Icon(Icons.chevron_right_outlined)
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomerPaymentDetails(
                            )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: const [
                          Icon(Icons.account_balance_wallet_outlined ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Payment Details"),
                          Spacer(),
                          Icon(Icons.chevron_right_outlined)
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),

                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (param) {
                            return AlertDialog(
                              title: const Text(
                                "Are you sure to LOGOUT",
                                style: TextStyle(color: Colors.teal, fontSize: 20),
                              ),
                              actions: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        const snackBar = SnackBar(
                                            content:
                                            Text('Logged Out Successfully'));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: const Text("Logout")),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.teal),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Close"))
                              ],
                            );
                          });
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.45,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        // topRight: Radius.circular(18.0),
                        bottomRight: Radius.circular(18.0),
                        // bottomLeft: Radius.circular(18.0),
                      ),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Text("$total_booking",style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,color: Colors.green
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Total Bookings\n",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,color: Colors.black
                      ),),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.45,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        // topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0),
                        // bottomRight: Radius.circular(18.0),
                        bottomLeft: Radius.circular(18.0),
                      ),
                      color: Colors.white
                  ),
                  child: Column(

                    children: [
                      Text("₹ $total_earnings",style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,color: Colors.green
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Total Earnings\n",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,color: Colors.black
                      ),),

                    ],
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.45,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        // topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0),
                        // bottomRight: Radius.circular(18.0),
                        bottomLeft: Radius.circular(18.0),
                      ),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Text("$providers_count",style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,color: Colors.green
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Total Providers\n",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,color: Colors.black
                      ),),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.45,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        // topRight: Radius.circular(18.0),
                        bottomRight: Radius.circular(18.0),
                        // bottomLeft: Radius.circular(18.0),
                      ),
                      color: Colors.white
                  ),
                  child: Column(

                    children: [
                      Text("$total_customer",style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,color: Colors.green
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Total Customer\n",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,color: Colors.black
                      ),),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    ));
  }
}
