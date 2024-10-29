import 'package:e_commerce/core/Custom%20Widget/icon_btn_with_counter.dart';
import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:e_commerce/screens/home/components/categories.dart';
import 'package:e_commerce/screens/home/components/discount_banner.dart';
import 'package:e_commerce/screens/home/components/search_field.dart';
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
      statusBarColor: kPrimaryColor, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
    ));
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.relativeHeight(10, context)),
                  const DiscountBanner(),
                  SizedBox(height: SizeConfig.relativeHeight(30, context)),
                  const Categories(),
                  const SizedBox(height: 30),
                  SectionTitle(text: 'Special for you', press: () {}),
                  const SizedBox(height: 20),
                  const SpecialOffers(),
                  const SizedBox(height: 30),
                  SectionTitle(text: 'Popular Product', press: () {}),
                  const SizedBox(height: 20),
                  const SingleChildScrollView(
                    padding: EdgeInsets.only(left: 20, right: 20,bottom: 20),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ProductCard(),
                        SizedBox(width: 15,),
                        ProductCard(),
                        SizedBox(width: 15,),
                        ProductCard(),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 30),
                ],
              ),
            ),
          )
        ],
      ),
    );

    // return SafeArea(
    //   child: SingleChildScrollView(
    //     padding: EdgeInsets.symmetric(
    //       horizontal: SizeConfig.relativeWidth(20, context),
    //     ),
    //     child: Column(
    //       children: [
    //         SizedBox(height: SizeConfig.relativeHeight(20, context)),
    //         const HomeHeader(),
    //         SizedBox(height: SizeConfig.relativeHeight(30, context)),
    //         const DiscountBanner(),
    //         SizedBox(height: SizeConfig.relativeHeight(30, context)),
    //         const Categories(),
    //         const SizedBox(height: 30),
    //         const SpecialOffers(),
    //         const SizedBox(height: 30),
    //         SectionTitle(
    //           text: 'Popular Product',
    //           press: () {},
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 210),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      // width: MediaQuery.sizeOf(context).width / 2,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductFavAndRate(),
          Container(
            child: Image.asset(
              'assets/images/tshirt.png',
              // fit: BoxFit.,
            ),
          ),
          const Text(
            'Tshirt from addidas',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xFF5D6062),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$96.00',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                '\$160.00',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Color(0xFFBEBEBE),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '-30%',
                style: TextStyle(
                  color: Color(0xFF6DBDFB),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Expired:',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                '30/10/2025!',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 201, 230, 250),
                    // color: Colors.red[400],
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProductFavAndRate extends StatelessWidget {
  const ProductFavAndRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Rate(),
        // SizedBox(width: 100,)
        Favorite(),
      ],
    );
  }
}

class Rate extends StatelessWidget {
  const Rate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFF1E0),
        // border: BoxBorder()
        border: Border.all(
          color: const Color(0xFFEFE3D4),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.star, color: Color(0xFFFBAB6D), size: 20),
          SizedBox(width: 5),
          Text(
            '4.8',
            style: TextStyle(
              color: Color(0xFFFBAB6D),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          Text(
            '[17]',
            style: TextStyle(
              color: Color(0xFFFBAB6D),
            ),
          ),
        ],
      ),
    );
  }
}

class Favorite extends StatelessWidget {
  const Favorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFcfe1ee),
        ),
        color: const Color(0xFFDAEFFE),
      ),
      child: const Icon(
        Icons.favorite,
        size: 20,
        color: Color(0xFF6DBDFB),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      shadowColor: kPrimaryColor,
      // elevation: ,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      primary: false,
      pinned: true,
      surfaceTintColor: kPrimaryColor,
      backgroundColor: kPrimaryColor,
      expandedHeight: 175,
      collapsedHeight: 144,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(
          right: 16,
          left: 16,
          bottom: 16,
          top: 16,
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 32,
                    ),
                    SizedBox(width: 16),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Hommies\n',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Express Shopping',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconBtnWithCounter(svgSrc: 'assets/icons/bxs-bell.svg', numOfItems: 100, press: () {}),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SearchField(),
                IconBtnWithCounter(svgSrc: 'assets/icons/bxs-cart.svg', numOfItems: 9, press: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
