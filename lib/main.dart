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
  int _incrementValue = 1;
  int _decrementValue = 1;

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateValues(int increment, int decrement) {
    setState(() {
      _incrementValue = increment;
      _decrementValue = decrement;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Contador App'),
            backgroundColor: Color.fromARGB(255, 171, 230, 225)),
        body: Center(
          child: _selectedIndex == 0
              ? CounterWidget(
                  incrementValue: _incrementValue,
                  decrementValue: _decrementValue)
              : SettingsWidget(
                  onValuesChanged: _updateValues,
                  incrementValue: _incrementValue,
                  decrementValue: _decrementValue,
                ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Contador',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Configuración',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onTappedItem,
          showUnselectedLabels: true,
          backgroundColor: Color.fromARGB(255, 171, 230, 225),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  final int incrementValue;
  final int decrementValue;

  const CounterWidget({
    Key? key,
    required this.incrementValue,
    required this.decrementValue,
  }) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter += widget.incrementValue;
    });
  }

  void _decrement() {
    setState(() {
      _counter -= widget.decrementValue;
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
              backgroundColor: const Color.fromARGB(255, 242, 129, 240),
            ),
            const SizedBox(width: 20),
            Text('$_counter', style: const TextStyle(fontSize: 24.0)),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: _increment,
              child: const Icon(Icons.add),
              backgroundColor: const Color.fromARGB(255, 242, 129, 240),
            ),
          ],
        ),
        const SizedBox(height: 20),
        FloatingActionButton(
          onPressed: _reset,
          tooltip: 'Reset',
          child: const Icon(Icons.refresh),
          backgroundColor: const Color.fromARGB(255, 242, 129, 240),
        ),
      ],
    );
  }
}

class SettingsWidget extends StatefulWidget {
  final Function(int, int) onValuesChanged;
  final int incrementValue;
  final int decrementValue;

  const SettingsWidget({
    Key? key,
    required this.onValuesChanged,
    required this.incrementValue,
    required this.decrementValue,
  }) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late int _incrementValue;
  late int _decrementValue;

  @override
  void initState() {
    super.initState();
    _incrementValue = widget.incrementValue;
    _decrementValue = widget.decrementValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Incremento: $_incrementValue'),
        Slider(
          value: _incrementValue.toDouble(),
          min: 1,
          max: 10,
          onChanged: (double value) {
            setState(() {
              _incrementValue = value.round();
            });
            widget.onValuesChanged(_incrementValue, _decrementValue);
          },
        ),
        Text('Decremento: $_decrementValue'),
        Slider(
          value: _decrementValue.toDouble(),
          min: 1,
          max: 10,
          onChanged: (double value) {
            setState(() {
              _decrementValue = value.round();
            });
            widget.onValuesChanged(_incrementValue, _decrementValue);
          },
        ),
      ],
    );
  }
}
