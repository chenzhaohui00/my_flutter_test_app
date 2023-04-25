import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ScaffoldSampleRoute extends StatefulWidget {
  const ScaffoldSampleRoute({super.key});

  @override
  State<StatefulWidget> createState() => ScaffoldSampleRouteState();
}

class ScaffoldSampleRouteState extends State<ScaffoldSampleRoute> {
  int _selectedIndex = 1;
  final _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScaffoldSampleRoute'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      drawer: const MyDrawer(),
      /*bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School')
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onNavigate,
      ),*/
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.home), onPressed: () { _onNavigate(0); },),
            const SizedBox(), //中间位置空出
            IconButton(icon: const Icon(Icons.business), onPressed: () { _onNavigate(1); },),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAdd,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _onNavigate(int index) {
    setState(() {
      // debugPrint('_onNavigate, index:$index');
      _logger.v('_onNavigate, index:$index');
      _selectedIndex = index;
    });
  }

  _onAdd() {
    // print('_onAdd');
    _logger.v('onAdd');
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 38),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipOval(
                        child: Image.asset(
                          'images/hacker_avatar.png',
                          width: 80,
                        ),
                      ),
                    ),
                    const Text(
                      'hacker',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    )
                  ],
                )
              ),
              Expanded(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text('Add account')
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Manage accounts')
                    ),
                  ],
                )
              )
            ],
          )),
    );
  }
}