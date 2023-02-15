import 'package:flutter/material.dart';

class MyProvidersForServiceProvider extends StatefulWidget {
  const MyProvidersForServiceProvider({Key? key}) : super(key: key);

  @override
  State<MyProvidersForServiceProvider> createState() => _MyProvidersForServiceProviderState();
}

class _MyProvidersForServiceProviderState extends State<MyProvidersForServiceProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Provider"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            children: [
              Text("Car service"),
              SizedBox(
                height: 20,
              ),
              Text("Hair Saloon"),
            ],
          ),
        ),
      ),
    );
  }
}
