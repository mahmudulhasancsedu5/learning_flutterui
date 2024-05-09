import "package:flutter/material.dart";

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.appTitle, super.key});

  final Widget appTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
          ),
          Expanded(child: appTitle),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          ),
        ],
      ),
    );
  }
}

class MyFirstPage extends StatelessWidget {
  const MyFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
            appTitle: Text(
              'ExampleTitle',
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
          const Expanded(
              child: Center(
            child: Text('Hello World!'),
          )),
        ],
      ),
    );
  }
}
