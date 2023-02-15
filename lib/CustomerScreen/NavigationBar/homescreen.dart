// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:on_demand_home_service/CarServiceProvider/car_service_provider_list.dart';
import 'package:on_demand_home_service/CleanServiceProvider/clean_service_provider_list.dart';
import 'package:on_demand_home_service/DoctorServiceProvider/doctor_service_provider_list.dart';
import 'package:on_demand_home_service/ParlourServiceProvider/parlour_service_provider_list.dart';
import 'package:on_demand_home_service/PlumbingServiceProivder/plumbing_service_provider_list.dart';
import 'package:permission_handler/permission_handler.dart';


class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {



  @override
  void initState() {
    super.initState();

  }

  // for location
  Position? _currentPosition;
  List<Placemark>? placeMarks;
  String? myLocationController;

  final List<String> imgList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
  ];

  List imgsList = [
    'assets/c1.jpg',
    'assets/c2.jpg',
    'assets/c3.jpg',
    'assets/c4.jpg',
    'assets/c6.jpg',
  ];

  List imgsList1 = [
    'assets/D1.jpg',
    'assets/D2.jpg',
    'assets/D3.jpg',
    'assets/D4.jpg',
    'assets/D5.jpg',
    'assets/D6.jpg',
    'assets/D7.jpg',
  ];

  List imgsList2 = [
    'assets/details/AC.jpg',
    'assets/details/mw.jpg',
    'assets/details/rg.jpg',
    'assets/details/sr.jpg',
    'assets/details/wa.jpg',
    'assets/details/Wp.jpg'
  ];

  List<String> titles = [
    "Car Service",
    "Clean",
    "Doctor",
    "Parlour",
    "Plumbing"
  ];

  List<String> titles1 = [
    "Washing Machine Repair \n⭐ 4.78(78.7K)",
    "TV Repair \n⭐ 4.28(19.7K)",
    "Bath Room Cleaning \n⭐ 4.85(19.7K)",
    "Men's Grooming \n⭐ 4.85(19.7K)",
    "Pipe Repair \n⭐ 4.01(29.7K)",
    "AC Mechanic \n⭐ 4.05(19.7K)",
    "Rose Pedicure \n⭐ 4.95(39.7K)"
  ];
  List<String> titles3 = [
    "₹ 179",
    "₹ 150",
    "₹ 159",
    "₹ 120",
    "₹ 159",
    "₹ 279",
    "₹ 179"
  ];
  List<String> titles2 = [
    "Air Conditioner",
    "MicroWave",
    "Refrigerator",
    "Speaker",
    "Washing Machine",
    "Water purifier"
  ];

  var size, height, width;




  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEFEFEF),
      body: Column(
        children: [
          Container(
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(
                      15.0) //                 <--- border radius here
                  ),
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color:  Color(0xFFccebc7),
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
                                child: Icon(Icons.location_on_outlined,color: Colors.black,))),
                      ),
                      if (myLocationController != null) Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$myLocationController"),
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Container(
                    color: Colors.white,
                    height: 50,
                    width: width,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.black12)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.black12)),
                        hintText: "Search here",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 250,
                    width: width,
                    color: Colors.white,
                    child: Builder(builder: (context) {
                      return CarouselSlider(
                        items: imgList
                            .map((item) => Image.asset(
                                  item,
                                  width: width,
                                  fit: BoxFit.cover,
                                ))
                            .toList(),
                        options: CarouselOptions(
                          viewportFraction: 1.0,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            top: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Our Services",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Gridviews()),
                                    );
                                  },
                                  child: const Text("View All")),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 180,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: imgsList.length,
                            separatorBuilder: (context, int index) {
                              return const SizedBox(
                                width: 10.0,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: 150,
                                width: 130,
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Card(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0))),
                                          child: InkWell(
                                            onTap: () {
                                              debugPrint("$index");
                                              if (index == 0) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CarServiceProviderList()),
                                                );
                                              } else if (index == 1) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CleanServiceProviderList()),
                                                );
                                              } else if (index == 2) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DoctorServiceProviderList()),
                                                );
                                              } else if (index == 3) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ParlourServiceProviderList()),
                                                );
                                              } else if (index == 4) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const PlumbingServiceProviderList()),
                                                );
                                              }
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(18.0),
                                                topRight: Radius.circular(18.0),
                                                bottomRight:
                                                    Radius.circular(18.0),
                                                bottomLeft:
                                                    Radius.circular(18.0),
                                              ),
                                              child: Image.asset(
                                                imgsList[index].toString(),
                                                height: 120,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          titles[index],
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Most Booked Services",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GridMostBook()),
                                );
                              },
                              child: const Text("View All"))
                        ],
                      ),
                    ),
                  ), // most booked heading
                  // pic of most booked
                  Container(
                    height: 285,
                    width: width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: imgsList.length,
                        separatorBuilder: (context, int index) {
                          return const SizedBox(
                            width: 10.0,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 150,
                            width: 130,
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Card(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18.0))),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(18.0),
                                          topRight: Radius.circular(18.0),
                                          bottomRight: Radius.circular(18.0),
                                          bottomLeft: Radius.circular(18.0),
                                        ),
                                        child: Image.asset(
                                          imgsList1[index].toString(),
                                          height: 180,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      titles1[index],
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      titles3[index],
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ), //first container for allocating the services
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.black54,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 210.0,
                            top: 10,
                          ),
                          child: Text(
                            "Skin Consultant",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        Stack(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/E.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 25),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Colors.grey,
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    const snackBar = SnackBar(
                                        content: Text('Wait for some times'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  child: const Text(
                                    "Book Now",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ), // most booked service
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Appliance Repair & Service",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const GridAppliance()),
                                    );
                                  },
                                  child: const Text("View All"))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 250,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: imgsList2.length,
                            separatorBuilder: (context, int index) {
                              return const SizedBox(
                                width: 10.0,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: 170,
                                width: 150,
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          titles2[index],
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Card(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0))),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(18.0),
                                              topRight: Radius.circular(18.0),
                                              bottomRight:
                                                  Radius.circular(18.0),
                                              bottomLeft: Radius.circular(18.0),
                                            ),
                                            child: Image.asset(
                                              imgsList2[index].toString(),
                                              height: 170,
                                              width: 140,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ), //appliance repair
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(
                      height: 200,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 2),
                      ),
                      child: Image.asset(
                        "assets/F.jpg",
                        height: 190,
                        width: width,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

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


}

class Gridviews extends StatefulWidget {
  const Gridviews({Key? key}) : super(key: key);

  @override
  State<Gridviews> createState() => _GridviewsState();
}

class _GridviewsState extends State<Gridviews> {
  var size, height, width;

  List imgsList1 = [
    'assets/c1.jpg',
    'assets/c2.jpg',
    'assets/c3.jpg',
    'assets/c4.jpg',
    'assets/c6.jpg',
  ];

  List<String> titles = [
    "Car Service",
    "Clean",
    "Doctor",
    "Parlour",
    "Plumbing"
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Card(
                        color: Colors.amber,
                        child: Image.asset(
                          imgsList1[index].toString(),
                          height: 135,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(titles[index])
                    ],
                  );
                }),
          ),
        ),
      ],
    ));
  }
}

class GridMostBook extends StatefulWidget {
  const GridMostBook({Key? key}) : super(key: key);

  @override
  State<GridMostBook> createState() => _GridMostBookState();
}

class _GridMostBookState extends State<GridMostBook> {
  var size, height, width;

  List<String> titles1 = [
    "Washing Machine Repair \n⭐ 4.78(78.7K)",
    "TV Repair \n⭐ 4.28(19.7K)",
    "Bath Room Cleaning \n⭐ 4.85(19.7K)",
    "Men's Grooming \n⭐ 4.85(19.7K)",
    "Pipe Repair \n⭐ 4.01(29.7K)",
    "AC Mechanic \n⭐ 4.05(19.7K)",
    "Rose Pedicure \n⭐ 4.95(39.7K)"
  ];
  List<String> titles3 = [
    "₹ 179",
    "₹ 150",
    "₹ 159",
    "₹ 120",
    "₹ 159",
    "₹ 279",
    "₹ 179"
  ];

  List imgsList1 = [
    'assets/D1.jpg',
    'assets/D2.jpg',
    'assets/D3.jpg',
    'assets/D4.jpg',
    'assets/D5.jpg',
    'assets/D6.jpg',
    'assets/D7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 8, right: 0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: Colors.amber,
                        child: Image.asset(
                          imgsList1[index].toString(),
                          height: 110,
                          width: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(titles1[index],style: TextStyle(
                          fontSize: 12
                      ),),
                      Text(titles3[index],style: TextStyle(
                        fontSize: 12
                      ),),

                    ],
                  );
                }),
          ),
        ),
      ],
    ));
  }
}

class GridAppliance extends StatefulWidget {
  const GridAppliance({Key? key}) : super(key: key);

  @override
  State<GridAppliance> createState() => _GridApplianceState();
}

class _GridApplianceState extends State<GridAppliance> {
  List imgsList2 = [
    'assets/details/AC.jpg',
    'assets/details/mw.jpg',
    'assets/details/rg.jpg',
    'assets/details/sr.jpg',
    'assets/details/wa.jpg',
    'assets/details/Wp.jpg'
  ];

  List<String> titles2 = [
    "Air Conditioner",
    "MicroWave",
    "Refrigerator",
    "Speaker",
    "Washing Machine",
    "Water purifier"
  ];

  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 8, right: 0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: Colors.amber,
                        child: Image.asset(
                          imgsList2[index].toString(),
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(titles2[index]),
                    ],
                  );
                }),
          ),
        ),
      ],
    ));
  }
}
