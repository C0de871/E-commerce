
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
    required this.icon,
    required this.press,
  });

  final String icon;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(10,context)),
        padding: EdgeInsets.all(
          SizeConfig.relativeWidth(12,context),
        ),
        width: SizeConfig.relativeWidth(40,context),
        height: SizeConfig.relativeHeight(40,context),
        decoration: const BoxDecoration(
          color: Color(0xFFF5f6f9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
