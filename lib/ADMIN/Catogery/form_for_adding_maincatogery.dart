import 'package:flutter/material.dart';
import 'package:on_demand_home_service/ADMIN/Catogery/form_for_adding_catogery.dart';

class MainCatogeryAdding extends StatefulWidget {
  const MainCatogeryAdding({Key? key}) : super(key: key);

  @override
  State<MainCatogeryAdding> createState() => _MainCatogeryAddingState();
}

class _MainCatogeryAddingState extends State<MainCatogeryAdding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Catogery Form"),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FormForAddingService()),
              );
            }, icon: const Icon(Icons.add))
          ],
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Color(0xFFe9f7d1),
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
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Color(0xFFe9f7d1),
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
                            "assets/2.jpg",
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
                      Text("Electrician\n\n\n 28.6.2002\n\n\n User can order for electrician"),

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
                color: Color(0xFFe9f7d1),
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
                            "assets/3.jpg",
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
                      Text("Car Service\n\n\n 12.9.2022\n\n\n User can order for Car Service"),

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
                color: Color(0xFFe9f7d1),
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
                            "assets/5.jpg",
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
                      Text("Men's Sallon\n\n\n 2.2.2022\n\n\n User can order for Hair Sallon"),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
