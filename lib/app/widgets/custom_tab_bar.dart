import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomTabBar({
    Key? key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.isBottomIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.transparent, width: 0.0),
        ),
      ),
      // indicator: BoxDecoration(
      //   border: isBottomIndicator
      //       ? Border(
      //           bottom: BorderSide(
      //             color: Palette.facebookBlue,
      //             width: 3.0,
      //           ),
      //         )
      //       : Border(
      //           top: BorderSide(
      //             color: Palette.facebookBlue,
      //             width: 3.0,
      //           ),
      //         ),
      // ),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == 2
                        ? Colors.redAccent
                        : i == selectedIndex
                            ? Theme.of(context).primaryColor
                            : Colors.black45,
                    size: i == 2 ? 46 : 30.0,
                  ),
                  // icon: Obx(() {
                  //   return Icon(
                  //     liveStreamController
                  //                 .loadingAllowedStreamingChecker.value &&
                  //             i == 2
                  //         ? Icons.refresh_outlined
                  //         : e,
                  //     color: i == 2
                  //         ? Colors.redAccent
                  //         : i == selectedIndex
                  //             ? Theme.of(context).primaryColor
                  //             : Colors.black45,
                  //     size: i == 2 ? 46 : 30.0,
                  //   );
                  // }),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
