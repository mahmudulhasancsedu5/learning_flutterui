import 'package:flutter/material.dart';

class HandlingGestureApp extends StatelessWidget {
  const HandlingGestureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: Center(child: MyButton(),),),);
  }
  
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Button was tapped');
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue[500],
        ),
        child: const Center(
          child: Text('Accept'),
        ),
      ),
    );
  }
}
