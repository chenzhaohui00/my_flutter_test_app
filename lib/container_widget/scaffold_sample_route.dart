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
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School')
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onNavigate,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }

  _onNavigate(int index) {
    setState(() {
      // debugPrint('_onNavigate, index:$index');
      _selectedIndex = index;
    });
  }

  _onAdd() {
    // print('_onAdd');
    _logger.v('onAdd');
  }
}