import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/app.dart';
import 'package:video_player/video_player.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<VideoSection> createState() => VideoState(url);
}

var video_controller, video_controller_initializer;

class VideoState extends State<VideoSection> {
  var url; VideoState(this.url);
  @override
  void initState() {
    loadVideoPlayer(url);
    super.initState();
  }

  
  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
     super.dispose();//video_controller.dispose();
   
  }

  void loadVideoPlayer (String url) {
     video_controller = VideoPlayerController.asset(url);
     video_controller_initializer = video_controller.initialize();
     video_controller.addListener(() { setState(() {}); });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: video_controller_initializer, builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  child: Stack(children: [
                    Column(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width, height: 400,
                        child: VideoPlayer(video_controller),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width, height: 50,
                        child:  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          IconButton(onPressed: () {
                            setState(() {
                                var duration = (video_controller.value.position.inSeconds), increment = Duration(seconds: 30);
                                increment -= Duration(seconds: duration);
                                video_controller.seekTo(increment);
                            });
                          }, icon: Icon(Icons.fast_rewind, color: Colors.blueAccent, size: 35,)),
                          IconButton(onPressed: () {
                            if (!video_controller.value.isPlaying) {
                              video_controller.play();
                              return null;
                            }
                            video_controller.pause();
                          }, icon: Icon(size: 40,
                            !video_controller.value.isPlaying ? Icons.play_circle_fill : Icons.pause_circle_filled, color: Colors.blueAccent,)),
                          IconButton(onPressed: () {
                            setState(() {
                                var duration = (video_controller.value.position.inSeconds), increment = Duration(milliseconds: 30000);
                                increment += Duration(milliseconds: duration);
                                video_controller.seekTo(increment);
                            });
                          }, icon: Icon(Icons.fast_forward, color: Colors.blueAccent, size: 35,)),
                        ],),),
                        Container(height: 1, decoration: BoxDecoration(
                          border: Border.all(color: Color.fromARGB(255, 245, 245, 245))
                        ),)
                      ,Row(
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
                        ),
                    ],),
                  ],), 
                  width: MediaQuery.of(context).size.width, height: 500,
                ) ;

              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
          }
    );
  }
}