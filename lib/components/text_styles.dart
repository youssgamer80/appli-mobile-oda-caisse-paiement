import 'package:flutter/material.dart';
import 'package:oda_cagnotte/helpers/app_constant.dart';

class AppStyles {
  // tous les styles de TEXT12
  static TextStyle blacknormalText12(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_small12,
        // fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColorDark);
  }

  static TextStyle blacknormalText20(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_large20,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColorDark);
  }

  static TextStyle blacknormalText14(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_default14,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColorDark);
  }

  static TextStyle blackboldText20(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_large20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColorDark);
  }

  static TextStyle withenormalText12(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_small12,
        color: Theme.of(context).primaryColorLight);
  }

  static TextStyle withenormalText16(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_large16,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColorLight);
  }

  static TextStyle withenormalText24(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_over_large24,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColorLight);
  }

  static TextStyle blackBold14(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_default14,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColorDark);
  }

  static TextStyle whiteBold14(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_default14,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColorLight);
  }

  static TextStyle primaryBol14(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_default14,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor);
  }

  static TextStyle witheParagraphText12(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_small12,
        color: Theme.of(context).primaryColorLight);
  }

  static TextStyle witheParagraphText8(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_extraSmall8,
        color: Theme.of(context).primaryColorLight);
  }

  static TextStyle primaryParagraphText12(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_small12,
        color: Theme.of(context).primaryColor);
  }

  static TextStyle primarynormalText24(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_over_large24,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor);
  }

  static TextStyle hintnormalText12(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_small12,
        color: Theme.of(context).hintColor);
  }

  static TextStyle hintnormalText6(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: 6,
        color: Theme.of(context).hintColor);
  }

  static TextStyle primaryColornormalText12(BuildContext context) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontFamilyFallback: ["ProductSans"],
        fontSize: AppConstants.font_size_small12,
        color: Theme.of(context).primaryColor);
  }
}
