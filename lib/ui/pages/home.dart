import 'package:flutter/material.dart';

import 'package:barriolympics/ui/components/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Barriolympics"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(1.0),
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Help the community',
          child: const Icon(Icons.group),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
