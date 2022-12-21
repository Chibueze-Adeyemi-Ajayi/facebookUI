import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context){
    return Center(child: 
      Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Facebook", style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 40, fontFamily: "comic Sans",
            ),),
            Container(height: 60,),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.supervised_user_circle, size: 25, color: Colors.blueAccent),
                hintText: "Username",
                labelText: "Facebook username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0),
                  ))
              ),
            ),
            Container(height: 10,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock, size: 25, color: Colors.blueAccent),
                hintText: "Password",
                labelText: "Facebook password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0),
                  ))
              ),
            ),
            Container(height: 40,),
            TextButton(onPressed: () {}, 
              style: ButtonStyle(animationDuration: Duration(seconds: 10), 
                                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
              child: Container(
                padding: EdgeInsets.all(4),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.login, color: Colors.white,), Container(width: 25,),
                  Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
                ],),) 
              ,)
          ]
          ),
        ),
    );

  }
} 