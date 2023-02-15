// ignore_for_file: avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'booking_summary_page.dart';

class BookingPageForUser extends StatefulWidget {
  const BookingPageForUser({Key? key}) : super(key: key);

  @override
  State<BookingPageForUser> createState() => _BookingPageForUserState();
}

class _BookingPageForUserState extends State<BookingPageForUser> {


  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 30);

  bool value = false;
  Position? _currentPosition;
  List<Placemark>? placeMarks;
  String? myLocationController;
  TextEditingController dateandtime = TextEditingController();

  // FOR GETTING LOCATION EMPLOYEE PERMISSION
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
          '${pMark.postalCode}';

      debugPrint("clicked sign up: ${pMark.toJson()}");

      setState(() {
        myLocationController = completeAddress.toString();
        debugPrint("clicked sign up: $completeAddress");
      });
    } catch (e) {
      debugPrint("$e");
    }
  }

  void showtimepicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(

        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          "Book the service",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
        )),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.note_add_outlined),
                      const Spacer(),
                      SizedBox(
                        width: width * 0.80,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Hint's For Your Service",
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            "\nAccept, then we will allot you the service as soon as possible"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: value,
                            onChanged: (bool? value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                          const Text("As Soon as possible"),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const Text("Schedule an order"),
                              TextFormField(
                                controller: dateandtime,
                                style: const TextStyle(fontSize: 15),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.calendar_month_outlined),
                                  labelText: 'Date for service',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green)),
                                ),
                                onTap: () async {
                                  DateTime? pickeddate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2022),
                                      lastDate: DateTime(2051));
                                  if (pickeddate != null) {
                                    setState(() {
                                      dateandtime.text = DateFormat('yyyy-MM-dd')
                                          .format(pickeddate);
                                    });
                                  }
                                },
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10, top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text("Ends At"),
                                      Text(
                                        "Pick time for ends at",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                      ),
                                      onPressed: () {
                                        showtimepicker();
                                      },
                                      child: const Text("Select"))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:Text( _timeOfDay.format(context).toString(),style: const TextStyle(
                                  color: Colors.green
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookingSummaryPage()),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(125.0),
                          bottomRight: Radius.circular(125.0),
                          topRight: Radius.circular(125.0),
                          topLeft: Radius.circular(125.0),
                        ),
                        color: Colors.green,
                      ),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 150.0),
                            child: Text("Continue",style: TextStyle(
                              color: Colors.white
                            ),),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.chevron_right_outlined,color: Colors.white,),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
