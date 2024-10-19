import 'package:e_commerce/screens/home/components/catagory_card.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = <Map<String, dynamic>>[
      {'icon': 'assets/icons/Flash Icon.svg', 'text': 'electrical equipments'},
      {'icon': 'assets/icons/Bill Icon.svg', 'text': 'Bill'},
      {'icon': 'assets/icons/Game Icon.svg', 'text': 'Game'},
      {'icon': 'assets/icons/Gift Icon.svg', 'text': 'Fancy'},
      {'icon': 'assets/icons/Discover.svg', 'text': 'More'},
    ];
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(categories.length, (index) {
                return Row(
                  children: [
                    CatagoryCard(icon: categories[index]['icon'], text: categories[index]['text'], press: () {}),
                  ],
                );
              }),
            ),
          ));
    });
  }
}
