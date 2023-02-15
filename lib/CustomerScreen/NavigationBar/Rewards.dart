import 'package:flutter/material.dart';
import 'package:on_demand_home_service/user_login_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {

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
      "amount": 250 *100,
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

  List<String> titles = ["Bronze Subscription", "Gold Subscription", "Diamond Subscription"];

  List<String> titles1 = ["Individual : \nFor single users\n\n₹250 / per month","Individual : \nFor single users\n\n₹500 / per month","Individual : \nFor single users\n\n₹1000 / per month"];

  void launchwhatsapp({@required number , @required message}) async{

    final Uri url = Uri.parse("whatsapp://send?phone=$number&text=$message");
    if(!await canLaunchUrl(url))
    {
     await launchUrl(url);
    }
    else
      {
        print("Error");
        throw 'error occured';
      }
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
          title: const Text(

            "Refer & Subscription",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: width,
                decoration: const BoxDecoration(
                  color: Color(0xFFd9f4fa),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 18.0,top: 7),
                      child: Text(
                        "Refer and get FREE service",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text(
                              "Invite your friends to try \nCloudi5 Service company \nservices. They get instant ₹300 OFF."),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0))),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(18.0),
                              topRight: Radius.circular(18.0),
                              bottomRight: Radius.circular(18.0),
                              bottomLeft: Radius.circular(18.0),
                            ),
                            child: Image.asset(
                              'assets/rewards/gift.jpg',
                              height: 80,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(
                                left: 10.0, right: 20.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                      const Text("Refer via"),
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(
                                left: 20.0, right: 10.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      launchwhatsapp(number: "+916383747402",message: "Hello i am hari");

                                    },
                                    icon: const Icon(
                                      Icons.whatsapp_outlined,
                                      color: Colors.green,
                                      size: 35,
                                    )))),
                        Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      final Uri url1 = Uri.parse("https://www.facebook.com/theri.hari.1447");
                                      launchUrl(url1);
                                    },
                                    icon: const Icon(
                                      Icons.facebook_outlined,
                                      color: Colors.blue,
                                      size: 35,
                                    )))),
                        Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      final Uri url2 = Uri.parse("https://web.telegram.org/k/");
                                      launchUrl(url2);
                                    },
                                    icon: const Icon(
                                      Icons.telegram_outlined,
                                      color: Colors.lightBlue,
                                      size: 35,
                                    )))),
                        Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      final Uri url3 = Uri.parse("https://www.linkedin.com/in/hariharan-deivasigamani/");
                                      launchUrl(url3);

                                    },
                                    icon: const Icon(
                                      Icons.text_fields,
                                      color: Colors.blueAccent,
                                      size: 35,
                                    )))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: width * 0.90,
                decoration: const BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(8)),
                    color: Color(0xFFdce0e0)),
                child: Padding(
                  padding: const EdgeInsets.only(right: 38.0),
                  child: Column(
                    children:  [
                      SizedBox(
                        height: height*0.05,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8.0,right: 205),
                          child: Text(
                            "STEPS:\n",
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                          "   1. Invite a person's \n\n  2. They get link of ₹300 towards their 1st service\n\n  3. You ₹100 after they complete service.\n"),
                    ],
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const TermsandCondition()),
                    );
                  },
                  child: const Text(
                    "◙   Terms and conditions",
                    style: TextStyle(color: Colors.blue),
                  )),

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Get Subscription for receive orders",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),


              Container(
                height: height * 0.30,
                width: width,
                decoration: const BoxDecoration(
                  color: Color(0xFFedd9fc),
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount:3,
                    itemBuilder: (BuildContext context, int index)

                    {
                      return Container(
                        width: 140,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  10.0) //                 <--- border radius here
                          ),
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                titles[index],
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                              const Divider(
                                color: Colors.black,
                                height: 20,
                                thickness: 1.5,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                titles1[index],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  openCheckout();
                                },
                                child: const Text("Buy now"),
                                style: ElevatedButton.styleFrom(
                                  primary:
                                  const Color(0xFF43b54c),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10,
                      );
                    },),
                )
              ),







              const SizedBox(height: 20.0,),
              Container(
                width: width * 0.90,
                decoration: const BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(8)),
                    color: Color(0xFFdce0e0)),
                child: Padding(
                  padding: const EdgeInsets.only(right: 38.0),
                  child: Column(
                    children:  [
                      SizedBox(
                        height: height*0.05,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8.0,right: 205),
                          child: Text(
                            "STEPS:\n",
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                          "   1. Click a Buy Button \n\n  2. It will take you to Payment Method\n\n  3. You can pay the amount after subscription will add to you profile\n"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }

}
