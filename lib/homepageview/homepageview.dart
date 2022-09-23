import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_project3/homepageview/profile.dart';
import 'package:final_project3/homepageview/tours.dart';
import 'package:flutter/material.dart';
import 'locations.dart';
import 'favourite.dart';
import 'giftpage.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final navigationkey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens = [
    Locations(),
    Favourite(),
    Gifts(),
    ToursScreen(),
    Profile(),
  ];
  final items = <Widget>[
    Icon(
      Icons.home,
      size: 25,
      color: Colors.black,
    ),
    Icon(
      Icons.favorite_border,
      size: 25,
      color: Colors.black,
    ),
    Icon(
      Icons.card_giftcard,
      size: 25,
      color: Colors.black,
    ),
    Icon(
      Icons.add_card_rounded,
      size: 25,
      color: Colors.black,
    ),
    Icon(
      Icons.person_outline,
      size: 25,
      color: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
      backgroundColor: Colors.red,
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationkey,
        color: Colors.white,
        buttonBackgroundColor: Colors.blue[500],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        backgroundColor: Colors.transparent,
        items: items,
        height: 55,
        index: index,
        onTap: (index) =>
            setState(
                  () {
                this.index = index;
              },
            ),
      ),
    );
  }


}
