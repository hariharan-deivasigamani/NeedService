import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> with TickerProviderStateMixin {

  late TabController controller;

  var size, height, width;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 5,
      vsync: this,
    );
  }


  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking page"),
        backgroundColor: Colors.green,
      ),
     body:  SingleChildScrollView(
       physics: AlwaysScrollableScrollPhysics(),
       child: Column(
         children: [
           DefaultTabController(
             length: 5,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 TabBar(
                     controller: controller,
                     isScrollable: true,
                     labelColor: Colors.black,
                     unselectedLabelColor: Colors.black12,
                     labelStyle:const TextStyle(color: Colors.green),
                     unselectedLabelStyle: const TextStyle(color: Colors.red),
                     indicator: BoxDecoration(
                       borderRadius: BorderRadius.circular(20), // Creates border
                       color:const Color(0xFFccebc7), ),
                     // indicator: BoxDecoration(
                     //   border: Border.all(color: Colors.green),
                     //   borderRadius: BorderRadius.circular(10),
                     //   color: Colors.white,
                     // ),
                     tabs: const [
                       Tab(
                         text: "All Orders" ,
                       ),
                       Tab(
                         text: "Accepted" ,
                       ),
                       Tab(
                         text: "On the way",
                       ),
                       Tab(
                         text: "Done",
                       ),
                       Tab(
                         text: "Failed",
                       ),
                     ]
                 ),
                 SizedBox(
                   width: double.maxFinite,
                   height: height,
                   child: TabBarView(
                     controller: controller,
                     physics: const NeverScrollableScrollPhysics(),
                     children: [
                       SingleChildScrollView(
                         child: Column(
                           children: [
                             Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                   child: Container(
                                     decoration: const BoxDecoration(
                                         borderRadius: BorderRadius.only(
                                           bottomLeft: Radius.circular(10.0),
                                           bottomRight: Radius.circular(10.0),
                                           topLeft: Radius.circular(10.0),
                                           topRight: Radius.circular(10.0),
                                         ),
                                         boxShadow: [
                                           BoxShadow(
                                             color: Colors.grey,
                                             blurRadius: 1.0,
                                           ),
                                         ],
                                         color:  Colors.white
                                     ),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Row(
                                           children: const [
                                             Padding(
                                               padding: EdgeInsets.all(8.0),
                                               child: Text("Accepted",style: TextStyle(
                                                   color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20
                                               ),),
                                             ),
                                             Icon(
                                               Icons.verified_outlined,
                                               color: Colors.red,
                                             ),
                                           ],
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 8.0),
                                           child: Row(
                                             children: [
                                               Column(
                                                 children: [
                                                   Padding(
                                                     padding: const EdgeInsets.only(top:8.0),
                                                     child: Container(
                                                       decoration: const BoxDecoration(
                                                         borderRadius: BorderRadius.only(
                                                           topLeft: Radius.circular(10.0),
                                                           topRight: Radius.circular(10.0),
                                                         ),
                                                       ),
                                                       child: Card(
                                                         shape: const RoundedRectangleBorder(
                                                             borderRadius:
                                                             BorderRadius.all(Radius.circular(18.0))),
                                                         child: ClipRRect(
                                                           borderRadius: const BorderRadius.only(
                                                             topLeft: Radius.circular(18.0),
                                                             topRight: Radius.circular(18.0),
                                                           ),
                                                           child: Image.asset(
                                                             "assets/2.jpg",
                                                             height: 100,
                                                             width: 100,
                                                             fit: BoxFit.cover,
                                                           ),
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                   SizedBox(
                                                     height: 100,
                                                     width: 100,
                                                     child: Container(
                                                       decoration: const BoxDecoration(
                                                           borderRadius: BorderRadius.only(
                                                             bottomLeft: Radius.circular(10.0),
                                                             bottomRight: Radius.circular(10.0),
                                                           ),
                                                           color: Colors.green),
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: Column(
                                                           children: const [
                                                             Text("1.45 PM"),
                                                             Text(
                                                               "02",
                                                               style: TextStyle(fontSize: 25,color: Colors.white),
                                                             ),
                                                             Text("SEP"),
                                                           ],
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 38.0),
                                                 child: Column(
                                                   children: [
                                                     const Text(
                                                       "Drilling work",
                                                       style: TextStyle(
                                                           fontSize: 20, fontWeight: FontWeight.bold),
                                                     ),
                                                     const SizedBox(
                                                       height: 20,
                                                     ),
                                                     Row(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: const [
                                                         Icon(Icons.build_circle_outlined),
                                                         SizedBox(
                                                           width: 10,
                                                         ),
                                                         Text("Repair Work"),
                                                       ],
                                                     ),
                                                     const SizedBox(
                                                       height: 25,
                                                     ),
                                                     Row(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: const [
                                                         Icon(Icons.location_on_outlined),
                                                         SizedBox(
                                                           width: 10,
                                                         ),
                                                         Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                       ],
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 150.0,right: 30),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: const [
                                               Text("Total:"),
                                               Text('5400',style: TextStyle(
                                                   fontWeight: FontWeight.bold
                                               ),),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                   child: Container(
                                     decoration: const BoxDecoration(
                                         borderRadius: BorderRadius.only(
                                           bottomLeft: Radius.circular(10.0),
                                           bottomRight: Radius.circular(10.0),
                                           topLeft: Radius.circular(10.0),
                                           topRight: Radius.circular(10.0),
                                         ),
                                         boxShadow: [
                                           BoxShadow(
                                             color: Colors.grey,
                                             blurRadius: 1.0,
                                           ),
                                         ],
                                         color:  Colors.white
                                     ),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Row(
                                           children: const [
                                             Padding(
                                               padding: EdgeInsets.all(8.0),
                                               child: Text("Pending ",style: TextStyle(
                                                   color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20
                                               ),),
                                             ),
                                             Icon(
                                               Icons.error_outline_outlined,
                                               color: Colors.red,
                                             ),
                                             Text("Order Will Transfer to another person with 5mins",style: TextStyle(
                                                 color: Colors.red,fontSize: 10
                                             ),),
                                           ],
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 8.0),
                                           child: Row(
                                             children: [
                                               Column(
                                                 children: [
                                                   Padding(
                                                     padding: const EdgeInsets.only(top:8.0),
                                                     child: Container(
                                                       decoration: const BoxDecoration(
                                                         borderRadius: BorderRadius.only(
                                                           topLeft: Radius.circular(10.0),
                                                           topRight: Radius.circular(10.0),
                                                         ),
                                                       ),
                                                       child: Card(
                                                         shape: const RoundedRectangleBorder(
                                                             borderRadius:
                                                             BorderRadius.all(Radius.circular(18.0))),
                                                         child: ClipRRect(
                                                           borderRadius: const BorderRadius.only(
                                                             topLeft: Radius.circular(18.0),
                                                             topRight: Radius.circular(18.0),
                                                           ),
                                                           child: Image.asset(
                                                             "assets/2.jpg",
                                                             height: 100,
                                                             width: 100,
                                                             fit: BoxFit.cover,
                                                           ),
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                   SizedBox(
                                                     height: 100,
                                                     width: 100,
                                                     child: Container(
                                                       decoration: const BoxDecoration(
                                                           borderRadius: BorderRadius.only(
                                                             bottomLeft: Radius.circular(10.0),
                                                             bottomRight: Radius.circular(10.0),
                                                           ),
                                                           color: Colors.green),
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: Column(
                                                           children: const [
                                                             Text("1.45 PM"),
                                                             Text(
                                                               "02",
                                                               style: TextStyle(fontSize: 25,color: Colors.white),
                                                             ),
                                                             Text("SEP"),
                                                           ],
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 38.0),
                                                 child: Column(
                                                   children: [
                                                     const Text(
                                                       "Drilling work",
                                                       style: TextStyle(
                                                           fontSize: 20, fontWeight: FontWeight.bold),
                                                     ),
                                                     const SizedBox(
                                                       height: 20,
                                                     ),
                                                     Row(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: const [
                                                         Icon(Icons.build_circle_outlined),
                                                         SizedBox(
                                                           width: 10,
                                                         ),
                                                         Text("Repair Work"),
                                                       ],
                                                     ),
                                                     const SizedBox(
                                                       height: 25,
                                                     ),
                                                     Row(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: const [
                                                         Icon(Icons.location_on_outlined),
                                                         SizedBox(
                                                           width: 10,
                                                         ),
                                                         Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                       ],
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 150.0,right: 30),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: const [
                                               Text("Total:"),
                                               Text('5400',style: TextStyle(
                                                   fontWeight: FontWeight.bold
                                               ),),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                   child: Container(
                                     decoration: const BoxDecoration(
                                         borderRadius: BorderRadius.only(
                                           bottomLeft: Radius.circular(10.0),
                                           bottomRight: Radius.circular(10.0),
                                           topLeft: Radius.circular(10.0),
                                           topRight: Radius.circular(10.0),
                                         ),
                                         boxShadow: [
                                           BoxShadow(
                                             color: Colors.grey,
                                             blurRadius: 1.0,
                                           ),
                                         ],
                                         color:  Colors.white
                                     ),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Row(
                                           children: const [
                                             Padding(
                                               padding: EdgeInsets.all(8.0),
                                               child: Text("Completed",style: TextStyle(
                                                   color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20
                                               ),),
                                             ),
                                             Icon(
                                               Icons.verified_outlined,
                                               color: Colors.green,
                                             ),
                                           ],
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 8.0),
                                           child: Row(
                                             children: [
                                               Column(
                                                 children: [
                                                   Padding(
                                                     padding: const EdgeInsets.only(top:8.0),
                                                     child: Container(
                                                       decoration: const BoxDecoration(
                                                         borderRadius: BorderRadius.only(
                                                           topLeft: Radius.circular(10.0),
                                                           topRight: Radius.circular(10.0),
                                                         ),
                                                       ),
                                                       child: Card(
                                                         shape: const RoundedRectangleBorder(
                                                             borderRadius:
                                                             BorderRadius.all(Radius.circular(18.0))),
                                                         child: ClipRRect(
                                                           borderRadius: const BorderRadius.only(
                                                             topLeft: Radius.circular(18.0),
                                                             topRight: Radius.circular(18.0),
                                                           ),
                                                           child: Image.asset(
                                                             "assets/2.jpg",
                                                             height: 100,
                                                             width: 100,
                                                             fit: BoxFit.cover,
                                                           ),
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                   SizedBox(
                                                     height: 100,
                                                     width: 100,
                                                     child: Container(
                                                       decoration: const BoxDecoration(
                                                           borderRadius: BorderRadius.only(
                                                             bottomLeft: Radius.circular(10.0),
                                                             bottomRight: Radius.circular(10.0),
                                                           ),
                                                           color: Colors.green),
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: Column(
                                                           children: const [
                                                             Text("1.45 PM"),
                                                             Text(
                                                               "02",
                                                               style: TextStyle(fontSize: 25,color: Colors.white),
                                                             ),
                                                             Text("SEP"),
                                                           ],
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 38.0),
                                                 child: Column(
                                                   children: [
                                                     const Text(
                                                       "Drilling work",
                                                       style: TextStyle(
                                                           fontSize: 20, fontWeight: FontWeight.bold),
                                                     ),
                                                     const SizedBox(
                                                       height: 20,
                                                     ),
                                                     Row(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: const [
                                                         Icon(Icons.build_circle_outlined),
                                                         SizedBox(
                                                           width: 10,
                                                         ),
                                                         Text("Repair Work"),
                                                       ],
                                                     ),
                                                     const SizedBox(
                                                       height: 25,
                                                     ),
                                                     Row(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: const [
                                                         Icon(Icons.location_on_outlined),
                                                         SizedBox(
                                                           width: 10,
                                                         ),
                                                         Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                       ],
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 150.0,right: 30),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: const [
                                               Text("Total:"),
                                               Text('5400',style: TextStyle(
                                                   fontWeight: FontWeight.bold
                                               ),),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                                   child: Container(
                                     decoration: const BoxDecoration(
                                         borderRadius: BorderRadius.only(
                                           bottomLeft: Radius.circular(10.0),
                                           bottomRight: Radius.circular(10.0),
                                           topLeft: Radius.circular(10.0),
                                           topRight: Radius.circular(10.0),
                                         ),
                                         boxShadow: [
                                           BoxShadow(
                                             color: Colors.grey,
                                             blurRadius: 1.0,
                                           ),
                                         ],
                                         color:  Colors.white
                                     ),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Row(
                                           children: const [
                                             Padding(
                                               padding: EdgeInsets.only(left: 8.0,top: 8.0,bottom: 8.0),
                                               child: Text(" Cancel ",style: TextStyle(
                                                   color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20
                                               ),),
                                             ),
                                             Icon(
                                               Icons.error_outline_outlined,
                                               color: Colors.red,
                                             ),
                                             Padding(
                                               padding: EdgeInsets.only(left: 30.0),
                                               child: Text(" Order is Cancel due to lack of \n service provider",style: TextStyle(
                                                   color: Colors.orangeAccent,fontSize: 13
                                               ),),
                                             ),
                                           ],
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 8.0),
                                           child: Row(
                                             children: [
                                               Column(
                                                 children: [
                                                   Padding(
                                                     padding: const EdgeInsets.only(top:8.0),
                                                     child: Container(
                                                       decoration: const BoxDecoration(
                                                         borderRadius: BorderRadius.only(
                                                           topLeft: Radius.circular(10.0),
                                                           topRight: Radius.circular(10.0),
                                                         ),
                                                       ),
                                                       child: Card(
                                                         shape: const RoundedRectangleBorder(
                                                             borderRadius:
                                                             BorderRadius.all(Radius.circular(18.0))),
                                                         child: ClipRRect(
                                                           borderRadius: const BorderRadius.only(
                                                             topLeft: Radius.circular(18.0),
                                                             topRight: Radius.circular(18.0),
                                                           ),
                                                           child: Image.asset(
                                                             "assets/2.jpg",
                                                             height: 100,
                                                             width: 100,
                                                             fit: BoxFit.cover,
                                                           ),
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                   SizedBox(
                                                     height: 100,
                                                     width: 100,
                                                     child: Container(
                                                       decoration: const BoxDecoration(
                                                           borderRadius: BorderRadius.only(
                                                             bottomLeft: Radius.circular(10.0),
                                                             bottomRight: Radius.circular(10.0),
                                                           ),
                                                           color: Colors.green),
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: Column(
                                                           children: const [
                                                             Text("1.45 PM"),
                                                             Text(
                                                               "02",
                                                               style: TextStyle(fontSize: 25,color: Colors.white),
                                                             ),
                                                             Text("SEP"),
                                                           ],
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 38.0),
                                                 child: Column(
                                                   children: [
                                                     const Text(
                                                       "Drilling work",
                                                       style: TextStyle(
                                                           fontSize: 20, fontWeight: FontWeight.bold),
                                                     ),
                                                     const SizedBox(
                                                       height: 20,
                                                     ),
                                                     Row(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: const [
                                                         Icon(Icons.build_circle_outlined),
                                                         SizedBox(
                                                           width: 10,
                                                         ),
                                                         Text("Repair Work"),
                                                       ],
                                                     ),
                                                     const SizedBox(
                                                       height: 25,
                                                     ),
                                                     Row(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: const [
                                                         Icon(Icons.location_on_outlined),
                                                         SizedBox(
                                                           width: 10,
                                                         ),
                                                         Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                       ],
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 150.0,right: 30),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: const [
                                               Text("Total:"),
                                               Text('5400',style: TextStyle(
                                                   fontWeight: FontWeight.bold
                                               ),),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(15.0),
                                   child: SizedBox(
                                     height: 40,
                                     width:double.infinity,
                                     child: ElevatedButton(
                                         style: ElevatedButton.styleFrom(
                                           primary: Colors.green,
                                           onSurface: Colors.black, // foreground
                                         ),
                                         onPressed: (){}, child: const Text("Alter")),
                                   ),
                                 )
                               ],
                             ),
                           ],
                         ),
                       ),
                       Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                             child: Container(
                               decoration: const BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                     bottomLeft: Radius.circular(10.0),
                                     bottomRight: Radius.circular(10.0),
                                     topLeft: Radius.circular(10.0),
                                     topRight: Radius.circular(10.0),
                                   ),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey,
                                       blurRadius: 1.0,
                                     ),
                                   ],
                                   color:  Colors.white
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: const [
                                       Padding(
                                         padding: EdgeInsets.all(8.0),
                                         child: Text("Accepted",style: TextStyle(
                                             color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20
                                         ),),
                                       ),
                                       Icon(
                                         Icons.verified_outlined,
                                         color: Colors.red,
                                       ),
                                     ],
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 8.0),
                                     child: Row(
                                       children: [
                                         Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(top:8.0),
                                               child: Container(
                                                 decoration: const BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topLeft: Radius.circular(10.0),
                                                     topRight: Radius.circular(10.0),
                                                   ),
                                                 ),
                                                 child: Card(
                                                   shape: const RoundedRectangleBorder(
                                                       borderRadius:
                                                       BorderRadius.all(Radius.circular(18.0))),
                                                   child: ClipRRect(
                                                     borderRadius: const BorderRadius.only(
                                                       topLeft: Radius.circular(18.0),
                                                       topRight: Radius.circular(18.0),
                                                     ),
                                                     child: Image.asset(
                                                       "assets/2.jpg",
                                                       height: 100,
                                                       width: 100,
                                                       fit: BoxFit.cover,
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                             ),
                                             SizedBox(
                                               height: 100,
                                               width: 100,
                                               child: Container(
                                                 decoration: const BoxDecoration(
                                                     borderRadius: BorderRadius.only(
                                                       bottomLeft: Radius.circular(10.0),
                                                       bottomRight: Radius.circular(10.0),
                                                     ),
                                                     color: Colors.green),
                                                 child: Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Column(
                                                     children: const [
                                                       Text("1.45 PM"),
                                                       Text(
                                                         "02",
                                                         style: TextStyle(fontSize: 25,color: Colors.white),
                                                       ),
                                                       Text("SEP"),
                                                     ],
                                                   ),
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 38.0),
                                           child: Column(
                                             children: [
                                               const Text(
                                                 "Drilling work",
                                                 style: TextStyle(
                                                     fontSize: 20, fontWeight: FontWeight.bold),
                                               ),
                                               const SizedBox(
                                                 height: 20,
                                               ),
                                               Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: const [
                                                   Icon(Icons.build_circle_outlined),
                                                   SizedBox(
                                                     width: 10,
                                                   ),
                                                   Text("Repair Work"),
                                                 ],
                                               ),
                                               const SizedBox(
                                                 height: 25,
                                               ),
                                               Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: const [
                                                   Icon(Icons.location_on_outlined),
                                                   SizedBox(
                                                     width: 10,
                                                   ),
                                                   Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                 ],
                                               ),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 150.0,right: 30),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: const [
                                         Text("Total:"),
                                         Text('5400',style: TextStyle(
                                             fontWeight: FontWeight.bold
                                         ),),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                       Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                             child: Container(
                               decoration: const BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                     bottomLeft: Radius.circular(10.0),
                                     bottomRight: Radius.circular(10.0),
                                     topLeft: Radius.circular(10.0),
                                     topRight: Radius.circular(10.0),
                                   ),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey,
                                       blurRadius: 1.0,
                                     ),
                                   ],
                                   color:  Colors.white
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: const [
                                       Padding(
                                         padding: EdgeInsets.all(8.0),
                                         child: Text("Pending ",style: TextStyle(
                                             color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20
                                         ),),
                                       ),
                                       Icon(
                                         Icons.error_outline_outlined,
                                         color: Colors.red,
                                       ),
                                       Text("Order Will Transfer to another person with 5mins",style: TextStyle(
                                           color: Colors.red,fontSize: 10
                                       ),),
                                     ],
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 8.0),
                                     child: Row(
                                       children: [
                                         Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(top:8.0),
                                               child: Container(
                                                 decoration: const BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topLeft: Radius.circular(10.0),
                                                     topRight: Radius.circular(10.0),
                                                   ),
                                                 ),
                                                 child: Card(
                                                   shape: const RoundedRectangleBorder(
                                                       borderRadius:
                                                       BorderRadius.all(Radius.circular(18.0))),
                                                   child: ClipRRect(
                                                     borderRadius: const BorderRadius.only(
                                                       topLeft: Radius.circular(18.0),
                                                       topRight: Radius.circular(18.0),
                                                     ),
                                                     child: Image.asset(
                                                       "assets/2.jpg",
                                                       height: 100,
                                                       width: 100,
                                                       fit: BoxFit.cover,
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                             ),
                                             SizedBox(
                                               height: 100,
                                               width: 100,
                                               child: Container(
                                                 decoration: const BoxDecoration(
                                                     borderRadius: BorderRadius.only(
                                                       bottomLeft: Radius.circular(10.0),
                                                       bottomRight: Radius.circular(10.0),
                                                     ),
                                                     color: Colors.green),
                                                 child: Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Column(
                                                     children: const [
                                                       Text("1.45 PM"),
                                                       Text(
                                                         "02",
                                                         style: TextStyle(fontSize: 25,color: Colors.white),
                                                       ),
                                                       Text("SEP"),
                                                     ],
                                                   ),
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 38.0),
                                           child: Column(
                                             children: [
                                               const Text(
                                                 "Drilling work",
                                                 style: TextStyle(
                                                     fontSize: 20, fontWeight: FontWeight.bold),
                                               ),
                                               const SizedBox(
                                                 height: 20,
                                               ),
                                               Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: const [
                                                   Icon(Icons.build_circle_outlined),
                                                   SizedBox(
                                                     width: 10,
                                                   ),
                                                   Text("Repair Work"),
                                                 ],
                                               ),
                                               const SizedBox(
                                                 height: 25,
                                               ),
                                               Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: const [
                                                   Icon(Icons.location_on_outlined),
                                                   SizedBox(
                                                     width: 10,
                                                   ),
                                                   Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                 ],
                                               ),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 150.0,right: 30),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: const [
                                         Text("Total:"),
                                         Text('5400',style: TextStyle(
                                             fontWeight: FontWeight.bold
                                         ),),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                       Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                             child: Container(
                               decoration: const BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                     bottomLeft: Radius.circular(10.0),
                                     bottomRight: Radius.circular(10.0),
                                     topLeft: Radius.circular(10.0),
                                     topRight: Radius.circular(10.0),
                                   ),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey,
                                       blurRadius: 1.0,
                                     ),
                                   ],
                                   color:  Colors.white
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: const [
                                       Padding(
                                         padding: EdgeInsets.all(8.0),
                                         child: Text("Completed",style: TextStyle(
                                             color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20
                                         ),),
                                       ),
                                       Icon(
                                         Icons.verified_outlined,
                                         color: Colors.green,
                                       ),
                                     ],
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 8.0),
                                     child: Row(
                                       children: [
                                         Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(top:8.0),
                                               child: Container(
                                                 decoration: const BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topLeft: Radius.circular(10.0),
                                                     topRight: Radius.circular(10.0),
                                                   ),
                                                 ),
                                                 child: Card(
                                                   shape: const RoundedRectangleBorder(
                                                       borderRadius:
                                                       BorderRadius.all(Radius.circular(18.0))),
                                                   child: ClipRRect(
                                                     borderRadius: const BorderRadius.only(
                                                       topLeft: Radius.circular(18.0),
                                                       topRight: Radius.circular(18.0),
                                                     ),
                                                     child: Image.asset(
                                                       "assets/2.jpg",
                                                       height: 100,
                                                       width: 100,
                                                       fit: BoxFit.cover,
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                             ),
                                             SizedBox(
                                               height: 100,
                                               width: 100,
                                               child: Container(
                                                 decoration: const BoxDecoration(
                                                     borderRadius: BorderRadius.only(
                                                       bottomLeft: Radius.circular(10.0),
                                                       bottomRight: Radius.circular(10.0),
                                                     ),
                                                     color: Colors.green),
                                                 child: Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Column(
                                                     children: const [
                                                       Text("1.45 PM"),
                                                       Text(
                                                         "02",
                                                         style: TextStyle(fontSize: 25,color: Colors.white),
                                                       ),
                                                       Text("SEP"),
                                                     ],
                                                   ),
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 38.0),
                                           child: Column(
                                             children: [
                                               const Text(
                                                 "Drilling work",
                                                 style: TextStyle(
                                                     fontSize: 20, fontWeight: FontWeight.bold),
                                               ),
                                               const SizedBox(
                                                 height: 20,
                                               ),
                                               Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: const [
                                                   Icon(Icons.build_circle_outlined),
                                                   SizedBox(
                                                     width: 10,
                                                   ),
                                                   Text("Repair Work"),
                                                 ],
                                               ),
                                               const SizedBox(
                                                 height: 25,
                                               ),
                                               Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: const [
                                                   Icon(Icons.location_on_outlined),
                                                   SizedBox(
                                                     width: 10,
                                                   ),
                                                   Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                 ],
                                               ),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 150.0,right: 30),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: const [
                                         Text("Total:"),
                                         Text('5400',style: TextStyle(
                                             fontWeight: FontWeight.bold
                                         ),),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                       Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                             child: Container(
                               decoration: const BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                     bottomLeft: Radius.circular(10.0),
                                     bottomRight: Radius.circular(10.0),
                                     topLeft: Radius.circular(10.0),
                                     topRight: Radius.circular(10.0),
                                   ),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey,
                                       blurRadius: 1.0,
                                     ),
                                   ],
                                   color:  Colors.white
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: const [
                                       Padding(
                                         padding: EdgeInsets.only(left: 8.0,top: 8.0,bottom: 8.0),
                                         child: Text(" Cancel ",style: TextStyle(
                                             color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20
                                         ),),
                                       ),
                                       Icon(
                                         Icons.error_outline_outlined,
                                         color: Colors.red,
                                       ),
                                       Padding(
                                         padding: EdgeInsets.only(left: 30.0),
                                         child: Text(" Order is Cancel due to lack of \n service provider",style: TextStyle(
                                             color: Colors.orangeAccent,fontSize: 13
                                         ),),
                                       ),
                                     ],
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 8.0),
                                     child: Row(
                                       children: [
                                         Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(top:8.0),
                                               child: Container(
                                                 decoration: const BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topLeft: Radius.circular(10.0),
                                                     topRight: Radius.circular(10.0),
                                                   ),
                                                 ),
                                                 child: Card(
                                                   shape: const RoundedRectangleBorder(
                                                       borderRadius:
                                                       BorderRadius.all(Radius.circular(18.0))),
                                                   child: ClipRRect(
                                                     borderRadius: const BorderRadius.only(
                                                       topLeft: Radius.circular(18.0),
                                                       topRight: Radius.circular(18.0),
                                                     ),
                                                     child: Image.asset(
                                                       "assets/2.jpg",
                                                       height: 100,
                                                       width: 100,
                                                       fit: BoxFit.cover,
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                             ),
                                             SizedBox(
                                               height: 100,
                                               width: 100,
                                               child: Container(
                                                 decoration: const BoxDecoration(
                                                     borderRadius: BorderRadius.only(
                                                       bottomLeft: Radius.circular(10.0),
                                                       bottomRight: Radius.circular(10.0),
                                                     ),
                                                     color: Colors.green),
                                                 child: Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Column(
                                                     children: const [
                                                       Text("1.45 PM"),
                                                       Text(
                                                         "02",
                                                         style: TextStyle(fontSize: 25,color: Colors.white),
                                                       ),
                                                       Text("SEP"),
                                                     ],
                                                   ),
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 38.0),
                                           child: Column(
                                             children: [
                                               const Text(
                                                 "Drilling work",
                                                 style: TextStyle(
                                                     fontSize: 20, fontWeight: FontWeight.bold),
                                               ),
                                               const SizedBox(
                                                 height: 20,
                                               ),
                                               Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: const [
                                                   Icon(Icons.build_circle_outlined),
                                                   SizedBox(
                                                     width: 10,
                                                   ),
                                                   Text("Repair Work"),
                                                 ],
                                               ),
                                               const SizedBox(
                                                 height: 25,
                                               ),
                                               Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: const [
                                                   Icon(Icons.location_on_outlined),
                                                   SizedBox(
                                                     width: 10,
                                                   ),
                                                   Text("129c,\nmaruthu nagar,\npalani,\ncovai-641004"),

                                                 ],
                                               ),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 150.0,right: 30),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: const [
                                         Text("Total:"),
                                         Text('5400',style: TextStyle(
                                             fontWeight: FontWeight.bold
                                         ),),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(15.0),
                             child: SizedBox(
                               height: 40,
                               width:double.infinity,
                               child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                     primary: Colors.green,
                                     onSurface: Colors.black, // foreground
                                   ),
                                   onPressed: (){}, child: const Text("Alter")),
                             ),
                           )
                         ],
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),       
         ],
       ),
     ),
    );
  }
}
