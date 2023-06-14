import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilis/constant.dart';

class PopularView extends GetView {
  const PopularView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6, // Number of tabs
      child: Scaffold(
        appBar: const TabBar(
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Multi'),
            Tab(text: 'Audio'),
            Tab(text: 'PK'),
            Tab(text: 'Star'),
            Tab(text: 'Merchant'),
          ],
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.all(10),
          unselectedLabelColor: Colors.grey,
          indicator: ShapeDecoration(
            shape: StadiumBorder(),
            color: kSecondaryColor,
          ),
        ),
        body: TabBarView(
          children: [
            buildGridView(), // Widget for the 'All' tab
            buildGridView(), // Widget for the 'Multi' tab
            buildGridView(), // Widget for the 'Audio' tab
            buildGridView(), // Widget for the 'PK' tab
            buildGridView(), // Widget for the 'Star' tab
            buildGridView(), // Widget for the 'Merchant' tab
          ],
        ),
      ),
    );
  }

  Widget buildGridView() {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          itemCount: 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return buildGridItem();
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CarouselSlider(
          items: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bdf.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/rdf.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bcb.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 100.0,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return buildGridItem();
            },
          ),
        ),
      ],
    );
  }

  Widget buildGridItem() {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.red,
            image: const DecorationImage(
              image: AssetImage(
                "images/girls2.jpeg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          margin: const EdgeInsets.only(left: 15, top: 15),
        ),
        Positioned(
          top: 9,
          left: 3,
          child: Stack(
            fit: StackFit.passthrough,
            children: const [
              Image(
                image: AssetImage("images/traine.png"),
                height: 35,
                width: 95,
              ),
              Positioned(
                top: 13,
                left: 34,
                child: Text(
                  "Trainee",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 13,
          left: 105,
          child: Stack(
            fit: StackFit.passthrough,
            children: const [
              Image(
                image: AssetImage("images/video.png"),
                height: 35,
                width: 95,
              ),
              Positioned(
                top: 11,
                left: 23,
                child: Text(
                  "Sagor",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: -17,
          bottom: 12,
          child: Stack(
            fit: StackFit.passthrough,
            children: const [
              Image(
                image: AssetImage("images/male.jpg"),
                height: 20,
                width: 125,
              ),
              Positioned(
                top: 6,
                left: 58,
                child: Text(
                  "Male",
                  style: TextStyle(
                    fontSize: 7,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
