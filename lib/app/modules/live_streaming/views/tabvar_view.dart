import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello/app/modules/live_streaming/views/live_streaming_view.dart';
import 'package:hello/app/modules/live_streaming/views/popular_list_view.dart';

import '../../../../utilis/constant.dart';

class TabvarView extends StatefulWidget {
  const TabvarView({Key? key});

  @override
  State<TabvarView> createState() => _TabvarViewState();
}

class _TabvarViewState extends State<TabvarView> {
  List<String> tabs = [
    "Nearby",
    "Popular",
    "Events",
    'Bill Cartoon',
  ];
  int current = 1;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 40;
      case 1:
        return 120;
      case 2:
        return 205;

      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 16;
      case 1:
        return 16;
      case 2:
        return 16;

      default:
        return 0;
    }
  }

  Widget getTabView(int index) {
    switch (index) {
      case 0:
        return const LiveStreamingView(); // Replace with your desired widget for "Popular" tab
      case 1:
        return const PopularListView(); // Replace with your desired widget for "Most Visited" tab
      case 2:
        return const LiveStreamingView(); // Replace with your desired widget for "Recent" tab
      // Replace with your desired widget for "Explore" tab
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              width: size.width,
              height: size.height * 0.08,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: size.width,
                            height: size.height * 0.07,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: tabs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: index == 0 ? 10 : 23,
                                    top: 7,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: Text(
                                      tabs[index],
                                      style: GoogleFonts.ubuntu(
                                          fontSize: current == index ? 30 : 21,
                                          fontWeight: current == index
                                              ? FontWeight.w400
                                              : FontWeight.w300,
                                          color: current == index
                                              ? kPrimaryColor
                                              : Colors.black),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search_rounded,
                            color: Colors.black54,
                            size: 38,
                            weight: 45,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_outlined,
                            size: 38,
                            weight: 45,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.fastLinearToSlowEaseIn,
                    bottom: 0,
                    left: changePositionedOfLine(),
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(left: 10),
                      width: changeContainerWidth(),
                      height: size.height * 0.008,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.fastLinearToSlowEaseIn,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:
                  size.height * 1, // Adjust the height as per your requirement
              child: IndexedStack(
                index: current,
                children:
                    tabs.map((tab) => getTabView(tabs.indexOf(tab))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestingView {}
