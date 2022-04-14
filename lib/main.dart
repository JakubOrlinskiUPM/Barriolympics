import 'package:barriolympics/ui/pages/events/events.dart';
import 'package:barriolympics/ui/pages/help.dart';
import 'package:barriolympics/ui/pages/page_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:barriolympics/ui/custom_theme.dart';
import 'package:barriolympics/ui/pages/home/home.dart';
import 'package:barriolympics/provider/app_state.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AppState())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: CustomTheme.lightTheme,
        home: const App(),
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  final List<PageDetails> tabs = [
    Home(),
    Events(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex].navigator,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
            iconSize: 30,
            backgroundColor: Colors.transparent,
            currentIndex: _currentIndex,
            onTap: (val) => _onTap(val, context),
            items: tabs
                .map(
                  (tab) => BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                      child: Icon(tab.pageIcon),
                    ),
                    label: tab.pageName,
                  ),
                )
                .toList()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(1.0),
        child: FloatingActionButton(
          onPressed: () {
            Provider.of<AppState>(context, listen: false).addEvents();
            showModalBottomSheet(
              context: context,
              builder: (BuildContext ctx) {
                return const HelpPage();
              },
            );
          },
          tooltip: 'Help the community',
          child: const Icon(Icons.group),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  void _onTap(int val, BuildContext context) {
    if (_currentIndex == val) {
      tabs[_currentIndex]
          .navigatorKey
          .currentState
          ?.popUntil((route) => route.isFirst);
    } else {
      if (mounted) {
        setState(() {
          _currentIndex = val;
        });
      }
    }
  }
}

// For illustration purposes
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title: "Barriolympics"}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(1.0),
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
