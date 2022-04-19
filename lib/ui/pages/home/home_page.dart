import 'package:flutter/material.dart';

import 'package:barriolympics/ui/components/post/post_list.dart';
import 'package:barriolympics/ui/components/banner/top_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const TopBanner(),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Recent posts',
                    style: Theme.of(context).textTheme.headline6),
              ),
          ),
          const PostList(),
          const SliverToBoxAdapter(child: SizedBox(height: 30),),
        ],
      ),
    );
  }
}
