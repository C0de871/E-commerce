import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search Product',
          prefixIcon: Icon(
            Icons.search,
            size: SizeConfig.relativeWidth(22, context),
            // size: 30,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.relativeWidth(20, context),
            vertical: SizeConfig.relativeWidth(9, context),
          ),
        ),
      ),
    );
  }
}
