import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterPageAdvance extends StatelessWidget {
  const CounterPageAdvance({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   home: Scaffold(
    //     body: Center(
    //       child: Counter(),
    //     ),
    //   ),
    // );

    return const CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Counter(),
        ),
      ),
    );
  }
}

class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Increment'),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final int count;

  const CounterDisplay({required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget counterIncrementor = CounterIncrementor(onPressed: _increment);
    Widget counterDisplay = CounterDisplay(count: _count);
    Widget space = const SizedBox(
      width: 16,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        counterIncrementor,
        space,
        counterDisplay,
      ],
    );
  }
}
