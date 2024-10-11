import 'package:e_commerce/core/Custom%20Widget/default_button.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double size = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight! * 0.04,
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              'assets/images/success.png',
              // fit: BoxFit.cover,
              // width: MediaQuery.sizeOf(context).width,
              // height: SizeConfig.screenHeight! * 0.4,
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.08,
          ),
          Text(
            'Login Success',
            style: TextStyle(
              fontSize: SizeConfig.relativeHeight(30, context),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.6,
            child: DefaultButton(
              text: 'Back to home',
              press: () {
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
