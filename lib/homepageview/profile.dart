import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_project3/homepageview/locations.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static String id = "Profile";
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int index=4;
  final formkey = GlobalKey<FormState>();
  bool agreement=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.redAccent,
        height: 60,
        index: index,
        onTap: (index)=>this.index=index,
        items: [
          Icon(Icons.home_outlined),
          Icon(Icons.favorite_border),
          Icon(Icons.card_giftcard),
          Icon(Icons.add_card_rounded),
          GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return Profile();
                }));
              },
              child: Icon(Icons.person_outline)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 80,),
          Row(
            children: [
              SizedBox(width:350,),
              InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return Locations();
                      }));
                    });
                  },
                  child: Icon(Icons.close,size: 25,)),
            ],
          ),
          Image.asset("assets/images/IMG.png"),
          SizedBox(height: 5,),
          Text(
            "Kenneth Gutierrez",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "kenneth_gutierrez@gmail.com",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 40,),
          Row(
            children: [
              SizedBox(width: 20,),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(25),),
                  child: Image.asset("assets/images/bell.png")),
              SizedBox(width: 30,),
              Text("Notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(width: 160,),
              Icon(Icons.arrow_forward_ios),


            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(25),),
                child: Image.asset("assets/images/plane.png"),),
              SizedBox(width: 25,),
              Text("Tours",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(width: 210,),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 20,),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent, borderRadius: BorderRadius.circular(25),),
                  child: Image.asset("assets/images/location .png")),
              SizedBox(width: 25,),
              Text("Location",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(width: 190,),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue[800], borderRadius: BorderRadius.circular(25),),
                  child: Image.asset("assets/images/global.png")),
              SizedBox(width: 25,),
              Text("Language",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(width: 180,),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(25),),
                  child: Image.asset("assets/images/invitefriend.png")),
              SizedBox(width: 25,),
              Text("Invite Friend",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(width: 160,),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: 1,
            color: Colors.grey[400],
            margin: EdgeInsets.only(left: 25,right: 22),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.yellow, borderRadius: BorderRadius.circular(25),),
                  child: Image.asset("assets/images/headset.png")),
              SizedBox(width: 25,),
              Text("Help Center",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(width: 170,),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.green, borderRadius: BorderRadius.circular(25),),
                  child: Image.asset("assets/images/settingsicon.png")),
              SizedBox(width: 25,),
              Text("Settings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(width: 190,),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 20,),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(25),),
                  child: Image.asset("assets/images/logout.png")),
              SizedBox(width: 25,),
              Text("Log Out"),
              SizedBox(width: 200,),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ],
      ),
    );
  }
}
