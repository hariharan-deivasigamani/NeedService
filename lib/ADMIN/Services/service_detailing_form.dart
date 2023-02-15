import 'package:flutter/material.dart';
import 'package:on_demand_home_service/ADMIN/Services/list_view_of_subcatogery.dart';

import 'add_sub_service_detailing.dart';

class ServiceDetailingForm extends StatefulWidget {
  const ServiceDetailingForm({Key? key}) : super(key: key);

  @override
  State<ServiceDetailingForm> createState() => _ServiceDetailingFormState();
}

class _ServiceDetailingFormState extends State<ServiceDetailingForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sub Catogery Form"),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddingSubServiceDetailing()),
              );
            }, icon: const Icon(Icons.add))
          ],
          backgroundColor: Colors.green,
        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubCatogeryListView(),),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Color(0xFFd3edf2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
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
                              "assets/1.jpg",
                              height: 130,
                              width: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Cleaning\n\n\n 2.4.2021\n\n\n User can order for cleaning"),

                      ],
                    ),



                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
