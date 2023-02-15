// ignore_for_file: avoid_print, unused_local_variable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class FormForAddingService extends StatefulWidget {
  const FormForAddingService({Key? key}) : super(key: key);

  @override
  State<FormForAddingService> createState() => _FormForAddingServiceState();
}

class _FormForAddingServiceState extends State<FormForAddingService> {
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
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0,left: 25,right: 25),
            child: Column(
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
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(top: 55.0),
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
                    labelText: 'Catogery Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: dateandtime,
                  style: const TextStyle(fontSize: 15),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.calendar_month_outlined),
                    labelText: 'Enter catogery Date',
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
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Catogery Description',
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onSurface: Colors.black,
                      ),
                      child: const Text("Submit")),
                ),
              ],
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
      print("Failed To Pick Image");
    }
  }

  Future<File> savePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
}

basename(String imagePath) {
}

