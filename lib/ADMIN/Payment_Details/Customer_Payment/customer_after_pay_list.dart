import 'package:flutter/material.dart';

class CustomerServiceCompletionPayment extends StatefulWidget {
  const CustomerServiceCompletionPayment({Key? key}) : super(key: key);

  @override
  State<CustomerServiceCompletionPayment> createState() => _CustomerServiceCompletionPaymentState();
}

class _CustomerServiceCompletionPaymentState extends State<CustomerServiceCompletionPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay From Customer"),
        backgroundColor: Colors.green,
      ),
      body: Column(

      ),
    );
  }
}
