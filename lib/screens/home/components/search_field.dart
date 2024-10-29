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
      height: 38,
      width: SizeConfig.screenWidth! * 0.75,
      // padding: EdgeInsets.symmetric(vertical: -2),
      decoration: BoxDecoration(
        // color: kSecondaryColor.withOpacity(0.1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        cursorHeight: 20,
        // style: TextStyle(fontSize: 10),
        // cursorHeight: 4,
        onChanged: (value) {},
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search Product',
          hintStyle: TextStyle(color: kSecondaryColor,letterSpacing: -1),
          prefixIcon: Icon(
            Icons.search, size: 22, color: kSecondaryColor,
            // size: 30,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 9,
          ),
        ),
      ),
    );
  }
}
