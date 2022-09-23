import 'package:flutter/material.dart';

class Gifts extends StatelessWidget {
  const Gifts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Image.asset(
                  "assets/images/parismenu.png",
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Image.asset("assets/images/Header.png",
                              fit: BoxFit.fill),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Image.asset("assets/images/Details.png",
                              fit: BoxFit.fill),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Image.asset("assets/images/Tab.png",
                              fit: BoxFit.fill),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Image.asset("assets/images/bottomtab.png",
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  );
                }),
          )
        ]));
  }
}
