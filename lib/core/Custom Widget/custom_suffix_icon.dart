import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        SizeConfig.relativeWidth(15, context),
        SizeConfig.relativeWidth(15, context),
        SizeConfig.relativeWidth(15, context),
      ),
      child: SvgPicture.asset(
        icon,
        height: SizeConfig.relativeWidth(18, context),
      ),
    );
  }
}
