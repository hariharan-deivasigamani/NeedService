import 'package:flutter/material.dart';
import 'package:on_demand_home_service/CarServiceProvider/detailing_page_service_provider.dart';
import 'package:on_demand_home_service/booking_page.dart';

class CarServiceProviderList extends StatefulWidget {
  const CarServiceProviderList({Key? key}) : super(key: key);

  @override
  State<CarServiceProviderList> createState() => _CarServiceProviderListState();
}

class _CarServiceProviderListState extends State<CarServiceProviderList> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Title(color: Colors.white, child: const Text("Car Mechanics")),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CarMachDetailPage()),
                  );
                },
                child: Container(
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: const [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                  "assets/elonmusk.jpg",
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Text("\n ⭐ ⭐ ⭐ ⭐ ⭐"),
                            Text(" 241 orders ")
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hariharan D",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "All types of car service\n\nExp: 10years\n\nBasic Pay: ₹120"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.verified_outlined,
                              color: Colors.green,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                                height: 40,
                                width: 70,
                                child: ElevatedButton(
                                    onPressed: () {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const BookingPageForUser()),
                                      );
                                    },
                                    child: const Text(
                                      "Book",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          // If the button is pressed, return green, otherwise blue
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            return Colors.green;
                                          }
                                          return Colors.white;
                                        }),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: const BorderSide(
                                            color: Colors.grey,
                                            width: 2.0,
                                          ),
                                        ))))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
