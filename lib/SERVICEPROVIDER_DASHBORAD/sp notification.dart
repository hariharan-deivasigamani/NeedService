import 'package:flutter/material.dart';

class NotificationForServiceProvider extends StatefulWidget {
  const NotificationForServiceProvider({Key? key}) : super(key: key);

  @override
  State<NotificationForServiceProvider> createState() => _NotificationForServiceProviderState();
}

class _NotificationForServiceProviderState extends State<NotificationForServiceProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notfication"),
      backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: Text("Currently! No Notificaition")),
        ],
      ),
    );
  }
}
