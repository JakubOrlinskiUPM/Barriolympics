import 'package:barriolympics/ui/pages/events/events.dart';
import 'package:barriolympics/ui/pages/help_page.dart';
import 'package:barriolympics/ui/pages/page_details.dart';
import 'package:barriolympics/ui/pages/routing.dart';
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
        debugShowCheckedModeBanner: false,
        title: 'Barriolympics',
        theme: CustomTheme.lightTheme,
        onGenerateRoute: checkGeneralRoutes,
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
    return WillPopScope(
      onWillPop: () async =>
          !await tabs[_currentIndex].navigatorKey.currentState!.maybePop(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: tabs[_currentIndex].navigator,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomAppBar(
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(),
          ),
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              iconSize: 25,
              currentIndex: _currentIndex,
              onTap: (val) => _onTap(val, context),
              items: tabs
                  .map(
                    (tab) => BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 4.0,
                        ),
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
          child: FloatingActionButton.extended(
            onPressed: () {
              HelpPage.showHelpPage(context);
            },
            tooltip: 'Help the community',
            label: Text("Contribute"),
            icon: Icon(
              Icons.handshake_outlined,
              size: 40,
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
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
