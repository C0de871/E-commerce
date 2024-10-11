import 'package:e_commerce/core/Custom%20Widget/default_button.dart';
import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/screens/SignIn/sign_in_screen.dart';
import 'package:e_commerce/screens/splash/components/dots.dart';

import '../components/splash_content.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final List<Map<String, String>> splashData = [
    {
      'text': 'Welcome to Homies, Lets\' shop!',
      'image': 'assets/images/splash_1.png',
    },
    {
      'text': 'We help people connect with the stores\n Around Syria',
      'image': 'assets/images/splash_2.png',
    },
    {
      'text': 'We show the easy way to shop.\nJust stay at home with us',
      'image': 'assets/images/splash_3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) => setState(() => currentPage = value),
                itemCount: splashData.length,
                itemBuilder: (context, index) {
                  return SplashContent(
                    text: splashData[index]['text']!,
                    image: splashData[index]['image']!,
                  );
                },
              ),
            ),
            const SizedBox(
              height: defaultPadding * 1.5,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => BuildDot(
                        currentPage: currentPage,
                        index: index,
                      ),
                    ),
                  ),
                  const Spacer(flex: 5),
                  DefaultButton(
                    text: 'Continue',
                    press: () {
                      Navigator.of(context).pushNamed(SignInScreen.routeName);
                    },
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
