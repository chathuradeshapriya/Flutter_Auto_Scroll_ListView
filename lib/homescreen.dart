import 'package:flutter/material.dart';
import 'package:flutter_movies_autoscroll_listview/data.dart';

import 'movieslistview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController1 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            MoviesListView(
              scrollController: _scrollController1,
              images: movies1,
            )
          ],
        ),
      ),
    );
  }
}
