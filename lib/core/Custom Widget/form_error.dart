import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      errors.length,
      (index) => formErrorText(errors[index],context),
    ));
  }

  Row formErrorText(String error,BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: SizeConfig.relativeHeight(14, context),
          width: SizeConfig.relativeWidth(14, context),
        ),
        SizedBox(width: SizeConfig.relativeWidth(10, context)),
        Text(
          error,
        ),
      ],
    );
  }
}
