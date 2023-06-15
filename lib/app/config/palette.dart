import 'package:flutter/material.dart';

class Palette {
  static const Color scaffold = Color(0xFFF0F2F5);

  // static const Color facebookBlue = Color(0xFF1777F2);
  static const Color facebookBlue = Color(0xFF9e28b4);

  static const LinearGradient createRoomGradient = LinearGradient(
    // begin: Alignment.topCenter,
    // end: Alignment.bottomCenter,
    colors: [Colors.purple, Color(0xFF9e28b4)],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );

  /*
  Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.purple.shade900,
          Theme.of(context).primaryColor
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
    )
  */
}
