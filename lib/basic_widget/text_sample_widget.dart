import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextSampleWidget extends StatelessWidget {
  const TextSampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextSampleWidget'),
      ),
      body: Column(
          children: [
            Text(
              '用overflow处理超出显示区域如何显示,' * 2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Text(
              '用textScaleFactor定义文字缩放比例',
              textScaleFactor: 1.5,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Text(
              '使用style的文本',
              style: TextStyle(
                  color: Colors.yellow,
                  //文字颜色
                  fontSize: 20,
                  //字体
                  height: 1.8,
                  //行高，不影响文字大小，默认只影响上边距
                  backgroundColor: Colors.grey,
                  //背景颜色
                  decoration: TextDecoration.underline),
            ),
            const Text.rich(TextSpan(children: [
              TextSpan(text: 'google：', style: TextStyle(fontSize: 16)),
              TextSpan(
                text: 'www.google.com',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                    decoration: TextDecoration.underline),
              )
            ])),
            DefaultTextStyle(
                style: const TextStyle(color: Colors.red, fontSize: 20),
                child: Column(
                  children: const [
                    Text('继承DefaultTextStyle的child'),
                    Text('不继承DefaultTextStyle的child',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    )
                  ],
                ))
          ],
        ),
    );
  }
}
