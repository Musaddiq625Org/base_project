import 'package:base_project/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FontStylesConstants {
  ///Subtitle 28
  static TextStyle headingOneBigFont({
    Color color = ColorConstants.black,
    FontWeight fontWeight = FontWeight.w700,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 28,
      );

  static TextStyle headingOneBigFont25({
    Color color = ColorConstants.lightBlack,
    FontWeight fontWeight = FontWeight.bold,
  }) =>
      GoogleFonts.nunito(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 25,
      );

  ///32
  static TextStyle headingOneBigFont32({
    Color color = ColorConstants.lightBlack,
    FontWeight fontWeight = FontWeight.bold,
  }) =>
      GoogleFonts.nunito(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 32,
      );

  ///20
  static TextStyle headingOneBigFont20({
    Color color = ColorConstants.lightBlack,
    FontWeight fontWeight = FontWeight.bold,
  }) =>
      GoogleFonts.nunito(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 20,
      );

  ///28
  static TextStyle headingOneBigFont28({
    Color color = ColorConstants.lightBlack,
    FontWeight fontWeight = FontWeight.bold,
  }) =>
      GoogleFonts.nunito(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 28,
      );

  ///Subtitle 24
  static TextStyle headingOne({
    Color color = ColorConstants.black,
    FontWeight fontWeight = FontWeight.w700,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 24,
      );

  ///Subtitle 90
  static TextStyle headingNinety({
    Color color = ColorConstants.black,
    FontWeight fontWeight = FontWeight.w700,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 90,
      );

  ///Subtitle 20
  static TextStyle headingTwo({
    Color color = ColorConstants.black,
    FontWeight fontWeight = FontWeight.bold,
  }) =>
      GoogleFonts.nunito(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 20,
      );

  ///Subtitle 17
  static TextStyle headingThree({
    Color color = ColorConstants.black,
    FontWeight fontWeight = FontWeight.bold,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      GoogleFonts.nunito(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        decoration: decoration,
        fontSize: 17,
      );

  ///Subtitle 14
  static TextStyle subtitleOne({
    Color color = ColorConstants.black,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        decoration: decoration,
        fontSize: 14,
        height: 1.4,
      );

  ///Subtitle 12
  static TextStyle subtitleTwo({
    Color color = ColorConstants.black,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 12,
        height: 1.3,
        decoration: decoration,
      );

  ///Subtitle 10
  static TextStyle subtitleThree({
    Color color = ColorConstants.black,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 10,
        decoration: decoration,
      );

  ///Subtitle 14
  static TextStyle headingFour({
    Color color = ColorConstants.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        decoration: decoration,
      );

  //subtitle 15
  static TextStyle subtitle15({
    Color color = ColorConstants.black,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      GoogleFonts.nunito(
        color: color,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        decoration: decoration,
        fontSize: 15,
      );
}
