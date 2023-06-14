import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Tab3View extends GetView {
  const Tab3View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab3View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Tab3View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
