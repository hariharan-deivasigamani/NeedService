import 'package:flutter/material.dart';
import 'package:on_demand_home_service/ADMIN/Payment_Details/Customer_Payment/customer_after_pay_list.dart';
import 'package:on_demand_home_service/ADMIN/Payment_Details/ServiceProvider_Pay_List/Service_Provider_pay_recieve_list.dart';

class CustomerPaymentDetails extends StatefulWidget {
  const CustomerPaymentDetails({Key? key}) : super(key: key);

  @override
  State<CustomerPaymentDetails> createState() => _CustomerPaymentDetailsState();
}

class _CustomerPaymentDetailsState extends State<CustomerPaymentDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Details"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomerServiceCompletionPayment(
                      )),
                );
              },
              child: Container(
                height:height * 0.10,
                width: width *0.50,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      // topRight: Radius.circular(18.0),
                      bottomRight: Radius.circular(18.0),
                      // bottomLeft: Radius.circular(18.0),
                    ),
                    color: Colors.white
                ),
                child: const Center(child: Text("Customer Payment")),
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ServiceProviderPayList(
                      )),
                );
              },
              child: Container(
                height:height * 0.10,
                width: width *0.50,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      // topRight: Radius.circular(18.0),
                      bottomRight: Radius.circular(18.0),
                      // bottomLeft: Radius.circular(18.0),
                    ),
                    color: Colors.white
                ),
                child: const Center(child: Text("Service Provider payment")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
