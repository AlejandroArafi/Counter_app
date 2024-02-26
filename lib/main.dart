import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsetsDirectional.only(top: 28.0),
            child: Text(
              'Contador',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 30.0,
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
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar')
          ],
        ),
      ),
    );
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
            ),
            const SizedBox(width: 20),
            Text('$_counter', style: const TextStyle(fontSize: 24.0)),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: _increment,
              child: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(height: 20),
        FloatingActionButton(
          onPressed: _reset,
          tooltip: 'Reset',
          child: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
