import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/app-bar.dart';
import 'package:myapp/components/chat.dart';
import 'package:myapp/components/index.dart';
import 'package:myapp/components/login.dart';
import 'package:myapp/components/video.dart';
import 'package:video_player/video_player.dart';

var menu = 0, video_controller, video_controller_initializer;

class App extends StatefulWidget {
  @override
  State<App> createState() => AppState();
}

void navigateTo (BuildContext context, page, data) {
   Navigator.pushNamed( context, '/chat');
}

Widget getList(BuildContext context) {
  return 
  Container( 
    padding: EdgeInsets.all(1),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
    height: 95, decoration: BoxDecoration(
      color: Colors.white, 
      //border: Border(bottom: BorderSide(color: Color.fromARGB(31, 97, 96, 96)))
    ),
    child: TextButton(onPressed: () {
      showDialog(context: context, useSafeArea: false, barrierDismissible: false, builder: (BuildContext context) => Wrap(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center( child: CircularProgressIndicator(), ),
        ),
      ]));
      //Navigator.of(context).pushNamed(result);
      Timer(Duration(milliseconds: 2500), () {
         Navigator.pop(context);
         navigateTo(context, Chat(), "My data");
      });
    }, 
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 56, backgroundColor: Colors.transparent,
          child: Padding(padding: EdgeInsets.all(4),child: ClipOval(
            child: Image.asset("assets/janie.jpg")
          ),),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Anna Jane", style: TextStyle(color: Color.fromARGB(255, 49, 48, 48), fontWeight:  FontWeight.bold, fontSize: 20)),
            Container(height: 8,),
            Text("Good morning my darling beautiful", style: TextStyle(color: Color.fromARGB(255, 96, 96, 99)),)
          ],
        )
      ], 
    ),
  ));
}

Widget getPeopleList(BuildContext context) {
  return Container( padding: EdgeInsets.all(8),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
    height: 95, decoration: BoxDecoration(
      color: Colors.white, 
      //border: Border(bottom: BorderSide(color: Color.fromARGB(31, 97, 96, 96)))
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 56, backgroundColor: Colors.transparent,
          child: Padding(padding: EdgeInsets.all(4),child: ClipOval(
            child: Image.asset("assets/janie.jpg")
          ),),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Jilo Billionaire", style: TextStyle(color: Color.fromARGB(255, 49, 48, 48), fontWeight:  FontWeight.bold, fontSize: 20)),
            Container(height: 8,),
            Text("+234 813 186 9009                     New York", style: TextStyle(color: Color.fromARGB(255, 96, 96, 99)),)
          ],
        )
      ], 
    ),
  );
}

List <Widget> populate_inbox_list (max, BuildContext context) {
  List <Widget> list = [];
  for (var i = 0; i < max; i++) {
    list.add(getList(context));
  }
  return list;
}

List <Widget> populate_people_list (max, BuildContext context) {
  List <Widget> list = [];
  for (var i = 0; i < max; i++) {
    list.add(getPeopleList(context));
  }
  return list;
}

Widget populate_profile_page () {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    padding: EdgeInsets.all(35),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.transparent, radius: 120,
            child: Padding(padding: EdgeInsets.all(0), child: ClipOval(child: Image.asset("assets/janie.jpg"),),) ,
          ),
        ),
        Container(height: 10,),
        Text("Anna Jane", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 86, 86, 87), fontSize: 45)),
        Container(height: 25,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_pin, color: Colors.blueAccent, size: 25,),
            Container(width: 25,), Text("Mountain View, Silicon Valley, \nCalifornia, USA", style: TextStyle(fontSize: 20, color: Colors.grey)),
          ],
        ),
        Container(height: 25,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.email, color: Colors.blueAccent, size: 25,),
            Container(width: 25,), Text("anna_jane@jilo.ng", style: TextStyle(fontSize: 20)),
          ],
        ),
        Container(height: 25,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.phone, color: Colors.blueAccent, size: 25,),
            Container(width: 25,), Text("+234 813 186 9009", style: TextStyle(fontSize: 20)),
          ],
        ),
        Container(height: 25,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.calendar_view_month, color: Colors.blueAccent, size: 25,),
            Container(width: 25,), Text("April, 27 2000", style: TextStyle(fontSize: 20)),
          ],
        ),
        Container(height: 25,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.female_outlined, color: Colors.blueAccent, size: 25,),
            Container(width: 25,), Text("Female", style: TextStyle(fontSize: 20)),
          ],
        )
      ],
    ),
  );
}

List <Widget> getCurrentScreen (BuildContext context, var state) {
  if (menu == 0) return getHomePage(context, state);
  if (menu == 1) return populate_inbox_list(100, context);
  if (menu == 2) return populate_people_list(75, context);
  if (menu == 3) return [populate_profile_page()];
  if (menu == 4) return [Text("Jilo Billionaire")];
  return populate_inbox_list(100, context);
}

Card reel (BuildContext context) {
  return Card(
    elevation: 2, color: Colors.white,
    shadowColor: Colors.transparent,
    child: SizedBox(
      width: 175, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/janie.jpg"), Container(height: 10,),
          Text("Anna Jane", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          Container(height: 10,),
        ],
      ),
    ),
  );
}

Card shop (BuildContext context, url) {
  return Card(
    elevation: 2, color: Colors.white,
    shadowColor: Colors.white,
    child: SizedBox(
      width: 250, height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(url, fit: BoxFit.fill, height: 400,),
        ],
      ),
    ),
  );
}

List <Widget> populateReels (BuildContext context) {
  var array = <Widget> [];
  for (var i = 0; i < 5; i++) {
    array.add(reel(context));
    array.add(Container(width: 10,));
  }
  return array;
}

List <Widget> populateMarket (BuildContext context) {
  var array = <Widget> []; var pics = [
    "suit-real", "dinner-gown", "gown"
  ];
  for (var i = 0; i < pics.length; i++) {
    array.add(shop(context, "assets/" + pics[i] + ".jpg"));
    array.add(Container(width: 10,));
  }
  return array;
}

Widget post (BuildContext context, image) {
  return Container(
    child: Column(
      children: [
        Image.asset(image, height: 400, width: MediaQuery.of(context).size.width, fit: BoxFit.fill,),
        Container(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.hand_thumbsup, color: Colors.blueAccent,)),
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.heart, color: Colors.blueAccent,)),
            IconButton(onPressed: () {
              showBottomSheet(context: context, builder: (context) => Container(
                child: Wrap(children: [
                  ListTile(title: Text("Like"), leading: Icon(CupertinoIcons.hand_thumbsup_fill, color: Colors.blueAccent,)),
                  ListTile(title: Text("Love"), leading: Icon(CupertinoIcons.heart_fill, color: Colors.redAccent,)),
                  ListTile(title: Text("Smile"), leading: Icon(CupertinoIcons.smiley_fill, color: Color.fromARGB(255, 228, 228, 23),)),
                ],),
              ));
            }, icon: Icon(CupertinoIcons.smiley, color: Colors.blueAccent,)),
            IconButton(onPressed: () {
              showBottomSheet(context: context, builder: (context) => Wrap(children: [
                ListTile(title: Text("WhatsApp"), leading: Icon(Icons.whatsapp, color: Colors.greenAccent,)),
                ListTile(title: Text("Share"), leading: Icon(Icons.share, color: Colors.blueAccent,)),
                ListTile(title: Text("Copy"), leading: Icon(CupertinoIcons.link, color: Colors.redAccent,)),
              ],));
            }, icon: Icon(CupertinoIcons.reply, color: Colors.blueAccent,)),
          ],
        )
      ],
    ),
  );
}

List <Widget> VideoReels () {
  return <Widget> [    
          VideoSection(url: "assets/moana.mp4",),
          Container(width: 10,),
          Container(width: 10,),
          VideoSection(url: "assets/alvin.mp4",),
  ];
} 

List <Widget> getHomePage (BuildContext context, var state) {
  return [
    // reels section
    Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text("Short Reels", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 82, 80, 80), fontSize: 25),),
            // Container(height: 14,),
            // SingleChildScrollView(child: Row(children: populateReels(context),),scrollDirection: Axis.horizontal,),
            Text("Today's Feed", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 82, 80, 80), fontSize: 25),),
            Container(height: 14,),
            post(context,"assets/janie.jpg"),
            post(context,"assets/messi.jpg"),
            post(context,"assets/jilo.jpg"),
            Container(height: 14,),
            Text("Marketplace", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 82, 80, 80), fontSize: 25),),
            Container(height: 14,),
            SingleChildScrollView(child: Row(children: populateMarket(context),),scrollDirection: Axis.horizontal,),
            Container(height: 14,),
            post(context,"assets/messi.jpg"),
            Container(height: 14,),
            Text("Video Reels", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 82, 80, 80), fontSize: 25),),
            Container(height: 14,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
              height: 510,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                children: VideoReels(),
              ),
            ),
            ),
            Container(height: 14,),
            post(context,"assets/janie.jpg"),
            
          ],
        ),
      )
    )
  ];
}

class AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    var state = () => setState(() {
      video_controller.play();
    });
    return Scaffold(
      appBar: AppBar(
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
    backgroundColor: Colors.white, elevation: 0.3,),
      body: SingleChildScrollView(
        child: Column(children: getCurrentScreen(context, state),),
      ),
      floatingActionButton: menu == 3? Container() : FloatingActionButton(backgroundColor: Colors.white,onPressed: () {
        setState(() {
          video_controller.play();
        });
      }, child: Icon(menu == 1 ? menu == 0 ? Icons.abc : Icons.search : Icons.add, color: Colors.blueAccent,),),
      bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,
        fixedColor: Colors.grey, onTap: (value) {
        setState(() { menu = value; });
      },items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: (menu == 0)? Colors.blueAccent : Colors.grey,), label: "Posts",),
        BottomNavigationBarItem(icon: Icon(Icons.messenger, color: (menu == 1)? Colors.blueAccent : Colors.grey,), label: "Inbox",),
        BottomNavigationBarItem(icon: Icon(Icons.group, color: (menu == 2)? Colors.blueAccent : Colors.grey), label: "Friends"),
        BottomNavigationBarItem(icon: Icon(Icons.settings, color: (menu == 3)? Colors.blueAccent : Colors.grey), label: "Settings"),
      ], backgroundColor: Colors.white,)
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
