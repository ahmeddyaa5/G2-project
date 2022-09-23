import 'dart:convert';
import 'package:final_project3/homepageview/homepageview.dart';
import 'package:final_project3/json/Login.dart';
import 'package:final_project3/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'custom_color/customcolor.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final forfieldmkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                height: 50,
              ),
              Stack(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: Image.asset("assets/images/BGsingin.png")),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 50),
                    child: Form(
                      key: forfieldmkey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
                            height: 30,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Forget Pasword ? ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 300,
                                height: 50,
                                child: isLoading
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
                                          if (forfieldmkey.currentState!
                                              .validate()) {
                                            forfieldmkey.currentState!.save();
                                            login();
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
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_outlined,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      " sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //call api
  Future login() async {
    setState(() {
      isLoading = true;
    });

    Response loginRespone = await post(
      Uri.parse("http://alcaptin.com/api/login"),
      body: {"email": email, "password": password},
    );
    dynamic convertedJson = jsonDecode(loginRespone.body);
    print(loginRespone.body);

    Login userData = Login.fromJson(convertedJson);
    print(userData.data);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePageView()));

    setState(() {
      isLoading = false;
    });
  }
}
