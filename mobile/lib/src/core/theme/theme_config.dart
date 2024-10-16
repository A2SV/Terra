import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/dark_theme_colors.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/text_theme.dart';

class ThemeConfig {
  ThemeConfig();

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: AppCommonColors.mainBlueButton,
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppDarkThemeColors.strokeForInputFieldDark,
          ),
        ),
      ),
      buttonTheme: const ButtonThemeData().copyWith(
        buttonColor: AppCommonColors.mainBlueButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      textTheme: CustomTextStyles.kDefaultTextTheme(
        AppDarkThemeColors.smallTextColorDark,
      ),
      colorScheme: _darkColorScheme,
    );
  }

  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      
      primaryColor: AppCommonColors.mainBlueButton,
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppLightThemeColors.strokeForInputFieldLight,
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white, // Set the background color
 

      ),
      buttonTheme: const ButtonThemeData().copyWith(
        buttonColor: AppCommonColors.activeButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      textTheme: CustomTextStyles.kDefaultTextTheme(
        AppLightThemeColors.smallTextColorLight,
      ),
      colorScheme: _lightColorScheme,
    );
  }

  ColorScheme get _darkColorScheme => const ColorScheme.dark().copyWith(
        // primary: AppDarkThemeColors.kDarkPrimaryColor,
        onPrimary: Colors.white,
        // onPrimary: AppDarkThemeColors.kDarkOnPrimaryColor,
        // secondary: AppDarkThemeColors.kDarkSecondaryColor,
        // onSecondary: AppDarkThemeColors.kDarkOnSecondaryColor,
        // tertiary: AppDarkThemeColors.kDarkTertiaryColor,
        // onTertiary: AppDarkThemeColors.kDarkOnTertiaryColor,
      );

  ColorScheme get _lightColorScheme => const ColorScheme.light().copyWith(
        primary: AppCommonColors.mainBlueButton,
        onPrimary: Colors.white,
        // error: AppCommonColors.red,
      );
}
