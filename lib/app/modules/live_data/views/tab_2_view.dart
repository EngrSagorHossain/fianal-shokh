import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Tab2View extends GetView {
  const Tab2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab2View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Tab2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
