// ignore_for_file: avoid_print, unused_local_variable, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_demand_home_service/SERVICEPROVIDER_DASHBORAD/My%20Providers.dart';
import 'package:on_demand_home_service/SERVICEPROVIDER_DASHBORAD/My%20Services.dart';
import 'package:on_demand_home_service/SERVICEPROVIDER_DASHBORAD/Service_provider_%20screen.dart';
import 'package:on_demand_home_service/SERVICEPROVIDER_DASHBORAD/sp%20notification.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ServiceProviderDashBoard extends StatefulWidget {
  const ServiceProviderDashBoard({Key? key}) : super(key: key);

  @override
  State<ServiceProviderDashBoard> createState() =>
      _ServiceProviderDashBoardState();
}

class _ServiceProviderDashBoardState extends State<ServiceProviderDashBoard> with TickerProviderStateMixin{


  Future<void> _getLocationPermission() async {
    try {
      var status = await Permission.location.status;
      if (!status.isGranted) {
        await Permission.location.request();
      } else {
        if (await Permission.location.request().isGranted) {
          // Either the employeePermission was already granted before or the user just granted it.
          setState(() {
            getCurrentLocation();
          });
        } else {
          debugPrint('Please give employeePermission');
        }
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  // FOR GETTING USER LOCATION DETAILS
  getCurrentLocation() async {
    try {
      Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      _currentPosition = newPosition;

      placeMarks = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );

      Placemark pMark = placeMarks![0];

      String completeAddress =
          '${pMark.street},${pMark.subLocality},${pMark.locality}, '
          ' ${pMark.administrativeArea}, ${pMark.postalCode}';

      debugPrint("clicked sign up: ${pMark.toJson()}");

      setState(() {
        myLocationController = completeAddress.toString();
        debugPrint("clicked sign up: $completeAddress");
      });
    } catch (e) {
      debugPrint("$e");
    }
  }


  File? image;

  // for location
  Position? _currentPosition;
  List<Placemark>? placeMarks;
  String? myLocationController;
  var size, height, width;


  int dark = 0, total_booking=0, total_service=0 ;
  double total_earnings = 0.00;

  late TabController controller;


  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 5,
      vsync: this,
    );
  }



  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    var tabs;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Service Provider"),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ServiceProviderForm()),
              );
            }, icon: const Icon(Icons.add))
            ],
          backgroundColor: Colors.green,
          elevation: 1,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFFccebc9)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        pickimages();
                        print("Going in to gallery");
                      },
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black45,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey,
                          child: Column(
                            children: [
                              image != null
                                  ? ClipOval(
                                      child: Image.file(
                                        image!,
                                        height: 70,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const Padding(
                                      padding: EdgeInsets.only(top: 20.0),
                                      child: Icon(
                                        Icons.add_a_photo_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Text("Hariharan"),
                    const Text("hariharan.d135@gmail.com"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        "SERVICES",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ), // APP  MANAGEMENT
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyServicesHistory()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Row(
                          children: const [
                            Icon(Icons.home_repair_service_outlined),
                            VerticalDivider(
                              color: Colors.green,
                              thickness: 1.5,
                            ),
                            Text("My Service "),
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
                          MaterialPageRoute(builder: (context) => const  MyProvidersForServiceProvider()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: const [
                            Icon(Icons.build_circle_outlined),
                            SizedBox(
                              width: 20,
                            ),
                            Text("My Providers"),
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
                              builder: (context) => const NotificationForServiceProvider(
                              )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: const [
                            Icon(Icons.notifications_active_outlined),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Notification"),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        "Application Preference",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ServiceProviderForm()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: const [
                            Icon(Icons.settings_applications_outlined),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Settings"),
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
                        showDialog(
                            context: context,
                            builder: (param) {
                              return AlertDialog(
                                title: const Text(
                                  "Are you sure to LOGOUT",
                                  style: TextStyle(
                                      color: Colors.teal, fontSize: 20),
                                ),
                                actions: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.red),
                                      onPressed: () {
                                        setState(() {
                                          const snackBar = SnackBar(
                                              content: Text(
                                                  'Logged Out Successfully'));
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: const [
                            Icon(Icons.logout_outlined),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Logout"),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: Color(0xFFccebc7),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: IconButton(
                            onPressed: () async {
                              _getLocationPermission();
                            },
                            icon: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.black,
                                ))),
                      ),
                      if (myLocationController != null) Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$myLocationController"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.green,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "\n $total_booking",
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Center(
                                child: Text(
                              "  Total Booking  \n",
                              style: TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.green,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "\n  $total_service",
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Center(
                                child: Text(
                              "  Total Service  \n",
                              style: TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.green,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "\n ₹ $total_earnings",
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Center(
                                child: Text(
                              "  Total Earnings  \n",
                              style: TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                DefaultTabController(
                  length: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TabBar(
                        controller: controller,
                        isScrollable: true,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black12,
                        labelStyle:const TextStyle(color: Colors.green),
                        unselectedLabelStyle: const TextStyle(color: Colors.red),
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(20), // Creates border
                              color:const Color(0xFFccebc7), ),
                        // indicator: BoxDecoration(
                        //   border: Border.all(color: Colors.green),
                        //   borderRadius: BorderRadius.circular(10),
                        //   color: Colors.white,
                        // ),
                        tabs: const [
                          Tab(
                            text: "All" ,
                          ),
                          Tab(
                            text: "Accepted" ,
                          ),
                          Tab(
                            text: "Pending"
                            ,
                          ),
                          Tab(
                            text: "Completed",
                          ),
                          Tab(
                            text: "Featured",
                          ),
                        ]
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: height,
                        child: TabBarView(
                          controller: controller,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                           SingleChildScrollView(
                             child: Column(
                               children: [
                                 Column(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                       child: Container(
                                         decoration: const BoxDecoration(
                                             borderRadius: BorderRadius.only(
                                               bottomLeft: Radius.circular(10.0),
                                               bottomRight: Radius.circular(10.0),
                                               topLeft: Radius.circular(10.0),
                                               topRight: Radius.circular(10.0),
                                             ),
                                             boxShadow: [
                                               BoxShadow(
                                                 color: Colors.grey,
                                                 blurRadius: 1.0,
                                               ),
                                             ],
                                             color:  Colors.white
                                         ),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Row(
                                               children: const [
                                                 Padding(
                                                   padding: EdgeInsets.all(8.0),
                                                   child: Text("Accepted",style: TextStyle(
                                                       color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20
                                                   ),),
                                                 ),
                                                 Icon(
                                                   Icons.verified_outlined,
                                                   color: Colors.red,
                                                 ),
                                               ],
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(left: 8.0),
                                               child: Row(
                                                 children: [
                                                   Column(
                                                     children: [
                                                       Padding(
                                                         padding: const EdgeInsets.only(top:8.0),
                                                         child: Container(
                                                           decoration: const BoxDecoration(
                                                             borderRadius: BorderRadius.only(
                                                               topLeft: Radius.circular(10.0),
                                                               topRight: Radius.circular(10.0),
                                                             ),
                                                           ),
                                                           child: Card(
                                                             shape: const RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 BorderRadius.all(Radius.circular(18.0))),
                                                             child: ClipRRect(
                                                               borderRadius: const BorderRadius.only(
                                                                 topLeft: Radius.circular(18.0),
                                                                 topRight: Radius.circular(18.0),
                                                               ),
                                                               child: Image.asset(
                                                                 "assets/2.jpg",
                                                                 height: 100,
                                                                 width: 100,
                                                                 fit: BoxFit.cover,
                                                               ),
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                       SizedBox(
                                                         height: 100,
                                                         width: 100,
                                                         child: Container(
                                                           decoration: const BoxDecoration(
                                                               borderRadius: BorderRadius.only(
                                                                 bottomLeft: Radius.circular(10.0),
                                                                 bottomRight: Radius.circular(10.0),
                                                               ),
                                                               color: Colors.green),
                                                           child: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: Column(
                                                               children: const [
                                                                 Text("1.45 PM"),
                                                                 Text(
                                                                   "02",
                                                                   style: TextStyle(fontSize: 25,color: Colors.white),
                                                                 ),
                                                                 Text("SEP"),
                                                               ],
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(left: 38.0),
                                                     child: Column(
                                                       children: [
                                                         const Text(
                                                           "Drilling work",
                                                           style: TextStyle(
                                                               fontSize: 20, fontWeight: FontWeight.bold),
                                                         ),
                                                         const SizedBox(
                                                           height: 20,
                                                         ),
                                                         Row(
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: const [
                                                             Icon(Icons.build_circle_outlined),
                                                             SizedBox(
                                                               width: 10,
                                                             ),
                                                             Text("Repair Work"),
                                                           ],
                                                         ),
                                                         const SizedBox(
                                                           height: 25,
                                                         ),
                                                         Row(
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: const [
                                                             Icon(Icons.location_on_outlined),
                                                             SizedBox(
                                                               width: 10,
                                                             ),
                                                             Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                           ],
                                                         ),
                                                       ],
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(left: 150.0,right: 30),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: const [
                                                   Text("Total:"),
                                                   Text('5400',style: TextStyle(
                                                       fontWeight: FontWeight.bold
                                                   ),),
                                                 ],
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Column(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                       child: Container(
                                         decoration: const BoxDecoration(
                                             borderRadius: BorderRadius.only(
                                               bottomLeft: Radius.circular(10.0),
                                               bottomRight: Radius.circular(10.0),
                                               topLeft: Radius.circular(10.0),
                                               topRight: Radius.circular(10.0),
                                             ),
                                             boxShadow: [
                                               BoxShadow(
                                                 color: Colors.grey,
                                                 blurRadius: 1.0,
                                               ),
                                             ],
                                             color:  Colors.white
                                         ),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Row(
                                               children: const [
                                                 Padding(
                                                   padding: EdgeInsets.all(8.0),
                                                   child: Text("Pending ",style: TextStyle(
                                                       color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20
                                                   ),),
                                                 ),
                                                 Icon(
                                                   Icons.error_outline_outlined,
                                                   color: Colors.red,
                                                 ),
                                                 Text("Order Will Transfer \n to another person with 5mins",style: TextStyle(
                                                     color: Colors.red,fontSize: 10
                                                 ),),
                                               ],
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(left: 8.0),
                                               child: Row(
                                                 children: [
                                                   Column(
                                                     children: [
                                                       Padding(
                                                         padding: const EdgeInsets.only(top:8.0),
                                                         child: Container(
                                                           decoration: const BoxDecoration(
                                                             borderRadius: BorderRadius.only(
                                                               topLeft: Radius.circular(10.0),
                                                               topRight: Radius.circular(10.0),
                                                             ),
                                                           ),
                                                           child: Card(
                                                             shape: const RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 BorderRadius.all(Radius.circular(18.0))),
                                                             child: ClipRRect(
                                                               borderRadius: const BorderRadius.only(
                                                                 topLeft: Radius.circular(18.0),
                                                                 topRight: Radius.circular(18.0),
                                                               ),
                                                               child: Image.asset(
                                                                 "assets/2.jpg",
                                                                 height: 100,
                                                                 width: 100,
                                                                 fit: BoxFit.cover,
                                                               ),
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                       SizedBox(
                                                         height: 100,
                                                         width: 100,
                                                         child: Container(
                                                           decoration: const BoxDecoration(
                                                               borderRadius: BorderRadius.only(
                                                                 bottomLeft: Radius.circular(10.0),
                                                                 bottomRight: Radius.circular(10.0),
                                                               ),
                                                               color: Colors.green),
                                                           child: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: Column(
                                                               children: const [
                                                                 Text("1.45 PM"),
                                                                 Text(
                                                                   "02",
                                                                   style: TextStyle(fontSize: 25,color: Colors.white),
                                                                 ),
                                                                 Text("SEP"),
                                                               ],
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(left: 38.0),
                                                     child: Column(
                                                       children: [
                                                         const Text(
                                                           "Drilling work",
                                                           style: TextStyle(
                                                               fontSize: 20, fontWeight: FontWeight.bold),
                                                         ),
                                                         const SizedBox(
                                                           height: 20,
                                                         ),
                                                         Row(
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: const [
                                                             Icon(Icons.build_circle_outlined),
                                                             SizedBox(
                                                               width: 10,
                                                             ),
                                                             Text("Repair Work"),
                                                           ],
                                                         ),
                                                         const SizedBox(
                                                           height: 25,
                                                         ),
                                                         Row(
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: const [
                                                             Icon(Icons.location_on_outlined),
                                                             SizedBox(
                                                               width: 10,
                                                             ),
                                                             Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                           ],
                                                         ),
                                                       ],
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(left: 150.0,right: 30),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: const [
                                                   Text("Total:"),
                                                   Text('5400',style: TextStyle(
                                                       fontWeight: FontWeight.bold
                                                   ),),
                                                 ],
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Column(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                       child: Container(
                                         decoration: const BoxDecoration(
                                             borderRadius: BorderRadius.only(
                                               bottomLeft: Radius.circular(10.0),
                                               bottomRight: Radius.circular(10.0),
                                               topLeft: Radius.circular(10.0),
                                               topRight: Radius.circular(10.0),
                                             ),
                                             boxShadow: [
                                               BoxShadow(
                                                 color: Colors.grey,
                                                 blurRadius: 1.0,
                                               ),
                                             ],
                                             color:  Colors.white
                                         ),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Row(
                                               children: const [
                                                 Padding(
                                                   padding: EdgeInsets.all(8.0),
                                                   child: Text("Completed",style: TextStyle(
                                                       color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20
                                                   ),),
                                                 ),
                                                 Icon(
                                                   Icons.verified_outlined,
                                                   color: Colors.green,
                                                 ),
                                               ],
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(left: 8.0),
                                               child: Row(
                                                 children: [
                                                   Column(
                                                     children: [
                                                       Padding(
                                                         padding: const EdgeInsets.only(top:8.0),
                                                         child: Container(
                                                           decoration: const BoxDecoration(
                                                             borderRadius: BorderRadius.only(
                                                               topLeft: Radius.circular(10.0),
                                                               topRight: Radius.circular(10.0),
                                                             ),
                                                           ),
                                                           child: Card(
                                                             shape: const RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 BorderRadius.all(Radius.circular(18.0))),
                                                             child: ClipRRect(
                                                               borderRadius: const BorderRadius.only(
                                                                 topLeft: Radius.circular(18.0),
                                                                 topRight: Radius.circular(18.0),
                                                               ),
                                                               child: Image.asset(
                                                                 "assets/2.jpg",
                                                                 height: 100,
                                                                 width: 100,
                                                                 fit: BoxFit.cover,
                                                               ),
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                       SizedBox(
                                                         height: 100,
                                                         width: 100,
                                                         child: Container(
                                                           decoration: const BoxDecoration(
                                                               borderRadius: BorderRadius.only(
                                                                 bottomLeft: Radius.circular(10.0),
                                                                 bottomRight: Radius.circular(10.0),
                                                               ),
                                                               color: Colors.green),
                                                           child: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: Column(
                                                               children: const [
                                                                 Text("1.45 PM"),
                                                                 Text(
                                                                   "02",
                                                                   style: TextStyle(fontSize: 25,color: Colors.white),
                                                                 ),
                                                                 Text("SEP"),
                                                               ],
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(left: 38.0),
                                                     child: Column(
                                                       children: [
                                                         const Text(
                                                           "Drilling work",
                                                           style: TextStyle(
                                                               fontSize: 20, fontWeight: FontWeight.bold),
                                                         ),
                                                         const SizedBox(
                                                           height: 20,
                                                         ),
                                                         Row(
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: const [
                                                             Icon(Icons.build_circle_outlined),
                                                             SizedBox(
                                                               width: 10,
                                                             ),
                                                             Text("Repair Work"),
                                                           ],
                                                         ),
                                                         const SizedBox(
                                                           height: 25,
                                                         ),
                                                         Row(
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: const [
                                                             Icon(Icons.location_on_outlined),
                                                             SizedBox(
                                                               width: 10,
                                                             ),
                                                             Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                           ],
                                                         ),
                                                       ],
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(left: 150.0,right: 30),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: const [
                                                   Text("Total:"),
                                                   Text('5400',style: TextStyle(
                                                       fontWeight: FontWeight.bold
                                                   ),),
                                                 ],
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                 Column(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                       child: Container(
                                         decoration: const BoxDecoration(
                                             borderRadius: BorderRadius.only(
                                               bottomLeft: Radius.circular(10.0),
                                               bottomRight: Radius.circular(10.0),
                                               topLeft: Radius.circular(10.0),
                                               topRight: Radius.circular(10.0),
                                             ),
                                             boxShadow: [
                                               BoxShadow(
                                                 color: Colors.grey,
                                                 blurRadius: 1.0,
                                               ),
                                             ],
                                             color:  Colors.white
                                         ),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Row(
                                               children: const [
                                                 Padding(
                                                   padding: EdgeInsets.only(left: 8.0,top: 8.0,bottom: 8.0),
                                                   child: Text("Waiting ",style: TextStyle(
                                                       color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20
                                                   ),),
                                                 ),
                                                 Icon(
                                                   Icons.error_outline_outlined,
                                                   color: Colors.red,
                                                 ),
                                                 Padding(
                                                   padding: EdgeInsets.only(left: 30.0),
                                                   child: Text(" Order is waiting\n"
                                                       ""
                                                       " for your confirmation",style: TextStyle(
                                                       color: Colors.orangeAccent,fontSize: 13
                                                   ),),
                                                 ),
                                               ],
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(left: 8.0),
                                               child: Row(
                                                 children: [
                                                   Column(
                                                     children: [
                                                       Padding(
                                                         padding: const EdgeInsets.only(top:8.0),
                                                         child: Container(
                                                           decoration: const BoxDecoration(
                                                             borderRadius: BorderRadius.only(
                                                               topLeft: Radius.circular(10.0),
                                                               topRight: Radius.circular(10.0),
                                                             ),
                                                           ),
                                                           child: Card(
                                                             shape: const RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 BorderRadius.all(Radius.circular(18.0))),
                                                             child: ClipRRect(
                                                               borderRadius: const BorderRadius.only(
                                                                 topLeft: Radius.circular(18.0),
                                                                 topRight: Radius.circular(18.0),
                                                               ),
                                                               child: Image.asset(
                                                                 "assets/2.jpg",
                                                                 height: 100,
                                                                 width: 100,
                                                                 fit: BoxFit.cover,
                                                               ),
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                       SizedBox(
                                                         height: 100,
                                                         width: 100,
                                                         child: Container(
                                                           decoration: const BoxDecoration(
                                                               borderRadius: BorderRadius.only(
                                                                 bottomLeft: Radius.circular(10.0),
                                                                 bottomRight: Radius.circular(10.0),
                                                               ),
                                                               color: Colors.green),
                                                           child: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: Column(
                                                               children: const [
                                                                 Text("1.45 PM"),
                                                                 Text(
                                                                   "02",
                                                                   style: TextStyle(fontSize: 25,color: Colors.white),
                                                                 ),
                                                                 Text("SEP"),
                                                               ],
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(left: 38.0),
                                                     child: Column(
                                                       children: [
                                                         const Text(
                                                           "Drilling work",
                                                           style: TextStyle(
                                                               fontSize: 20, fontWeight: FontWeight.bold),
                                                         ),
                                                         const SizedBox(
                                                           height: 20,
                                                         ),
                                                         Row(
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: const [
                                                             Icon(Icons.build_circle_outlined),
                                                             SizedBox(
                                                               width: 10,
                                                             ),
                                                             Text("Repair Work"),
                                                           ],
                                                         ),
                                                         const SizedBox(
                                                           height: 25,
                                                         ),
                                                         Row(
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: const [
                                                             Icon(Icons.location_on_outlined),
                                                             SizedBox(
                                                               width: 10,
                                                             ),
                                                             Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                           ],
                                                         ),
                                                       ],
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(left: 150.0,right: 30),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: const [
                                                   Text("Total:"),
                                                   Text('5400',style: TextStyle(
                                                       fontWeight: FontWeight.bold
                                                   ),),
                                                 ],
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: SizedBox(
                                         height: 40,
                                         width:double.infinity,
                                         child: ElevatedButton(
                                             style: ElevatedButton.styleFrom(
                                               primary: Colors.green,
                                               onSurface: Colors.black, // foreground
                                             ),
                                             onPressed: (){}, child: const Text("Alter")),
                                       ),
                                     )
                                   ],
                                 ),
                               ],
                             ),
                           ),
                              Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                        color:  Colors.white
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text("Accepted",style: TextStyle(
                                                  color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20
                                              ),),
                                            ),
                                            Icon(
                                              Icons.verified_outlined,
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:8.0),
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(10.0),
                                                          topRight: Radius.circular(10.0),
                                                        ),
                                                      ),
                                                      child: Card(
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.all(Radius.circular(18.0))),
                                                        child: ClipRRect(
                                                          borderRadius: const BorderRadius.only(
                                                            topLeft: Radius.circular(18.0),
                                                            topRight: Radius.circular(18.0),
                                                          ),
                                                          child: Image.asset(
                                                            "assets/2.jpg",
                                                            height: 100,
                                                            width: 100,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 100,
                                                    width: 100,
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                            bottomLeft: Radius.circular(10.0),
                                                            bottomRight: Radius.circular(10.0),
                                                          ),
                                                          color: Colors.green),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          children: const [
                                                            Text("1.45 PM"),
                                                            Text(
                                                              "02",
                                                              style: TextStyle(fontSize: 25,color: Colors.white),
                                                            ),
                                                            Text("SEP"),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 38.0),
                                                child: Column(
                                                  children: [
                                                    const Text(
                                                      "Drilling work",
                                                      style: TextStyle(
                                                          fontSize: 20, fontWeight: FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: const [
                                                        Icon(Icons.build_circle_outlined),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Repair Work"),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: const [
                                                        Icon(Icons.location_on_outlined),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 150.0,right: 30),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text("Total:"),
                                              Text('5400',style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1.0,
                                        ),
                                      ],
                                      color:  Colors.white
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text("Pending ",style: TextStyle(
                                                color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20
                                            ),),
                                          ),
                                          Icon(
                                            Icons.error_outline_outlined,
                                            color: Colors.red,
                                          ),
                                          Text("Order Will Transfer to \nanother person with 5mins",style: TextStyle(
                                              color: Colors.red,fontSize: 10
                                          ),),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top:8.0),
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(10.0),
                                                        topRight: Radius.circular(10.0),
                                                      ),
                                                    ),
                                                    child: Card(
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.all(Radius.circular(18.0))),
                                                      child: ClipRRect(
                                                        borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(18.0),
                                                          topRight: Radius.circular(18.0),
                                                        ),
                                                        child: Image.asset(
                                                          "assets/2.jpg",
                                                          height: 100,
                                                          width: 100,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 100,
                                                  width: 100,
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                        borderRadius: BorderRadius.only(
                                                          bottomLeft: Radius.circular(10.0),
                                                          bottomRight: Radius.circular(10.0),
                                                        ),
                                                        color: Colors.green),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        children: const [
                                                          Text("1.45 PM"),
                                                          Text(
                                                            "02",
                                                            style: TextStyle(fontSize: 25,color: Colors.white),
                                                          ),
                                                          Text("SEP"),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 38.0),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    "Drilling work",
                                                    style: TextStyle(
                                                        fontSize: 20, fontWeight: FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: const [
                                                      Icon(Icons.build_circle_outlined),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text("Repair Work"),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 25,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: const [
                                                      Icon(Icons.location_on_outlined),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 150.0,right: 30),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text("Total:"),
                                            Text('5400',style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                            Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1.0,
                                        ),
                                      ],
                                      color:  Colors.white
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text("Completed",style: TextStyle(
                                                color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20
                                            ),),
                                          ),
                                          Icon(
                                            Icons.verified_outlined,
                                            color: Colors.green,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top:8.0),
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(10.0),
                                                        topRight: Radius.circular(10.0),
                                                      ),
                                                    ),
                                                    child: Card(
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.all(Radius.circular(18.0))),
                                                      child: ClipRRect(
                                                        borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(18.0),
                                                          topRight: Radius.circular(18.0),
                                                        ),
                                                        child: Image.asset(
                                                          "assets/2.jpg",
                                                          height: 100,
                                                          width: 100,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 100,
                                                  width: 100,
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                        borderRadius: BorderRadius.only(
                                                          bottomLeft: Radius.circular(10.0),
                                                          bottomRight: Radius.circular(10.0),
                                                        ),
                                                        color: Colors.green),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        children: const [
                                                          Text("1.45 PM"),
                                                          Text(
                                                            "02",
                                                            style: TextStyle(fontSize: 25,color: Colors.white),
                                                          ),
                                                          Text("SEP"),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 38.0),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    "Drilling work",
                                                    style: TextStyle(
                                                        fontSize: 20, fontWeight: FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: const [
                                                      Icon(Icons.build_circle_outlined),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text("Repair Work"),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 25,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: const [
                                                      Icon(Icons.location_on_outlined),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 150.0,right: 30),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text("Total:"),
                                            Text('5400',style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                        color:  Colors.white
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.only(left: 8.0,top: 8.0,bottom: 8.0),
                                              child: Text("Waiting ",style: TextStyle(
                                                  color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20
                                              ),),
                                            ),
                                            Icon(
                                              Icons.error_outline_outlined,
                                              color: Colors.red,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 30.0),
                                              child: Text(" Order is waiting\n for your confirmation",style: TextStyle(
                                                  color: Colors.orangeAccent,fontSize: 13
                                              ),),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:8.0),
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(10.0),
                                                          topRight: Radius.circular(10.0),
                                                        ),
                                                      ),
                                                      child: Card(
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.all(Radius.circular(18.0))),
                                                        child: ClipRRect(
                                                          borderRadius: const BorderRadius.only(
                                                            topLeft: Radius.circular(18.0),
                                                            topRight: Radius.circular(18.0),
                                                          ),
                                                          child: Image.asset(
                                                            "assets/2.jpg",
                                                            height: 100,
                                                            width: 100,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 100,
                                                    width: 100,
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                            bottomLeft: Radius.circular(10.0),
                                                            bottomRight: Radius.circular(10.0),
                                                          ),
                                                          color: Colors.green),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          children: const [
                                                            Text("1.45 PM"),
                                                            Text(
                                                              "02",
                                                              style: TextStyle(fontSize: 25,color: Colors.white),
                                                            ),
                                                            Text("SEP"),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 38.0),
                                                child: Column(
                                                  children: [
                                                    const Text(
                                                      "Drilling work",
                                                      style: TextStyle(
                                                          fontSize: 20, fontWeight: FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: const [
                                                        Icon(Icons.build_circle_outlined),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Repair Work"),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: const [
                                                        Icon(Icons.location_on_outlined),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 150.0,right: 30),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text("Total:"),
                                              Text('5400',style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SizedBox(
                                    height: 40,
                                    width:double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green,
                                          onSurface: Colors.black, // foreground
                                        ),
                                        onPressed: (){}, child: const Text("Alter")),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future pickimages() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      final imagePermanent = await savePermanently(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException {
      print("Filed To Pick Image");
    }
  }

  Future<File> savePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
}

basename(String imagePath) {}
