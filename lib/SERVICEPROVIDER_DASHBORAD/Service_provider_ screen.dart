// ignore_for_file: avoid_print, unused_local_variable, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_demand_home_service/SERVICEPROVIDER_DASHBORAD/checkbox_serviceprovider.dart';
import 'package:on_demand_home_service/SERVICEPROVIDER_DASHBORAD/multi_select_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class ServiceProviderForm extends StatefulWidget {
  const ServiceProviderForm({Key? key}) : super(key: key);

  @override
  State<ServiceProviderForm> createState() => _ServiceProviderFormState();
}

class _ServiceProviderFormState extends State<ServiceProviderForm> {

  String dropdownvalue = 'Choose Provider Type';

  var items = [
    'Choose Provider Type',
    'Free Lancer',
    'Company'
  ];

  File? image;
  TextEditingController dateandtime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Add Service Catogery"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: SizedBox(
            height: height * 1.5,
            width: width,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      pickimages();
                      print("Going in to gallery");
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.black45,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.grey,
                        child: Column(
                          children: [
                            image != null
                                ? ClipOval(
                                    child: Image.file(
                                      image!,
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Padding(
                                    padding: EdgeInsets.only(top: 60.0),
                                    child: Icon(
                                      Icons.add_a_photo_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ), //Name
                  TextFormField(
                    controller: dateandtime,
                    style: const TextStyle(fontSize: 15),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                      labelText: 'Date of Birth',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2051));
                      if (pickeddate != null) {
                        setState(() {
                          dateandtime.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                  ), //Date of Birth
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          isExpanded: true,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ), //Provider Type
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Employee Name',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ), //Employee Name
                  TextFormField(
                    controller: dateandtime,
                    style: const TextStyle(fontSize: 15),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                      labelText: 'Date of Registration',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2051));
                      if (pickeddate != null) {
                        setState(() {
                          dateandtime.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                  ), //Date of Registration
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      // FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')),
                      LengthLimitingTextInputFormatter(
                          30) // only allow 5 digit number
                    ],
                  ), // E-mail
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Description"),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ), // Description
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Company Number',
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
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
                              thickness: 0.5,
                            )
                          ],
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(
                          10) // only allow 5 digit number
                    ],
                  ), //Office Number
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Personal Number',
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
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
                              thickness: 0.5,
                            )
                          ],
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(
                          10) // only allow 5 digit number
                    ],
                  ), //Mobile Number
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Address of shop',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ), // Address Of shop
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Ranges to be Covered',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ), //Ranges to be covered
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Experience',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AvailableDay()),
                        );
                      },
                      child: const Text(
                        "Pick your Date & Time",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      )),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: const Text("Submit")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Future pickimages() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      final imagePermanent = await savePermanently(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException {
      print("Filed To Pick Image");
    }
  }

  Future<File> savePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
}

basename(String imagePath) {}





class AvailableDay extends StatefulWidget {
  const AvailableDay({Key? key}) : super(key: key);

  @override
  State<AvailableDay> createState() => _AvailableDayState();
}

class _AvailableDayState extends State<AvailableDay> {
  var size, height, width;

  bool ischecked = false;
  bool ischecked1 = false;

  String selected = "";
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Only 7 days",
    },
    {
      "id": 1,
      "value": false,
      "title": "OnlY 5 days",
    },
  ];

  List<MultiSelectModel> myAreaTypeList = [];
  List<MultiSelectModel> _selectedItems = [];
  @override
  void initState() {
    super.initState();
    MultiSelectModel model = MultiSelectModel();
    model.title = 'Only 7 days';
    model.id = 1;
    model.isChecked = false;
    myAreaTypeList.add(model);
    MultiSelectModel model1 = MultiSelectModel();
    model1.title = 'Only 5 days';
    model1.id = 2;
    model1.isChecked = false;
    myAreaTypeList.add(model1);
  }

  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 30);

  TimeOfDay _timeOfDay1 = const TimeOfDay(hour: 8, minute: 30);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text(
                "Availability Hour Details",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const Text(
                "Select your time",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Days"),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),
                                    onPressed: () async {
                                      _showMultiSelect();
                                    },
                                    child: const Text("Select"))
                              ],
                            ),
                          ),
                          // hari(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0,left: 15),
                            child: Row(
                              children: [

                                Text(
                                  selected,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.green,

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Starts At"),
                                    Text(
                                      "Pick time for Starts at",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),
                                    onPressed: () {
                                      showtimepickerstart();
                                    },
                                    child: const Text("Select"))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text( _timeOfDay.format(context).toString(),style: const TextStyle(
                              color: Colors.green
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Ends At"),
                                    Text(
                                      "Pick time for ends at",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),
                                    onPressed: () {
                                      showtimepickerend();
                                    },
                                    child: const Text("Select"))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:Text( _timeOfDay1.format(context).toString(),style: const TextStyle(
                                color: Colors.green
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Notes"),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Note for available Time',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.90,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onSurface: Colors.black, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ServiceProviderForm()),
                            );
                          },
                          child: const Text("Save   &   Exit")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // SHOW MULTI SELECT DIALOG
  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<MultiSelectModel>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        if (_selectedItems.isNotEmpty) {
          for (MultiSelectModel model in myAreaTypeList) {
            for (MultiSelectModel selectedModel in _selectedItems) {
              if (selectedModel.isChecked!) {
                if (model.id == selectedModel.id) {
                  model.isChecked = selectedModel.isChecked!;
                }
              } else {
                model.isChecked = false;
              }
            }
          }
        }
        return MultiSelect(
          items: myAreaTypeList,
          myTitle: 'Select Days',
        );
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
        // isAreaClicked = false;
        List<String> mySelectedTitleList = [];
        for (MultiSelectModel model in _selectedItems) {
          mySelectedTitleList.add(model.title!);
        }
        selected = mySelectedTitleList
            .toString()
            .replaceAll('[', '')
            .replaceAll(']', '');
      });
    } else {
      // showLineSelectionStatus(false);
    }
  }

  void showtimepickerstart() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  void showtimepickerend() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay1 = value!;
      });
    });
  }
}




