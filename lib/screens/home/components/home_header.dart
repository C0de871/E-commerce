import 'package:e_commerce/core/Custom%20Widget/icon_btn_with_counter.dart';
import 'package:e_commerce/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SearchField(),
        IconBtnWithCounter(svgSrc: 'assets/icons/Cart Icon.svg', numOfItems: 9, press: () {}),
        IconBtnWithCounter(svgSrc: 'assets/icons/Bell.svg', numOfItems: 100, press: () {}),
      ],
    );
  }
}
