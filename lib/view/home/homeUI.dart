import 'package:flutter/material.dart';
import 'package:travel/API/ticketAPI.dart';
import 'package:travel/model/Ticket.dart';
import '../../config/color.dart';
import '../deals.dart';
import '../wishList.dart';
import 'homeTop.dart';
import '..//profile/profileUI.dart';
import '../find/findByImage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BottomNav extends StatefulWidget {
  final GoogleSignInAccount user;
  BottomNav({Key? key, required this.user}) : super(key: key);

  _BottomNavState createState() => _BottomNavState(user: user);
}

class _BottomNavState extends State<BottomNav> {
  final GoogleSignInAccount user;
  int sel = 0;
  List<Widget> bodies = [];
  List<Ticket> tickets = [];
  _BottomNavState({required this.user});

  Future<void> initWithSyn() async {
    await ticketAPI.fetchTicket('all').then((dataFromServer) {
      setState(() {
        tickets = dataFromServer;
      });
    });
  }

  @override
  void initState() {
    initWithSyn();
    bodies = [
      HomeUI(),
      WishList(list: tickets),
      Deals(),
      FindByImage(),
      ProfileUI(user: user)
    ];
    super.initState();
  }

  List<BottomNavigationBarItem> createItems() {
    List<BottomNavigationBarItem> items = [];
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: primaryColor,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        label: "Home"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.favorite,
          color: primaryColor,
        ),
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        label: "WishList"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.local_offer,
          color: primaryColor,
        ),
        icon: Icon(
          Icons.local_offer,
          color: Colors.black,
        ),
        label: "Deals"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.notifications,
          color: primaryColor,
        ),
        icon: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        label: "Find"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.notifications,
          color: primaryColor,
        ),
        icon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        label: "Profile"));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodies.elementAt(sel),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey, width: 1))),
        child: BottomNavigationBar(
          items: createItems(),
          unselectedItemColor: Colors.black,
          selectedItemColor: primaryColor,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          currentIndex: sel,
          elevation: 1.5,
          onTap: (int index) {
            if (index != sel)
              setState(() {
                sel = index;
              });
          },
        ),
      ),
    );
  }
}
