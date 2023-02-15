import 'package:flutter/material.dart';
import 'package:on_demand_home_service/CustomerScreen/NavigationBar/Rewards.dart';
import 'package:on_demand_home_service/CustomerScreen/NavigationBar/booking.dart';
import 'package:on_demand_home_service/CustomerScreen/NavigationBar/homescreen.dart';

import 'NavigationBar/account.dart';


class BottomUpNavigationBar extends StatefulWidget {
  const BottomUpNavigationBar({Key? key }) : super(key: key);

  @override
  State<BottomUpNavigationBar> createState() => _BottomUpNavigationBarState();
}

class _BottomUpNavigationBarState extends State<BottomUpNavigationBar> {

  int pageIndex = 0;
  final pages = [
    const SecondRoute(),
    const BookingPage(),
    const RewardsPage(),
    const AccountPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar:  buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {

    return Container(
      height: 62,
      decoration: const BoxDecoration(
          color:  Color(0xFF1c750b),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },

                icon: pageIndex == 0
                    ? const Icon(
                  Icons.home_filled,
                  color: Colors.white,
                  size: 20,
                )
                    : const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 20,
                ),

              ),
              Text("Home",style: TextStyle(color: Colors.white,fontSize: 10),)
            ],
          ),

          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                  Icons.content_paste_rounded,
                  color: Colors.white,
                  size: 20,
                )
                    : const Icon(
                  Icons.content_paste_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Text("Booking",style: const TextStyle(color: Colors.white,fontSize: 10),)
            ],
          ),

          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                  Icons.account_balance_wallet_rounded,
                  color: Colors.white,
                  size: 20,
                )
                    : const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Text("Rewards",style: const TextStyle(color: Colors.white,fontSize: 10),)
            ],
          ),

          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                )
                    : const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Text("Accounts",style: const TextStyle(color: Colors.white,fontSize: 10),)
            ],
          ),



        ],
      ),
    );
  }
}