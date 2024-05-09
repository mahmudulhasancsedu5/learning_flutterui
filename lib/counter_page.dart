import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( home: Scaffold( body: Center(child: _Counter(),)),);
  }
}

class _Counter extends StatefulWidget {
  const _Counter();

  @override
  State<_Counter> createState() => _CounterState();
}

class _CounterState extends State<_Counter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
            onPressed: _incrementCounter,
            child: const Text(
              'Increment',
            )),
        const SizedBox(
          width: 16,
        ),
        Text('Count: $_counter'),
      ],
    );
  }
}
