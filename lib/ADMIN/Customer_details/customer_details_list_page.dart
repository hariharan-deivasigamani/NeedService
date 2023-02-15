import 'package:flutter/material.dart';

class CustomerDetailsList extends StatefulWidget {
  const CustomerDetailsList({Key? key}) : super(key: key);

  @override
  State<CustomerDetailsList> createState() => _CustomerDetailsListState();
}

class _CustomerDetailsListState extends State<CustomerDetailsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Details"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Color(0xFFe9f7df),
            ),
            child: Column(
              children: [
                const Text(
                  "ID: ctm2431",
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Text("Hariharan D\n\nCar Service \n\n 08 Orders"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                            "\n5 Years \n\n 1/299c Anna Nagar Tirupur \n\n 6383747402 \n\n hariharan.d.19msc@kongu.edu \n\n 98.35%"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Color(0xFFe9f7df),
            ),
            child: Column(
              children: [
                const Text(
                  "ID: ctm2432",
                  style: const TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Text("Vijay D\n\nAC Service \n\n 02 Orders"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                            "\n 1/299c Anna Nagar Tirupur \n\n 6383747402 \n\n vijay543@gmai.com \n\n 98.35%"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Color(0xFFe9f7df),
            ),
            child: Column(
              children: [
                const Text(
                  "ID: ctm2433",
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Text("Selvaraj K\n\nHari Sallon \n\n 2 Orders"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                            "\n 1/2c vangipalayam Tirupur \n\n 6383747402\n\nselvarajdevope@gmai.com\n\n 98.35%\n"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Color(0xFFe9f7df),
            ),
            child: Column(
              children: [
                const Text(
                  "ID: ctm2434",
                  style: const TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Text("Hariharan D\n\nParlour Service \n\n 17 Orders"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                            "\n 1/299c Anna Nagar Tirupur \n\n 9942240958 \n\n hariharan.d.19msc@kongu.edu \n\n 4.32%\n"),
                      ],
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
}
