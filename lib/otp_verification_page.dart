// ignore_for_file: use_build_context_synchronously, avoid_print, prefer_typing_uninitialized_variables, use_full_hex_values_for_flutter_colors

import 'dart:async';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_demand_home_service/Enterance_Page.dart';
import 'package:sms_autofill/sms_autofill.dart';


class OtpVerification extends StatefulWidget {
  final String s;
  final String a;
  const OtpVerification(this.s,this.a,{Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  var size, height, width;

  String? countofotp = "";

  bool otpCodeVisible = true;
  bool isButtonActive = true;

  final otpcontroller = TextEditingController();

  var timeleft = 30;

  String code ='';

  String? otpNumber;

  bool isDisable = true;

  late Timer time;

  bool countDownComplete = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  String verificationRecived ='';



  void otpautofill() async {
    SmsAutoFill().listenForCode();
  }

  @override
  void dispose() {
    otpcontroller.dispose();
    super.dispose();
  }

  void verifycode() async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.a, smsCode: otpcontroller.text);
    await auth.signInWithCredential(credential).then((value){
      print("correct otp success success");

    });
  }

  void verifynumber() {
    auth.verifyPhoneNumber(
        phoneNumber: "+91 ${widget.s}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("You are Logged in");
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? reSendToken) {
          verificationRecived = verificationID;

          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("MOBILE>>>>>> ${widget.s}");
    otpautofill();
    otpcontroller.addListener(() {
      final isButtonActive = otpcontroller.text.length == 6;
      this.isButtonActive = isButtonActive;
    });

  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfffceceae),
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                    'assets/otp.png',
                    height: 50.5,
                    width: width,
                    fit:BoxFit.cover,
                  )),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  decoration: const BoxDecoration(
                    color: Color(0xFFffffff),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
                  ),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "VERIFY DETAILS",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "We Will Send SMS Code For Verification",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontWeight: FontWeight.w200),
                        ),
                        Text("+91 ${widget.s}"),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 50.0,
                              left: 15,
                              right: 15,
                            ),
                            child: Column(
                              children: [
                                const Text("Auto Fill OTP "),
                                Visibility(
                                  visible: otpCodeVisible,
                                  child: SizedBox(
                                    height: 50,
                                    child: PinFieldAutoFill(
                                      controller: otpcontroller,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      textInputAction: TextInputAction.previous,
                                      keyboardType: TextInputType.number,
                                      autoFocus: true,
                                      focusNode: FocusNode(),
                                      cursor: Cursor(
                                        width: 2,
                                        height: 40,
                                        color: Colors.black45,
                                        radius: const Radius.circular(1),
                                        enabled: true,
                                      ),
                                      decoration: UnderlineDecoration(
                                        textStyle: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        colorBuilder: FixedColorBuilder(
                                            Colors.black.withOpacity(0.3)),
                                      ),
                                      currentCode: code,
                                      codeLength: 6,
                                      onCodeSubmitted: (verificationCode) {
                                        debugPrint(
                                            "CURRENT CODE CHANGES 2: $verificationCode");
                                        otpNumber = verificationCode;
                                      },
                                      onCodeChanged: (verificationCode) {
                                        debugPrint(
                                            "CURRENT CODE CHANGES 3: $verificationCode");
                                        if (verificationCode.toString().length == 6) {
                                          code = verificationCode.toString();
                                          otpNumber = verificationCode.toString();
                                          // if (isDisable) {
                                          //   verify("on_text");
                                          // }
                                        } else if (verificationCode!.isEmpty ||
                                            verificationCode.length < 6) {
                                          code = "";
                                          otpNumber = "";
                                        }
                                      },
                                    ),
                                )),
                                 const SizedBox(
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 250,
                                  child: ElevatedButton(
                                    onPressed: isButtonActive ?()  async {
                                    final singlcode = await SmsAutoFill().getAppSignature;
                                        print(singlcode);
                                      if (otpCodeVisible) {
                                        debugPrint("OTPPPPPPP");
                                        if (code.length == 6) {
                                          debugPrint("OTPP");
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //       const BottomUpNavigationBar()),
                                          // );
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const EnterancePage()),
                                          );
                                        }
                                        else {
                                          const snackBar = SnackBar(
                                              content: Text('Enter OTP'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      }
                                    }:null,
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      onSurface: Colors.black,
                                    ),
                                    child: Text(
                                        otpCodeVisible ? "LOGIN" : "Resend OTP"),
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  width: width,
                                  child: ArgonTimerButton(
                                    clipBehavior: Clip.none,
                                    highlightColor: Colors.transparent,
                                    color: Colors.transparent,
                                    disabledColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    elevation: 0,
                                    highlightElevation: 0,
                                    disabledElevation: 0,
                                    focusElevation: 0,
                                    hoverElevation: 0,
                                    roundLoadingShape: true,
                                    initialTimer: 30,
                                    // Optional
                                    height: 10,
                                    width: 200,
                                    borderRadius: 5.0,
                                    child: Column(
                                      children:  [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Center(
                                          child: Text(
                                            'Didn\'t receive any OTP ?',
                                          ),
                                        ),
                                       TextButton(onPressed: (){
                                         // verifynumber();

                                         var snackBar = SnackBar(
                                             content: Text('OTP send to this number:${widget.s}',style: const TextStyle(color: Colors.white),
                                             ),
                                             shape: const RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.all(Radius.circular(20))
                                             )
                                         );
                                         ScaffoldMessenger.of(context)
                                             .showSnackBar(snackBar);

                                       }, child: const Text("Resend OTP",style: TextStyle(
                                         color: Colors.blueAccent
                                       ),)),

                                      ],
                                    ),
                                    loader: (timeLeft) {
                                      return Text(
                                        "Seconds remaining: $timeLeft",
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15.0),
                                      );
                                    },
                                    onTap: (startTimer, btnState) {
                                      if (btnState == ButtonState.Idle) {
                                        startTimer(30);
                                        otpcontroller.text.toString();
                                      } else {}
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}