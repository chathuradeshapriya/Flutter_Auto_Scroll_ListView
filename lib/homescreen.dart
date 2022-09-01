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
  ScrollController _scrollController2 = ScrollController();
  ScrollController _scrollController3 = ScrollController();

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;

      double minScrollExtent2 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent2 = _scrollController1.position.maxScrollExtent;

      double minScrollExtent3 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent3 = _scrollController1.position.maxScrollExtent;

      animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 25,
          _scrollController1);

      animateToMaxMin(maxScrollExtent2, minScrollExtent2, maxScrollExtent2, 15,
          _scrollController2);

      animateToMaxMin(maxScrollExtent3, minScrollExtent3, maxScrollExtent3, 20,
          _scrollController3);
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                MoviesListView(
                  scrollController: _scrollController1,
                  images: movies1,
                ),            MoviesListView(
                  scrollController: _scrollController2,
                  images: movies2,
                ),            MoviesListView(
                  scrollController: _scrollController3,
                  images: movies3,
                ),
              ],
            ),

            Text('30 days for free',
            style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold
            ),),

            Material(
              elevation: 0,
              color: Color(0xfff2c94c),
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                onPressed: () {},
                minWidth: 340,
                height: 60,
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
