import 'package:flutter/material.dart';

class ParlourServiceProviderList extends StatefulWidget {
  const ParlourServiceProviderList({Key? key}) : super(key: key);

  @override
  State<ParlourServiceProviderList> createState() => _ParlourServiceProviderListState();
}

class _ParlourServiceProviderListState extends State<ParlourServiceProviderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(child: Text(" currently unavailable service")),
        ),
      ),
    );
  }
}
