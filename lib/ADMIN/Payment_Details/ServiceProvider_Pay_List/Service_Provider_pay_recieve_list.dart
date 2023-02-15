import 'package:flutter/material.dart';

class ServiceProviderPayList extends StatefulWidget {
  const ServiceProviderPayList({Key? key}) : super(key: key);

  @override
  State<ServiceProviderPayList> createState() => _ServiceProviderPayListState();
}

class _ServiceProviderPayListState extends State<ServiceProviderPayList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Pay to Service Provider"),
        backgroundColor: Colors.green,
      ),
      body: Column(

      ),
    );
  }
}
