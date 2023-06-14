import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/app/modules/messenger/views/messenger_view.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 18, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Me",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Icon(
                      Icons.person_2_sharp,
                      color: Colors.black,
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("images/Saiful.jpg"),
                radius: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: const Text(
                  "Mr.Error",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                "ID:3254653228",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                "Audio",
                style: TextStyle(color: Colors.deepPurple),
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    Center(
                        child: Text(
                      "2",
                      style: TextStyle(fontSize: 25, color: Colors.black87),
                    )),
                    Text(
                      "Friends",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    Center(
                        child: Text(
                      "15",
                      style: TextStyle(fontSize: 25, color: Colors.black87),
                    )),
                    Text(
                      "Following",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    Center(
                        child: Text(
                      "17",
                      style: TextStyle(fontSize: 25, color: Colors.black87),
                    )),
                    Text(
                      "Fans",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(
                                image: AssetImage("images/vip2.png"),
                                fit: BoxFit.cover)),
                      ),
                      const Text(
                        "check my vip",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(
                                image: AssetImage("images/verify.png"),
                                fit: BoxFit.cover)),
                      ),
                      const Text(
                        "Verify",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(
                                image: AssetImage("images/coin.png"),
                                fit: BoxFit.cover)),
                      ),
                      const Text(
                        "Store",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(
                                image: AssetImage("images/ludo2.png"),
                                fit: BoxFit.cover)),
                      ),
                      const Text(
                        "Ludo",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   height: 7,
          //   color: Colors.grey,
          // ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(const MessengerView()),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.message,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Messages",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            "2",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.notification_important,
                            color: Colors.greenAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Official Messages",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "2",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.currency_bitcoin_rounded,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Wallet",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "2",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.shopping_bag_sharp,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Item Bag",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "2",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.feed,
                            color: Colors.greenAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "My Post",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "2",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
