
import 'package:flutter/material.dart';
import 'package:magentorx/utils/colour/colors.dart';
import 'package:magentorx/utils/supplemental/cut_corners_border.dart';

class AppTheme {

  static getTheme(){

    IconThemeData _customIconTheme(IconThemeData original) {
      return original.copyWith(color: kShrineSurfaceWhite);
    }

    TextTheme _buildShrineTextTheme(TextTheme base) {
      return base.copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(
            fontSize: 18.0
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        body2: base.body2.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ).apply(
        fontFamily: 'Rubik',
        displayColor: kColorBlue900.withAlpha(200),
        bodyColor: kColorBlue900.withAlpha(200),
      );
    }

    ThemeData _buildShrineTheme() {
      final ThemeData base = ThemeData.light();
      return base.copyWith(
        accentColor: kColorBlue400,
        primaryColor: kColorBlue,
        buttonColor: kShrinePink100,
        scaffoldBackgroundColor: kShrineBackgroundWhite,
        cardColor: kShrineBackgroundWhite,
        textSelectionColor: kShrinePink100,
        errorColor: kShrineErrorRed,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
        ),
        primaryIconTheme: base.iconTheme.copyWith(color: kShrineSurfaceWhite),
        inputDecorationTheme: InputDecorationTheme(
          border: CutCornersBorder(),
        ),
        textTheme: _buildShrineTextTheme(base.textTheme),
        primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
        accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
        iconTheme: _customIconTheme(base.iconTheme),
      );
    }

    final ThemeData _kShrineTheme = _buildShrineTheme();

    return _kShrineTheme;
  }

}