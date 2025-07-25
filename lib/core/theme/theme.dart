import 'package:flutter/material.dart';
import 'package:learn_flutter_auth_with_bloc/core/theme/app_palette.dart';

class AppTheme {
  static _border([Color color = AppPalette.borderColor]) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 2),
    borderRadius: BorderRadius.circular(10),
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    // scaffoldBackgroundColor: AppPalette.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(20),
      enabledBorder: _border(),
      focusedBorder: _border(AppPalette.blueColor),
      errorBorder: _border(AppPalette.redColor),
      focusedErrorBorder: _border(AppPalette.redColor),
      errorStyle: TextStyle(color: AppPalette.redColor),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.maxFinite, 55),
        backgroundColor: AppPalette.blueColor,
        foregroundColor: AppPalette.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
