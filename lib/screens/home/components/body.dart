import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:e_commerce/screens/home/components/categories.dart';
import 'package:e_commerce/screens/home/components/discount_banner.dart';
import 'package:e_commerce/screens/home/components/home_header.dart';
import 'package:e_commerce/screens/home/components/section_title.dart';
import 'package:e_commerce/screens/home/components/special_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            const SizedBox(height: 30),
            const SpecialOffers(),
            const SizedBox(height: 30),
            SectionTitle(
              text: 'Popular Product',
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
