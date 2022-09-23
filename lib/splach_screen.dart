import 'dart:async';

import 'package:final_project3/pageviewcontroller.dart';
import 'package:flutter/material.dart';

import 'custom_color/customcolor.dart';



class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    StartTimer();
  }
  StartTimer() async{
    var duaration=Duration(seconds: 4);
    return Timer(duaration,route);
  }
  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PageViewController()),);
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            CustomColor.darkmov,
            CustomColor.lightmov,
            CustomColor.lightmov,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/whitelogo.png"),
        ],
      ),
    );
  }
}
