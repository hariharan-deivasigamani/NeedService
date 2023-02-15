import 'package:flutter/material.dart';

class ServiceProvider extends StatefulWidget {
  const ServiceProvider({Key? key}) : super(key: key);

  @override
  State<ServiceProvider> createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Service Providers"),
          actions: const [],
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Color(0xFFe9f5ed),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("ID: emp2431\n",style: TextStyle(
                            color: Colors.red,fontSize: 20,fontWeight: FontWeight.w700
                        ),),
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
                        Text("\n ⭐ ⭐ ⭐ ⭐ ⭐\n"),
                        Text("241 Orders\n"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(" \nHariharan D\n\n Car Service \n\n 5 Years \n\n 1/299c Anna Nagar Tirupur \n\n 6383747402 \n\n 5KM \n\n 98.35%\n"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Color(0xFFe9f5ed),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("ID: emp2432\n",style: TextStyle(
                          color: Colors.red,fontSize: 20,fontWeight: FontWeight.w700
                        ),),
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
                        Text("\n ⭐ ⭐ ⭐ ⭐ \n"),
                        Text("41 Orders\n"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(" \nVijay S\n\n AC mechanic \n\n 7 Years \n\n 1/9c sakthi Nagar Covai \n\n 6383747402 \n\n 5KM \n\n 98.35%\n"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
