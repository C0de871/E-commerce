import 'package:e_commerce/core/Custom%20Widget/tool_tip.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:e_commerce/screens/home/components/categories.dart';
import 'package:e_commerce/screens/home/components/discount_banner.dart';
import 'package:e_commerce/screens/home/components/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
    ));
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.relativeWidth(20, context),
        ),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.relativeHeight(20, context)),
            const HomeHeader(),
            SizedBox(height: SizeConfig.relativeHeight(30, context)),
            const DiscountBanner(),
            SizedBox(height: SizeConfig.relativeHeight(30, context)),
            const Categories(),
          ],
        ),
      ),
    );
  }
}

class CatagoryCard extends StatelessWidget {
  const CatagoryCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  // final List<Map<String, dynamic>> categories;
  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffecdf),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextAutoTooltip(
              textAlign: TextAlign.center,
              text: text,
              tooltipText: text,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
