import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello/app/modules/auth/views/login_view.dart';

import '../../../../utilis/constant.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final RxBool isChecked = false.obs;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: screenSize.width,
            height: screenSize.height,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'images/logo2.png',
                  height: 175,
                ),
                Text(
                  'SHOKH LIVE',
                  style: GoogleFonts.roboto(
                      fontSize: 30, fontWeight: FontWeight.w900),
                ),
                Text(
                  ' LIVE WITH  CONFIDENT',
                  style: GoogleFonts.lato(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Sign in to experience complete functions',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w300, // Thin 100 font weight
                      color: Colors.black,
                    ),
                  ),
                ),
//phone
                Container(
                  padding: const EdgeInsets.all(8),
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          kSecondaryColor,
                          kPrimaryColor,
                        ]),
                    color: const Color(0xff2CE5D7),
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 0.1,
                      ),
                      const Icon(
                        Icons.phone_android,
                        color: Colors.white,
                        size: 40,
                      ),
                      const SizedBox(width: 35.0),
                      GestureDetector(
                        onTap: () {
                          Get.to(LoginView());
                        },
                        child: const Text(
                          'Sign in with Phone',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
//google
                Container(
                  padding: const EdgeInsets.all(8),
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 1.0),
                      Image.asset(
                        'assets/icons/icons8-google-48.png',
                        height: 40,
                      ),
                      const SizedBox(width: 35.0),
                      const Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //google
                Container(
                  padding: const EdgeInsets.all(8),
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 1.0),
                      Image.asset(
                        'assets/icons/icons8-facebook-48.png',
                        height: 40,
                      ),
                      const SizedBox(width: 35.0),
                      const Text(
                        'Sign in with Facebook',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //google
                Container(
                  padding: const EdgeInsets.all(8),
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 1.0),
                      Image.asset(
                        'assets/icons/icons8-twitter-48.png',
                        height: 40,
                      ),
                      const SizedBox(width: 35.0),
                      const Text(
                        'Sign in with Twitter',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //google
                Container(
                  padding: const EdgeInsets.all(8),
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 1.0),
                      Image.asset(
                        'assets/icons/icons8-vkontakte-48.png',
                        height: 40,
                      ),
                      const SizedBox(width: 35.0),
                      const Text(
                        'Sign in with VKontakte',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //google
                //google
                Container(
                  padding: const EdgeInsets.all(8),
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(width: 1.0),
                      Icon(
                        Icons.apple,
                        size: 40,
                      ),
                      SizedBox(width: 35.0),
                      Text(
                        'Sign in with Apple',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20.0),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //google

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: isChecked.value,
                          onChanged: (value) {
                            isChecked.value = value!;
                          },
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: kSecondaryColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          activeColor: Colors.yellow,
                          checkColor: Colors.amber,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'I Agree to',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black38),
                              ),
                              Text(
                                ' SHOKH Live service agreement and privacy policy',
                                style: TextStyle(
                                    fontSize: 13, color: kPrimaryColor),
                              ),
                            ],
                          ),
                          const Text(
                            '(You have to be Minimum Age to use SHOKH Live)',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black38),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
