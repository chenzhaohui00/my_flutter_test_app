import 'package:flutter/material.dart';

class WrapFlowSampleRoute extends StatelessWidget {
  const WrapFlowSampleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WrapFlowSampleRoute'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.grey,
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  //多个行在纵轴上的对齐
                  runAlignment: WrapAlignment.end,
                  //同一行的不同Widget在纵轴方向上的对齐
                  crossAxisAlignment: WrapCrossAlignment.start,
                  //行间距
                  runSpacing: 2,
                  children: const [
                    Chip(
                      label: Text('张飞'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('张'),
                      ),
                    ),
                    Chip(
                      label: Text('赵子龙'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('赵'),
                      ),
                    ),
                    Chip(
                      label: Text('孙中山'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('孙'),
                      ),
                    ),
                    Chip(
                      label: Text('李宗盛'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('李'),
                      ),
                    ),
                    Chip(
                      label: Text('周树人'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('周'),
                      ),
                    ),
                    Text(
                      'Text',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              Flow(
                delegate: TestFlowDelegate(margin: const EdgeInsets.all(9)),
                children: [
                  Container(width: 80, height: 80, color: Colors.red),
                  Container(width: 80, height: 80, color: Colors.green),
                  Container(width: 80, height: 80, color: Colors.blue),
                  Container(width: 80, height: 80, color: Colors.black),
                  Container(width: 80, height: 80, color: Colors.pink),
                  Container(width: 80, height: 80, color: Colors.yellow),
                ],
              )
            ],
          ),
        ));
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      //1. 获取第i个child的右坐标
      var right = x + context.getChildSize(i)!.width + margin.right;
      //2. 比较是否已经超过了整体的最大宽度
      if (right < context.size.width) {
        //没有超过，直接绘制
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x = right;
      } else {
        //超过了，x归零从左面画起，y增加一行的高度
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.bottom + margin.top;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = x + context.getChildSize(i)!.width + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 简单写法，实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return const Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
