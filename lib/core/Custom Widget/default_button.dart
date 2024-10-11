import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.press,
  });

  final String text;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! - 40,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: press,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            leadingDistribution: TextLeadingDistribution.even,
            color: Colors.white,
            // height: 5,
            fontSize: SizeConfig.relativeHeight(18, context),
          ),
        ),
      ),
    );
  }
}
