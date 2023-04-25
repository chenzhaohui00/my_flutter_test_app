import 'package:flutter/material.dart';

class TextFieldTestRoute extends StatefulWidget {
  const TextFieldTestRoute({super.key});

  @override
  _TextFieldTestRouteState createState() =>
      _TextFieldTestRouteState();
}

class _TextFieldTestRouteState extends State<TextFieldTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('TextFieldTestRoute'),),
        body: Column(
          children: const <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
            ),
          ],
        )
    );
  }
}
