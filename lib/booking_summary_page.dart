// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class BookingSummaryPage extends StatefulWidget {
  const BookingSummaryPage({Key? key}) : super(key: key);

  @override
  State<BookingSummaryPage> createState() => _BookingSummaryPageState();
}

class _BookingSummaryPageState extends State<BookingSummaryPage> {

  late Razorpay razorpay;

  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handleErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  void openCheckout(){
    var option ={
      "key": "rzp_test_moeHq3S21yPi3N",
      "amount": 585*100,
      "name" :"sample app ",
      "description":"Payment for app",
      "prefill" : {
        "contact" :"6383747402",
    "email" : "hari@gamil.com",
    },
      "external" :{
        "wallets" : ["Paytm"]
      }
    };
    try{
razorpay.open(option);
    }catch(e){
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Payment Success");
    showDialog(
      context: context,
      builder: (ctx) => const AlertDialog(
        title: Text("You done great job!"),
        content: Text("Our Service Provider will reach you soon 😇."),
        actions: <Widget>[
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  "assets/tick.jpg",
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleErrorFailure(){
    print("Payment Error");
    Toast.show("Check Payment Again");
    
  }
  void handlerExternalWallet(){
    print("External Wallet");
    Toast.show("External Wallet");
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          "Book Summary",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
        )),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: height * 0.30,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.calendar_month_outlined),
                                SizedBox(
                                  width: 30,
                                ),
                                Text("Wednesday ,November 2 2001\n9.30 AM"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFFccebc7),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () async {
                                  // _getCurrentLocation();
                                },
                                icon: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.black,
                                    ))),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("1/299c anna nagar tirupur"),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(22.0),
                            child: Icon(Icons.note_add_outlined),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width: width * 0.60,
                              child: const Text(
                                  "call half an hour before reach me")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: height * 0.20,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: const [
                          Text("Basic Pay:"),
                          Spacer(),
                          Text("₹ 120"),
                        ],
                      ),
                      Row(
                        children: const [
                          Text("Message Service"),
                          Spacer(),
                          Text("₹ 465.00")
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "Total Amount",
                            style: TextStyle(color: Colors.red),
                          ),
                          Spacer(),
                          Text(
                            "₹ 585.00",
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  openCheckout();
                 
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(125.0),
                      bottomRight: Radius.circular(125.0),
                      topRight: Radius.circular(125.0),
                      topLeft: Radius.circular(125.0),
                    ),
                    color: Colors.green,
                  ),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 130.0),
                        child: Text(
                          "Confirm & Booking now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.chevron_right_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
