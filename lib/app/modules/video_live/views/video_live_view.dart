import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/video_live_controller.dart';

class VideoLiveView extends GetView<VideoLiveController> {
  const VideoLiveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: const Color(0xff733bd4),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/videocall1.jpg'),
                      fit: BoxFit.cover)),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            //bottom container

            Positioned(
              bottom: 1,
              left: 3,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 2,
                          bottom: 2,
                        ),
                        height: 40,
                        width: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Colors.black12,
                        ),
                        child: Row(
                          children: const [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    border: InputBorder.none,
                                    // fillColor:
                                    // Colors.black26, // Change the background color
                                    hintText: 'Enter text here',
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                            Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Icon(Icons.menu, color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Image.asset(
                      'images/gift-box.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),

            //image container

            //top container
            Column(
              children: [
                Positioned(
                  top: 6,
                  left: 1,
                  right: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 8, bottom: 5),
                          height: 50,
                          width: 225,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black38,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage("images/Saiful.jpg"),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Md. Arnab Khan",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    children: const [
                                      FaIcon(
                                        FontAwesomeIcons.coins,
                                        size: 15,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        ' 2335412',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.add_circle_outlined,
                                color: Colors.greenAccent,
                                size: 40,
                              ),
                            ],
                          )),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: 3, // Number of items in the list
                                    itemBuilder: (context, index) {
                                      // Build individual list items
                                      return Container(
                                        padding:
                                            EdgeInsets.only(left: 4, top: 2),
                                        margin: const EdgeInsets.only(left: 2),
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: const CircleAvatar(
                                          backgroundImage:
                                              AssetImage("images/Saiful.jpg"),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 2, top: 2, bottom: 2, right: 2),
                                    margin: const EdgeInsets.only(left: 4),
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black38),
                                    child: const Center(
                                      child: Text(
                                        "103",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child:
                                  const Icon(Icons.close, color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Positioned(
                  top: 4,
                  left: 1,
                  right: 0,
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 35,
                          // width: 115,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black12,
                          ),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.star,
                                  size: 20,
                                ),
                                color: Colors.orange,
                                onPressed: () {},
                              ),
                              const Text(
                                "70582",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              bottom: 55,
              left: 2,
              right: 0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4, // Number of items in the list
                itemBuilder: (context, index) {
                  // Build individual list items
                  return SizedBox(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          margin: const EdgeInsets.only(top: 4),
                          decoration: const BoxDecoration(
                              color: Colors.black38,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 4, top: 2),
                                margin: const EdgeInsets.only(
                                    left: 4, bottom: 4, top: 4),
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.greenAccent),
                                child: Center(
                                  child: Text('$index'),
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              const Text(
                                "Md arnab",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text(
                                "joined",
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Reply",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
