import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CleanServiceDetailingPage extends StatefulWidget {
  const CleanServiceDetailingPage({Key? key}) : super(key: key);

  @override
  State<CleanServiceDetailingPage> createState() => _CleanServiceDetailingPageState();
}

class _CleanServiceDetailingPageState extends State<CleanServiceDetailingPage> {


  List imageListhari = [
    'assets/z1.jpg',
    'assets/z2.jpg',
    'assets/z3.jpg',
  ];


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

  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Title(color: Colors.white, child: const Text("Profile")),
              ElevatedButton(
                  onPressed: () {
                    launchwhatsapp(number: "+916383747402",message: "Hello i am hari");

                  },
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.teal;
                        }
                        return Colors.white;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ))),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.share_outlined,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Share",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 20.0,bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
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
                        SizedBox(
                          height: 50,
                        ),
                        Text(" 241 orders "),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Row(
                          children: const [
                            Text(
                              "Hariharan D",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.verified_outlined,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                            "All types of car service\n\nExp: 10years\n\nBasic Pay: ₹120\n\nLocation: Gandhipuram\n\nShop Name: Sri Lakshmi Cars service"),
                        const Text("\nAcceptance Ratio:  92.86% ",style: TextStyle(color: Colors.redAccent ),),
                      ],

                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,bottom: 10),
                child: Row(
                  children: const [
                    Text("Description",style: TextStyle(
                        fontWeight: FontWeight.w700,fontSize: 20
                    ),),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30.0,top: 10),
                child: Text("Hi , My Name is Hariharan and i am car mechanic, i had \nan experience about 10 years on this field. "
                    "I can handle\nall types of services in the car. So i am hear to help you\nall any kind of tougest sitution"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: height * 0.10,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                      ),
                    ],
                    color: Colors.white,
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Duration",style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20
                            ),),
                            Text("This Service Can take Upto: ",style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.w400
                            ),),
                          ],
                        ),
                        Spacer(),
                        Text("04:00",style: TextStyle(
                            fontWeight: FontWeight.bold,color: Colors.green
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,top: 10),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text("Gallery",style: TextStyle(
                            color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20
                        ),),
                      ),
                      Row(
                        children: [

                          Container(
                            height: 285,
                            width: width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 12),
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: imageListhari.length,
                                separatorBuilder: (context, int index) {
                                  return const SizedBox(
                                    width: 10.0,
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 150,
                                    width: 130,
                                    child: Column(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Card(
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(18.0))),
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(18.0),
                                                  topRight: Radius.circular(18.0),
                                                  bottomRight: Radius.circular(18.0),
                                                  bottomLeft: Radius.circular(18.0),
                                                ),
                                                child: Image.asset(
                                                  imageListhari[index].toString(),
                                                  height: 180,
                                                  width: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Rating & Reviews\n\n",style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.w500
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          width: width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: const [
                              Text("4.88",style: TextStyle(
                                  fontSize: 40,fontWeight: FontWeight.w500
                              ),),
                              Text(" ☆ ☆ ☆ ☆ ☆ "),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0,top: 10),
                    child: Text("Comments",style: TextStyle(
                        fontSize: 20,fontWeight: FontWeight.w700
                    ),),
                  ),
                  Text("\n\n"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0) //                 <--- border radius here
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                "assets/elonmusk.jpg",
                              ),
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Shrutika",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),


                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text("  ⭐ ⭐ ⭐ ⭐ ⭐      12.03.2022"),
                          ],
                        ),
                      ),



                      const Padding(
                        padding: EdgeInsets.only(right: 150.0),
                        child: const Text("It was an awesome experience"),
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0) //                 <--- border radius here
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                "assets/elonmusk.jpg",
                              ),
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Deepak",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),


                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text("  ⭐ ⭐ ⭐ ⭐      1.06.2021"),
                          ],
                        ),
                      ),



                      const Padding(
                        padding: EdgeInsets.only(right: 250.0),
                        child: const Text("Amazing"),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
