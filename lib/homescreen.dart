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

 void initState() {
   super.initState();
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     double minScrollExtent1 = _scrollController1.position.minScrollExtent;
     double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;

     animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 25,
     _scrollController1);


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
