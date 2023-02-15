// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_demand_home_service/otp_verification_page.dart';
import 'package:sms_autofill/sms_autofill.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  int timeleft = 30;

  var size, height, width;
  var otpCodeVisible = true;
  var countofotp;

  bool isButtonActive = false;

  String? mobile;
  String verificationRecived = "";

  final phonecontroller = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    phonecontroller.addListener(() {
      final isButtonActive = phonecontroller.text.length == 10;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    phonecontroller.dispose();
    super.dispose();
  }

  void verifynumber() {
    auth.verifyPhoneNumber(
        phoneNumber: "+91 ${phonecontroller.text}",
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
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF2c1b10),
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                'assets/logo1.jpg',
                height: 50,
                width: width,
                fit: BoxFit.cover,
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
                          "Login",
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
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Mobile Number",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40.0, top: 8, right: 30),
                          child: TextFormField(
                            controller: phonecontroller,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide:
                                      BorderSide(color: Colors.black12)),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide:
                                      BorderSide(color: Colors.black12)),
                              filled: true,
                              fillColor: Colors.grey[100],
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
                        ), // Textform field for entering mobile number
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: SizedBox(
                            height: 50.0,
                            width: 250,
                            child: ElevatedButton(
                              onPressed: isButtonActive
                                  ? () async {
                                       verifynumber();
                                      final singlcode =
                                          await SmsAutoFill().getAppSignature;
                                      print(singlcode);
                                      mobile = phonecontroller.text.toString();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OtpVerification(
                                                  mobile!,
                                                  verificationRecived,
                                                )),
                                      );
                                      print('$mobile');
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                onSurface: Colors.black, // foreground
                              ),
                              child: const Text(
                                'Log In',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ), // Submit Button
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        const Text("By Creating Passcode you agree with our"),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 35),
                          child: Row(
                            children: [
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
                                    "Term & Condition's",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                              const Text("and"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PrivacyPolicy()),
                                    );
                                  },
                                  child: const Text(
                                    "Privacy Policy",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))
                            ],
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

class TermsandCondition extends StatefulWidget {
  const TermsandCondition({Key? key}) : super(key: key);

  @override
  State<TermsandCondition> createState() => _TermsandConditionState();
}

class _TermsandConditionState extends State<TermsandCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms & Conditions"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text(
                "By registering with On Demand Home Service (here in after referred to as 'title'), you are confirming that you have read these terms and conditions of your use of the Site and agree to abide by the same.\n\n These terms and conditions (here in after referred to as 'User Agreement') constitute your binding obligations towards Software Tech Limited (here in after referred to as 'On demand Home Service' or 'we' or 'us'). \n\nThis User Agreement is effective upon acceptance in registration for new registering users. On Demand Home Service may amend the User Agreement at any time by posting the amended terms on the Site. All amended terms shall automatically become effective thirty (30) is this mandatory days after they are posted on the App and any subsequent use of the App shall be governed by such amended terms.\n\nIn addition, we will notify you in accordance with your notification preferences. This User Agreement may not be otherwise amended except in writing and signed by you. Whats the implication?\n\n You are advised to regularly check for any amendments or updates to the terms and conditions contained in this User Agreement. If any clause of the User Agreement shall be deemed invalid, void or for any reason unenforceable, such clause shall be deemed severable and shall not affect the validity and enforceability of the remaining clauses of the User AgreementYou must read, agree with and accept all of the terms and conditions contained in this User Agreement's Privacy Policy, which include terms and conditions expressly set out below and those incorporated by reference, before you may become a member of On Demand Home Service. On Demand Home Service's Privacy Policy may be viewed by clicking on the following link: PrivacyPolicy",
                textAlign: TextAlign.justify,
              ),
              Text(
                "\n1. Membership Eligibility",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                textAlign: TextAlign.justify,
              ),
              Text(
                "\n\nFull use of the Site is available only to persons who can form legally binding contracts with On Demand Home Service under an applicable law. Persons who are 'incompetent to contract' within the meaning of the Indian Contract Act, 1872 including minors, un-discharged insolvents etc. are not eligible to use the Site. The Site is not available to persons whose membership has been suspended or terminated by On Demand Home Service. If you are registering as a business entity, you represent that you have the authority to bind the entity to this User Agreement.",
                textAlign: TextAlign.justify,
              ),
              Text(
                "\n2. Your Account and Registration Obligations",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                textAlign: TextAlign.justify,
              ),
              Text(
                '\nIf you use the Site, you are responsible for maintaining the confidentiality of your account like email ID , Password, etc. and for restricting access to your computer, and you agree to accept responsibility for all activities that occur under your account or Password. You agree to:\n\n \t(a) Provide true, accurate, current and complete information about yourself as prompted by registration form available on the Site (such information being the "Registration Data"); and \n\n \t(b) Maintain and promptly update the Registration Data to keep it true, accurate, current and complete. If you provide any information that is untrue, inaccurate, not current or incomplete or On Demand Home Service has a reasonable ground to suspect that such information is untrue, inaccurate, not current or incomplete, or not in accordance with the User Agreement, On Demand Home Service has the right to indefinitely suspend or terminate your membership and refuse to provide you with access to the Site.',
                textAlign: TextAlign.justify,
              ),
              Text(
                "\n3.Electronic Communications",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                textAlign: TextAlign.justify,
              ),
              Text(
                "\nWhen you visit the Site or send emails to us, you are communicating with us electronically. You consent to receive communications from us electronically. We will communicate with you by email or by posting notices on the Site. You agree that all agreements, notices, disclosures and other communications that we provide to you electronically satisfy any legal requirement that such communications be in writing.",
                textAlign: TextAlign.justify,
              ),
              Text(
                "\n4.Fees and Services",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                textAlign: TextAlign.justify,
              ),
              Text(
                "\nMembership on the Site is free. On Demand Home Service does not charge any fee for browsing on the App. On Demand Home Service charges listing fee to all sellers and special listing fees are charged to service provider who use the special listing feature(s) for listing their Service. Before you list a service for booking through the App, we request you to review our fee, posted on App, which is hereby incorporated by reference into this User Agreement.\n\nHowever, On Demand Home Service reserves the right to change its fee charging and credit policies from time to time. In particular, On Demand Home Service may at its sole discretion introduce new services and modify some or all of the existing services offered on the App. In such an event On Demand Home Service reserves the right to introduce fees for the new services offered or amend/introduce fees for existing services, as the case may be. Changes to the fee charging and credit policies shall be posted on the Site and such changes shall automatically become effective immediately after they are posted on the Site. Unless otherwise stated, all fees shall be quoted in Indian Rupees. You are responsible for paying all fees associated with the use of the Site and you agree to bear any and all applicable taxes, charges etc. levied thereon.\n\nOn Demand Home Service reserves the right to issue a warning, temporarily /indefinitely suspend or terminate your membership and refuse to provide you with access to the App in case of non-payment of fees by you to On Demand Home Service. On Demand Home Service also reserves the right to take legal action in case of non-payment of fees by you to On Demand Home Service.",
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("1. Your Privacy - Our Commitment\n\n",textAlign: TextAlign.justify,style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.w700
              ),),
              Text("At On Demand Home Service, we are extremely proud of our commitment to protect your privacy and the personal information you disclose on the . We value your trust in us. We will work hard to earn your confidence so that you can enthusiastically use our services and recommend us to friends and family. Please read the following policy to understand how your personal information will be treated as you make full use of our Site.",textAlign: TextAlign.justify),
              Text("\n\n2. On Demand Home Service Privacy Guarantee\n\n",textAlign: TextAlign.justify,style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.w700
              ),),
              Text("On Demand Home Service promises that we will not disclose your personal information to third parties for their marketing purposes without your explicit consent. From time to time we may reveal general statistical information about our Site and visitors, such as number of visitors, number and type of goods and services purchased, etc. Your trust and confidence are our highest priority.",textAlign: TextAlign.justify),
              Text("\n\n3. Information we collect\n\n",textAlign: TextAlign.justify,style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.w700
              ),),
              Text("When you use our Site, we collect and store your personal information provided by you. Our primary goal in doing so is to provide a safe, efficient, smooth and customized experience. This allows us to provide services and features that most likely meet your needs, and to customize our Site to make your experience safer and easier. Importantly, we only collect personal information about you that we consider necessary for achieving this purpose. In general, you can browse the Site without telling us who you are or revealing any personal information about yourself. Once you give us your personal information, you are not anonymous to us.\n\nTo fully use our Site, you will need to register using our online registration form, where you may be required to provide us with your contact and identity information and other personal information as indicated on the forms throughout the Site. Where possible, we indicate which fields are required and which fields are optional. You always have the option to not provide information by choosing not to use a particular service or feature on the Site",textAlign: TextAlign.justify),
              Text("\n\n4. Grievances\n\n",textAlign: TextAlign.justify,style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.w700
              ),),
              Text("For any queries, complaints or inquiries about the way we use or process the information provided by you or about our Privacy Policy, you may email our Grievance Offer or write to us at the following address.\n\n\tGrievance Officer:\n\n\tD Hariharan\n\n\tEmail: privacy@cloudi5.com\n\n\tCloud I5 Tech Ltd\n\t12th Floor,Vishwaroop IT Park, \n\tS Pranavanandji Marg,\n\tSector 30A, Vashi,\n\tSaravanampatty, Tamilnadu 641664",textAlign: TextAlign.justify),
            ],
          ),
        ),
      ),
    );
  }
}
