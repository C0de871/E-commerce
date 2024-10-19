import 'package:flutter/material.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  });

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 242,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff343434).withOpacity(0.4),
                    const Color(0xff343434).withOpacity(0.15),
                  ],
                ),
              ),
              child: Text.rich(
                TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: '$category\n',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '$numOfBrands Brands'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
