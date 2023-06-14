import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hello/app/modules/group_call/views/group_audiolive_view.dart';
import 'package:hello/app/modules/popular_live/views/video_live_view.dart';
import 'package:hello/app/modules/profile/views/profile_view.dart';

import '../../../../utilis/constant.dart';
import '../../live_data/views/live_data_view.dart';
import '../../live_streaming/views/tabvar_view.dart';

class BottomnavigationView extends GetView {
  const BottomnavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNavigationBarDemo(),
    );
  }
}

class BottomNavigationBarDemo extends StatefulWidget {
  const BottomNavigationBarDemo({super.key});

  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const TabvarView(),
    const PopularLiveView(),
    const LiveDataView(),
    const GroupAudioLivelView(),
    const ProfileView(),
  ];

  final List<Color> _unselectedColors = [
    Colors.grey,
    Colors.grey,
    Colors.redAccent,
    Colors.grey,
    Colors.grey,
  ];
  final Color _selectedColor = kPrimaryColor;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color:
                    _currentIndex == 0 ? _selectedColor : _unselectedColors[0]),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.earthAmericas,
                color:
                    _currentIndex == 1 ? _selectedColor : _unselectedColors[1]),
            label: 'Explorer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call,
                size: 40,
                color:
                    _currentIndex == 2 ? _selectedColor : _unselectedColors[2]),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.starHalfStroke,
                color:
                    _currentIndex == 3 ? _selectedColor : _unselectedColors[3]),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userAstronaut,
                color:
                    _currentIndex == 4 ? _selectedColor : _unselectedColors[4]),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const TabBarView(
        children: [],
      ),
    );
  }
}

class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Live Classes Screen'),
    );
  }
}

class LiveClassesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Live Classes Screen'),
    );
  }
}
