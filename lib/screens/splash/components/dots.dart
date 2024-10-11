
import 'package:e_commerce/core/configurations/constants.dart';
import 'package:flutter/material.dart';

class BuildDot extends StatelessWidget {
  const BuildDot({
    super.key,
    required this.index,
    required this.currentPage,
  });

  final int index;

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFd8d8d8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
