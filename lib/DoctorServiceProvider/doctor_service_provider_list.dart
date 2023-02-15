import 'package:flutter/material.dart';

class DoctorServiceProviderList extends StatefulWidget {
  const DoctorServiceProviderList({Key? key}) : super(key: key);

  @override
  State<DoctorServiceProviderList> createState() => _DoctorServiceProviderListState();
}

class _DoctorServiceProviderListState extends State<DoctorServiceProviderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(child: Text(" No Service ")),
      ),
    ));
  }
}
