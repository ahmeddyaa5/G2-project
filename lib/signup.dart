import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'homepageview/locations.dart';
import 'custom_color/customcolor.dart';
import 'json/sign_up.dart';
import 'sign_in.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignupState();
}

class _SignupState extends State<SignUp> {
  String name="";
  String email="";
  String password="";
  int? phone;
  bool isloading=false;
  bool agreement=false;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
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
            children: [
              SizedBox(
                height: 70,
              ),
              Image.asset("assets/images/whitelogo.png"),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Image.asset("assets/images/BGsignup.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 50,),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(hintText: "Name"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {}
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                name = value!;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(hintText: "Email"),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains("@")) {
                                return "Enter Valid Email";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                email = value!;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(hintText: "Password"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Valid Password";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                password = value!;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(hintText: "Phone number"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {}
                              return null;
                            },

                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: agreement,
                                onChanged: (value) {
                                  setState(
                                        () {
                                      agreement = value!;
                                    },
                                  );
                                },
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: "I agree the ",
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: " Terms & Conditions",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 300,
                                height: 50,
                                child: isloading
                                    ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                                    : MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(30),
                                  ),
                                  color: CustomColor.darkmov,
                                  onPressed: () {
                                    if (formkey.currentState!
                                        .validate()) {
                                      formkey.currentState!.save();
                                      register();
                                    }
                                  },
                                  child: Text("Sign in",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Positioned(
                                  right: 0,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: CustomColor.circlebutton,
                                      borderRadius:
                                      BorderRadius.circular(100),),
                                    child: Icon(
                                      Icons.arrow_forward_outlined,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/Facebook.png"),
                              SizedBox(
                                width: 30,
                              ),
                              Image.asset("assets/images/Google.png"),
                            ],
                          ),
                          SizedBox(
                            height:5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => SignIn()));
                                },
                                child: Text(
                                  " Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future register() async {
    setState(() {
      isloading = true;
    });

    Response loginRespone = await post(
        Uri.parse(" http://alcaptin.com/api/register"),
        body: {"first_name": name,
          "last_name": name,
          "email": email,
          "password": password,
          "age": ""

        });
    dynamic convertedJson = jsonDecode(loginRespone.body);
    print(loginRespone.body);

    if (loginRespone.statusCode == 200) {
      Register userData = Register.fromJson(convertedJson);
      print(userData.data);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Locations()));
    } else {
      print(convertedJson["message"]);
    }


    setState(() {
      isloading = false;
    });
  }
}