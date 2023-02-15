import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainServiceCatogery extends StatefulWidget {
  const MainServiceCatogery({Key? key}) : super(key: key);

  @override
  State<MainServiceCatogery> createState() => _MainServiceCatogeryState();
}

class _MainServiceCatogeryState extends State<MainServiceCatogery> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(child: Scaffold(
    appBar: AppBar(
      title: const Text("Fill the Form"),
      backgroundColor: Colors.green,
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Image"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:13.0),
                    child: Text("Name:"),
                  ),
                  const SizedBox( width: 50,),
                  SizedBox(
                    height: 50,
                    width: width * 0.70,
                    child: TextFormField(
                      controller: TextEditingController(),
                      style: const TextStyle(fontSize: 15),
                      //allow to show the keyboard in screen
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Name",
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:13.0),
                    child: Text("Provider Type:"),
                  ),
                  const SizedBox( width: 5,),
                  SizedBox(
                    height: 50,
                    width: width * 0.70,
                    child: TextFormField(
                      controller: TextEditingController(),
                      style: const TextStyle(fontSize: 15),
                      //allow to show the keyboard in screen
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Select the Type",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:13.0),
                    child: Text("Employee Name:"),
                  ),
                  const SizedBox( width: 5,),
                  SizedBox(
                    height: 50,
                    width: width * 0.65,
                    child: TextFormField(
                      controller: TextEditingController(),
                      style: const TextStyle(fontSize: 15),
                      //allow to show the keyboard in screen
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Employee Name",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:13.0),
                    child: Text("Description:"),
                  ),
                  const SizedBox( width: 35,),
                  SizedBox(
                    height:50,
                    width: width * 0.65,
                    child: TextFormField(
                      controller: TextEditingController(),
                      style: const TextStyle(fontSize: 15),
                      //allow to show the keyboard in screen
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "About you & your service",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:20.0),
                    child: Text("Number:"),
                  ),
                  const SizedBox( width: 55,),
                  SizedBox(
                    height: 55,
                    width: width * 0.65,
                    child: TextFormField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Number ",
                        prefixIcon: SizedBox(
                          height: 30,
                          width: 20,
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: SizedBox(child: Text("+91")),
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 1.5,
                              )
                            ],
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(
                            10) // only allow 5 digit number
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:13.0),
                    child: Text("Address:"),
                  ),
                  const SizedBox( width: 50,),
                  SizedBox(
                    height:50,
                    width: width * 0.65,
                    child: TextFormField(
                      controller: TextEditingController(),
                      style: const TextStyle(fontSize: 15),
                      //allow to show the keyboard in screen
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Office Address ",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:13.0),
                    child: Text("Range:"),
                  ),
                  const SizedBox( width: 65,),
                  SizedBox(
                    height:50,
                    width: width * 0.65,
                    child: TextFormField(
                      controller: TextEditingController(),
                      style: const TextStyle(fontSize: 15),
                      //allow to show the keyboard in screen
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Range to be covered ",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:13.0),
                    child: Text("Available Time:"),
                  ),
                  const SizedBox( width: 12,),
                  SizedBox(
                    height:50,
                    width: width * 0.65,
                    child: TextFormField(
                      controller: TextEditingController(),
                      style: const TextStyle(fontSize: 15),
                      //allow to show the keyboard in screen
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Foremost Available Time ",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: Text("Submit The form"))),
            )



          ],
        ),
      ),
    )
    );
  }
}
