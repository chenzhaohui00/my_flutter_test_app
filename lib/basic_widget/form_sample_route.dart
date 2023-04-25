import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FormSampleRoute extends StatefulWidget {
  const FormSampleRoute({super.key});

  @override
  State<StatefulWidget> createState() {
    return FormSampleState();
  }

}

class FormSampleState extends State<FormSampleRoute> {

  var userNameController = TextEditingController();
  var pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FormSampleState"),),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: userNameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: "用户名",
                hintText: "用户名或邮箱"
              ),
              validator: (userName) {
                logger.d('验证用户名');
                return (userName == null || userName.trim().isEmpty) ? "用户名不能为空" : null;
              },
            ),
            TextFormField(
              controller: pwdController,
              decoration: const InputDecoration(
                labelText: '密码',
                icon: Icon(Icons.lock)
              ),
              obscureText: true,
              validator: (pwd) {
                logger.d('验证密码');
                if (pwd == null || pwd.length < 6) {
                  return "密码不能少于 6 位";
                } else {
                  return null;
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 5.0, right: 5.0),
              child: Row(
                children: [
                  Expanded(child: ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("登录"),
                    ),
                    onPressed: () {
                      if ((_formKey.currentState as FormState).validate()) {
                        logger.d('登录成功');
                      }
                    },
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}