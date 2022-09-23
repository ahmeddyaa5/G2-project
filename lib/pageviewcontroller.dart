import 'package:final_project3/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'custom_color/customcolor.dart';

class PageViewController extends StatefulWidget {
  const PageViewController({Key? key}) : super(key: key);

  @override
  State<PageViewController> createState() => _PageViewControllerState();
}

class _PageViewControllerState extends State<PageViewController> {
  final _controller = PageController();
  bool islastpage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              islastpage = index == 2;
            });
          },
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Image.asset("assets/images/LogoColor.png"),
                  SizedBox(
                    height: 35,
                  ),
                  Image.asset("assets/images/boyImage.png"),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Plan Your Trip",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "plan your trip,choose your destination.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "pick the best place for your holiday.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Image.asset("assets/images/LogoColor.png"),
                  SizedBox(
                    height: 35,
                  ),
                  Image.asset("assets/images/boyimage2.png"),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Select The Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Select the date,book your ticket,we give",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "you the best price We guarantied!.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Image.asset("assets/images/LogoColor.png"),
                  SizedBox(
                    height: 35,
                  ),
                  Image.asset("assets/images/girlimage.png"),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Enjoy Your Trip",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Text(
                    "Enjoy your hoilday! don't forget to take",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "a photo and share to the world.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: islastpage
          ? TextButton(
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignIn()));
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: 135,
                  bottom: 20,
                ),
                child: Text(
                  "LET'S GO!",
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => {
                      _controller.jumpToPage(2),
                    },
                    child: Text("Skip"),
                  ),
                  SmoothPageIndicator(
                    controller: _controller, // PageController
                    count: 3,
                    effect: WormEffect(
                      spacing: 16,
                      dotColor: Colors.black26,
                      activeDotColor: CustomColor.darkmov,
                    ),
                    onDotClicked: (index) => _controller.animateToPage(
                      index,
                      duration: const Duration(
                        microseconds: 500,
                      ),
                      curve: Curves.easeInOut,
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      _controller.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                    },
                    child: Text("Next"),
                  ),
                ],
              ),
            ),
    );
  }
}
