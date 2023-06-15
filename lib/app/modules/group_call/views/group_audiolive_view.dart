import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/group_call_controller.dart';

class GroupAudioLivelView extends GetView<GroupCallController> {
  const GroupAudioLivelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff733bd4),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Colors.deepPurple,
                    Colors.blueAccent,
                  ])),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            //bottom container

            Positioned(
              bottom: 1,
              left: 3,
              right: 0,
              child: Row(
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
                  const SizedBox(
                    width: 10,
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
                  const SizedBox(
                    width: 10,
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
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black26,
                      ),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.back_hand_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Join",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ))
                ],
              ),
            ),

            //image container
            Positioned(
              top: 90,
              left: 0,
              right: 15,
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 135,
                        width: 135,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage("images/prv.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "ARNAB",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                FontAwesomeIcons.coins,
                                size: 12,
                                color: Colors.yellow,
                              ),
                              Text(
                                "12534",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: AssetImage("images/girls.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "ARNAB",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        FontAwesomeIcons.coins,
                                        size: 12,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "12534",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: AssetImage("images/girls.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "ARNAB",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        FontAwesomeIcons.coins,
                                        size: 12,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "12534",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: AssetImage("images/girls.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "ARNAB",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        FontAwesomeIcons.coins,
                                        size: 12,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "12534",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: AssetImage("images/chair.png"),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "ARNAB",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        FontAwesomeIcons.coins,
                                        size: 12,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "12534",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: AssetImage("images/chair.png"),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "ARNAB",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        FontAwesomeIcons.coins,
                                        size: 12,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "12534",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: AssetImage("images/girls.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "ARNAB",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        FontAwesomeIcons.coins,
                                        size: 12,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "12534",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: AssetImage("images/chair.png"),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "ARNAB",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        FontAwesomeIcons.coins,
                                        size: 12,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "12534",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: AssetImage("images/chair.png"),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "ARNAB",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        FontAwesomeIcons.coins,
                                        size: 12,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "12534",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //top bottom container
            Positioned(
              top: 6,
              left: 1,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 8,
                      bottom: 0,
                    ),
                    height: 40,
                    width: 225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("images/Saiful.jpg"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "MD Sagor Hossain",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text("ID: 0124564111",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.add_circle_outlined,
                          color: Colors.blue,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Icon(Icons.power_settings_new_sharp,
                              color: Colors.white),
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
                          child: const Icon(Icons.close_fullscreen,
                              color: Colors.white),
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
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Positioned(
              top: 55,
              left: 1,
              right: 0,
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 4),
                      height: 25,
                      width: 115,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.coins,
                              size: 10,
                            ),
                            color: Colors.yellow,
                            onPressed: () {},
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            "70582",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                      height: 25,
                      width: 115,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: const Icon(
                                Icons.star_border,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            "7823459",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 3, // Number of items in the list
                          itemBuilder: (context, index) {
                            // Build individual list items
                            return Container(
                              padding: const EdgeInsets.only(left: 4, top: 2),
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
                          padding: const EdgeInsets.only(left: 4, top: 2),
                          margin: const EdgeInsets.only(left: 4),
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black38),
                          child: const Center(
                            child: Text(
                              "103+",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //joined listview

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
