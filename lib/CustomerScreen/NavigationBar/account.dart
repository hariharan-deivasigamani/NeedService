import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_demand_home_service/CustomerScreen/navigationbar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Accounts Page"),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 28.0, top: 2, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Hariharan D \n\n+91 6383747402"),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const UserProfileManagement()),
                        );
                      }, icon: const Icon(Icons.create_outlined))
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 1.5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomUpNavigationBar(
                        )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Home"),
                      Spacer(),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomUpNavigationBar(
                        )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.assignment_outlined ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("My Booking"),
                      Spacer(),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.account_balance_wallet_outlined ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("My Wallet"),
                      Spacer(),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Manage Address"),
                      Spacer(),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.share_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Share"),
                      Spacer(),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomUpNavigationBar(
                        )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.beenhere_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Refer & Earn"),
                      Spacer(),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.star_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text("My Rating"),
                      Spacer(),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (param) {
                        return AlertDialog(
                          title: const Text(
                            "Are you sure to LOGOUT",
                            style: TextStyle(color: Colors.teal, fontSize: 20),
                          ),
                          actions: [
                            TextButton(
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    const snackBar = SnackBar(
                                        content:
                                            Text('Logged Out Successfully'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text("Logout")),
                            TextButton(
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.teal),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Close"))
                          ],
                        );
                      });
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class UserProfileManagement extends StatefulWidget {
  const UserProfileManagement({Key? key}) : super(key: key);

  @override
  State<UserProfileManagement> createState() => _UserProfileManagementState();
}

class _UserProfileManagementState extends State<UserProfileManagement> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
           appBar: AppBar(
             title: Text("Profile"),
           ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(
                    10) // only allow 5 digit number
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    const snackBar = SnackBar(
                        content: Text('Updated Successfully'));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackBar);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const AccountPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.black,
                  ),
                  child: const Text("Submit")),
            ),
          ],
        ),
      ),
    ));
  }
}
