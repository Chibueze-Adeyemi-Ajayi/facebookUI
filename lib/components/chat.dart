import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const Chat()); 
}

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => ChatPageState();
}

AppBar MyAppBar (BuildContext context) {
  return AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam, color: Colors.blueAccent)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call, color: Colors.blueAccent)),
        ], 
        leading: IconButton(onPressed: () {Navigator.of(context).pop(Chat());}, icon: Icon(Icons.arrow_back, color: Colors.blueAccent)),
        title: Text("Anna Jane", style: TextStyle(color: Colors.blueAccent),), elevation: .15, backgroundColor: Colors.white,);
}

Widget BottomNavBar (BuildContext context) {
  return Container(
    padding: EdgeInsets.all(8),
    height: 70, decoration: BoxDecoration(
      color: Colors.white, 
      border: Border(top: BorderSide(color: Color.fromARGB(255, 240, 237, 237)))
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: () {showModalBottom(context);}, icon: Icon(Icons.attach_file, color: Colors.blueAccent,),),
        SizedBox(width: (MediaQuery.of(context).size.width - 112), height: 100, child: TextField(
          autofocus: false, 
            decoration: InputDecoration( 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              hintText: 'Enter a search term',
            ),
          ),),
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.paperplane, color: Colors.blueAccent,),),
      ],
    ),
  );
}

void showModalBottom (BuildContext context) {
  showModalBottomSheet(context: context, builder: (context) => Wrap(
    children: [
      Padding(padding: EdgeInsets.all(14), child: Text("Choose option", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),)
      ,
      ListTile(
      title: Text("Link", style: TextStyle(color: Colors.blueAccent),),
      leading: Icon((Icons.link), color: Colors.blueAccent,),),
      ListTile(
      title: Text("Document", style: TextStyle(color: Colors.blueAccent),),
      leading: Icon((Icons.file_upload), color: Colors.blueAccent,),),
      ListTile(
      title: Text("Video/Audo", style: TextStyle(color: Colors.blueAccent),),
      leading: Icon((Icons.video_file), color: Colors.blueAccent,),),
      ListTile(
      title: Text("Image", style: TextStyle(color: Colors.blueAccent),),
      leading: Icon((Icons.camera), color: Colors.blueAccent,),),
    ],
  ));
}

Widget showMessage (bool me, message) {
  if (me) return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        child: Text(message, style: TextStyle(color: Colors.white, fontSize: 16)),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35), 
                                          bottomLeft: Radius.circular(35))
        ),
      )
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        child: Text(message, style: TextStyle(color: Colors.black, fontSize: 16)),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 206, 203, 203),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35), 
                                          bottomRight: Radius.circular(35))
        ),
      )
    ],
  );
}

List <String> messages = [
  "Hello Jane !!", "Ojibu Ojibu how va ?", "I dey o\nHope you still remember our talk", "Remind me please",
  "oya forget", "oo serious", "I love you", "I hate you with passions", "Jess, what have I done to deserve such",
  "just because you created this stupid app"
];

List <Widget> populateMessages () {
  List <Widget> messages__ = []; int x = -1;
  messages.forEach((element) {  x ++;
    messages__.add(showMessage((x % 2 == 0), element));
    messages__.add(Container(height: 10,));
  });
  return messages__;
}

class ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(child: SingleChildScrollView(child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(children: populateMessages()),
        ),)),
        BottomNavBar(context),
      ],),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
