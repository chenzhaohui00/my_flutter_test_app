import 'package:flutter/material.dart';

class ThemeAndColorRoute extends StatelessWidget {
  const ThemeAndColorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const ThemeTestRoute(),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: const [
      //     AutoNavBar(title: '适配文字颜色', color: Colors.blue),
      //     AutoNavBar(title: '适配文字颜色', color: Colors.greenAccent),
      //   ],
      // ),
    );
  }
}

class AutoNavBar extends StatelessWidget {
  final Color color;
  final String title;

  const AutoNavBar({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      color: color,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
            color:
                color.computeLuminance() > 0.5 ? Colors.black : Colors.white),
      ),
    );
  }
}

class ThemeTestRoute extends StatefulWidget {
  const ThemeTestRoute({super.key});

  @override
  State<StatefulWidget> createState() => _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  var _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor,
          iconTheme: IconThemeData(color: _themeColor)),
      child: Scaffold(
        appBar: AppBar(title: const Text('主题测试'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text(' 颜色跟随主题')
              ],
            ),
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text(' 颜色固定黑色')
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _themeColor = _themeColor == Colors.teal ? Colors.blue : Colors.teal;
            });
          },
          child: const Icon(Icons.palette),
        ),
      )
    );
  }
}
