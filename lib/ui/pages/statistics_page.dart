import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    final String assetName = 'images/madrid.svg';
    final Widget svg = SvgPicture.asset(
        assetName,
        color: Colors.orangeAccent,
        semanticsLabel: 'Acme Logo'
    );
    return Scaffold(
      body: SafeArea(child: svg),
    );
  }
}
