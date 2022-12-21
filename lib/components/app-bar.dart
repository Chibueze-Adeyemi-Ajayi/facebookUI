// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// final String menu = "";
// class CustomAppBar extends StatefulWidget {
//   const CustomAppBar({required menu});
  
//   @override
//   State<CustomAppBar> createState() => AppBarState();
// }

// class AppBarState extends State<CustomAppBar> {

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//     actions: (menu == 0) ? [
//       IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 35, color: Colors.blueAccent)),
//       PopupMenuButton(
//         icon: Icon(Icons.more_vert, color: Colors.blueAccent, size: 35,),
//         itemBuilder: (context) {
//         return [
//           PopupMenuItem(onTap: () { //profile

//           }, child: ListTile(leading: Icon(Icons.person_rounded, color: Colors.blueAccent,), title: Text("Profile", style: TextStyle(color: Colors.blueAccent),),)),
//           PopupMenuItem(onTap: () { // group
            
//           }, child: ListTile(leading: Icon(Icons.people, color: Colors.blueAccent,), title: Text("Group", style: TextStyle(color: Colors.blueAccent),),)),
//           PopupMenuItem(onTap: () { // facebook space
            
//           }, child: ListTile(leading: Icon(Icons.mic, color: Colors.blueAccent,), title: Text("FB Space", style: TextStyle(color: Colors.blueAccent),),)),
//           PopupMenuItem(onTap: () { //settings
            
//           }, child: ListTile(leading: Icon(Icons.settings , color: Colors.blueAccent,), title: Text("Settings", style: TextStyle(color: Colors.blueAccent),),)),
//         ];
//       })
//     ] : [
//       IconButton(onPressed: () {}, icon: Icon(Icons.videocam, size: 35, color: Colors.blueAccent)),
//       IconButton(onPressed: () {}, icon: Icon(Icons.call, size: 29, color: Colors.blueAccent)),
//     ], leadingWidth: 0,
//     toolbarHeight: 85, title: Text("Facebook", style: TextStyle(color: Colors.blueAccent, fontSize: 25),),
//     backgroundColor: Colors.white, elevation: 0.3,);
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var menu = false;

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
    actions: (menu == 0) ? [
      IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 35, color: Colors.blueAccent)),
      PopupMenuButton(
        icon: Icon(Icons.more_vert, color: Colors.blueAccent, size: 35,),
        itemBuilder: (context) {
        return [
          PopupMenuItem(onTap: () { //profile

          }, child: ListTile(leading: Icon(Icons.person_rounded, color: Colors.blueAccent,), title: Text("Profile", style: TextStyle(color: Colors.blueAccent),),)),
          PopupMenuItem(onTap: () { // group
            
          }, child: ListTile(leading: Icon(Icons.people, color: Colors.blueAccent,), title: Text("Group", style: TextStyle(color: Colors.blueAccent),),)),
          PopupMenuItem(onTap: () { // facebook space
            
          }, child: ListTile(leading: Icon(Icons.mic, color: Colors.blueAccent,), title: Text("FB Space", style: TextStyle(color: Colors.blueAccent),),)),
          PopupMenuItem(onTap: () { //settings
            
          }, child: ListTile(leading: Icon(Icons.settings , color: Colors.blueAccent,), title: Text("Settings", style: TextStyle(color: Colors.blueAccent),),)),
        ];
      })
    ] : [
      IconButton(onPressed: () {}, icon: Icon(Icons.videocam, size: 35, color: Colors.blueAccent)),
      IconButton(onPressed: () {}, icon: Icon(Icons.call, size: 29, color: Colors.blueAccent)),
    ], leadingWidth: 0,
    toolbarHeight: 85, title: Text("Facebook", style: TextStyle(color: Colors.blueAccent, fontSize: 25),),
    backgroundColor: Colors.white, elevation: 0.3,);
  }
}
