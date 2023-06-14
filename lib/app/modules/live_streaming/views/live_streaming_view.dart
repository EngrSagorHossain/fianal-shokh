import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/live_streaming_controller.dart';

class LiveStreamingView extends GetView<LiveStreamingController> {
  const LiveStreamingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LiveStreamingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LiveStreamingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
