
import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hello World!',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}