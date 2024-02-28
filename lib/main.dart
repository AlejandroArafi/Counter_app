import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:
              _selectedIndex == 1 ? Color(0xFF82F4EB) : Colors.purple[100],
          title: Padding(
            padding: EdgeInsetsDirectional.only(top: 28.0),
            child: Text(
              'Contador',
              style: TextStyle(
                fontSize: 31.0,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  )
                ],
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: const Center(
          child: CounterWidget(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'inicio',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.color_lens), label: 'Cambiar color'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onTappedItem,
        ),
        backgroundColor:
            _selectedIndex == 1 ? Color(0xFF82F4EB) : Colors.purple[100],
      ),
    );
  }

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _decrement,
              child: const Icon(Icons.remove),
              backgroundColor: Color(0xFFF9F871),
            ),
            const SizedBox(width: 20),
            Text('$_counter', style: const TextStyle(fontSize: 24.0)),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: _increment,
              child: const Icon(Icons.add),
              backgroundColor: Color(0xFFF9F871),
            ),
          ],
        ),
        const SizedBox(height: 20),
        FloatingActionButton(
          onPressed: _reset,
          tooltip: 'Reset',
          child: const Icon(Icons.refresh),
          backgroundColor: Color(0xFFF9F871),
        ),
      ],
    );
  }
}
