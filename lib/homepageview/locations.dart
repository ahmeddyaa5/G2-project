
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_project3/homepageview/profile.dart';
import 'package:final_project3/homepageview/tours.dart';

import 'package:flutter/material.dart';
class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  int index=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:CurvedNavigationBar(
        backgroundColor: Colors.redAccent,
        height: 60,
        index: index,
        onTap: (index)=>this.index=index,
        items: [
          Icon(Icons.home_outlined),
          Icon(Icons.favorite_border),
          Icon(Icons.card_giftcard),
          Icon(Icons.add_card_rounded),
          InkWell(
              onTap: (){
                setState(() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return Profile();
                  }));
                });
              },
              child: Icon(Icons.person_outline)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          //location and menuicon
          Center(
            child:  Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Image.asset("assets/images/menu.png",),
                SizedBox(
                  width: 100,
                ),
                // Text(
                //   "Location",
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

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
                        child: Image.asset("assets/images/usa.png", fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child:
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ToursScreen()));

                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/france.png",  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child:
                        Image.asset("assets/images/india.png", fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child:
                        Image.asset("assets/images/london.png", fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Image.asset("assets/images/sydeny.png",
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
