import 'package:assessment2023/main.dart';
import 'package:assessment2023/utils/helper/ThemeHelper.dart';
import 'package:flutter/material.dart';

class SwitchModWidget extends StatelessWidget {
  const SwitchModWidget({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onTap,
              child: Center(child: Icon(Icons.light))),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                  color: !getIt.get<ThemeHelper>().isDark
                      ? Colors.transparent
                      : Colors.yellow.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              // height: 50,
              // width: 50,
            ),
          )
        ],
      ),
    );
  }
}
