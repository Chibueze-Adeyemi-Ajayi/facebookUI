import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Index extends StatefulWidget {
  @override
  State<Index> createState() => IndexState();
}

class IndexState extends State<Index> {
  @override
  Widget build(BuildContext context){
    return Center(
      
      child: Text("Facebook", style: TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
        fontSize: 40, fontFamily: "comic Sans",
      ),),
      
    );

  }
} 