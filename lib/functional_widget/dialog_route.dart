import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogSampleRoute extends StatelessWidget {
  const DialogSampleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DialogSampleRoute'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () async {
                    var result = await showAlertDialog(context);
                    debugPrint('AlertDialog exit result: $result');
                  },
                  child: const Text('AlertDialog'));
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () async {
                    var result = await showSimpleDialog(context);
                    debugPrint('SimpleDialog exit result: $result');
                  },
                  child: const Text('SimpleDialog'));
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () async {
                    var result = await showBaseDialog(context);
                    debugPrint('Dialog exit result: $result');
                  },
                  child: const Text('Dialog'));
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () async {
                    var result = await stateManageTestDialog(context);
                    debugPrint('Dialog exit result: $result');
                  },
                  child: const Text('stateManageTestDialog'));
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () async {
                    var result = await showBottomSheet(context);
                    debugPrint('bottomSheet exit result: $result');
                  },
                  child: const Text('bottomSheet'));
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () async {
                    var result = await showMaterialDatePicker(context);
                    debugPrint('dataPicker exit result: $result');
                  },
                  child: const Text('materialDatePicker'));
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () async {
                    var result = await showCupertinoDatePicker(context);
                    debugPrint('dataPicker exit result: $result');
                  },
                  child: const Text('cupertinoDatePicker'));
            }),
          ],
        ),
      ),
    );
  }

  Future showAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('提示'),
            content: const Text('确定删除？'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('取消')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('确定'))
            ],
          );
        });
  }

  Future showSimpleDialog(BuildContext ctx) {
    return showDialog(
        context: ctx,
        builder: (context) {
          return SimpleDialog(
            title: const Text('选择语言'),
            children: [
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop('中文'),
                child: const Text('中文'),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop('英文'),
                child: const Text('英文'),
              ),
            ],
          );
        });
  }

  Future showBaseDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: SizedBox(
              height: 400,
              child: Column(
                children: [
                  const ListTile(title: Text('请选择')),
                  Expanded(child: ListView.builder(itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text('$index'),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  }))
                ],
              ),
            ),
          );
        });
  }

  Future stateManageTestDialog(BuildContext context) {
    var withChildren = false;
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('提示'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('取消')),
              TextButton(
                  onPressed: () => Navigator.of(ctx).pop(withChildren),
                  child: const Text('删除')),
            ],
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('您确定要删除当前文件吗？'),
                Row(
                  children: [
                    const Text('同时删除子目录？'),
                    /*Checkbox(value: withChildren, onChanged: (newValue) {
                      withChildren = newValue ?? !withChildren;
                      (ctx as Element).markNeedsBuild();
                  })*/
                    StatefulBuilder(
                      builder: (ctx, setState) {
                        return Checkbox(
                            value: withChildren,
                            onChanged: (newValue) {
                              setState(() {
                                withChildren = newValue ?? !withChildren;
                              });
                            });
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  Future showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return ListView.builder(
              itemExtent: 45,
              itemCount: 30,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text('$index'),
                );
              });
        });
  }

  Future showMaterialDatePicker(BuildContext context) {
    var dateNow = DateTime.now();
    return showDatePicker(
        context: context,
        initialDate: dateNow,
        firstDate: dateNow.subtract(const Duration(days: 30)),
        lastDate: dateNow.add(const Duration(days: 30)));
  }

  Future showCupertinoDatePicker(BuildContext context) {
    var dateNow = DateTime.now();
    var selectedDate = dateNow;
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: 400,
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).pop(selectedDate);
                    }, child: const Text('确定'),),
                  ],
                ),
                Expanded(
                  child: CupertinoDatePicker(
                      minimumDate: dateNow.subtract(const Duration(days: 30)),
                      maximumDate: dateNow.add(const Duration(days: 30)),
                      maximumYear: dateNow.year + 1,
                      onDateTimeChanged: (dateTime) {
                        // debugPrint('pick: $dateTime');
                        selectedDate = dateTime;
                      }),
                ),
              ],
            ),
          );
        });
  }
}
