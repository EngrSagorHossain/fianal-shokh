import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/audio_live_controller.dart';

class AudioLiveView extends GetView<AudioLiveController> {
  const AudioLiveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AudioLiveView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AudioLiveView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
