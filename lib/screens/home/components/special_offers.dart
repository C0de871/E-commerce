import 'package:e_commerce/screens/home/components/body.dart';
import 'package:e_commerce/screens/home/components/section_title.dart';
import 'package:e_commerce/screens/home/components/special_offer_card.dart';
import 'package:flutter/material.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Special for you',
          press: () {},
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                press: () {},
                image: 'assets/images/Image Banner 2.png',
                category: 'SmartPhone',
                numOfBrands: 18,
              ),
              const SizedBox(
                width: 20,
              ),
              SpecialOfferCard(
                press: () {},
                image: 'assets/images/Image Banner 3.png',
                category: 'Fashion',
                numOfBrands: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
