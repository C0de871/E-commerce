import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 1,
        ),
        Text(
          'Homies',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig.relativeWidth(36, context),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          widget.text,
        ),
        const Spacer(
          flex: 2,
        ),
        // if (widget.image.contains('.png'))
        Expanded(
          flex: 7,
          child: Image.asset(
            widget.image,
            // fit: BoxFit.,
            // height: SizeConfig.relativeHeight(300, context),
            // width: SizeConfig.relativeWidth(235 * 2, context),
          ),
        ),
      ],
    );
  }
}
