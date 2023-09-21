import 'package:flutter/material.dart';

class HeroAnimationRoute extends StatelessWidget {
  HeroAnimationRoute({super.key});

  List<String> paths = [
    "hacker_avatar.png",
    "plus_icon.png",
    "sea.jpg",
    "send_icon.png",
    "thumb_up_icon.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HeroAnimationRoute"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageWidget(context, paths[0]),
          imageWidget(context, paths[1]),
          imageWidget(context, paths[2]),
          imageWidget(context, paths[3]),
          imageWidget(context, paths[4]),
        ],
      ),
    );
  }

  Widget imageWidget(BuildContext context, String path) {
    String finalPath = "images/$path";
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HeroDetailRoute(finalPath);
      })),
      child: Hero(
          tag: finalPath,
          child: Image.asset(
            finalPath,
            width: 100,
          )),
    );
  }
}

class HeroDetailRoute extends StatelessWidget {
  String path;

  HeroDetailRoute(this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Hero(tag: path, child: Image.asset(path))));
  }
}
