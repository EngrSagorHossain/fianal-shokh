import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Tab1View extends GetView {
  const Tab1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text((index + 1).toString()),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'images/sagor.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                Text(
                  'Mazharul Emon',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(color: Colors.black),
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                Text(
                  '6000000',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(color: Colors.redAccent),
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('>'),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
