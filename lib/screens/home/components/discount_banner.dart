import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.relativeWidth(20, context),
        vertical: SizeConfig.relativeHeight(15, context),
      ),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(0, 6),
            blurRadius: 4,
          ),
        ],
        image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/light theme discount banner.jpg',
            )),
      ),
    );
  }
}
