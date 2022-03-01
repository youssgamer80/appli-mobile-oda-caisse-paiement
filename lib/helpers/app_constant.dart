import 'package:flutter/material.dart';

class AppConstants {
  static const String URL_BASE = "https://oda-cagnotte.herokuapp.com/api/v1";

  static const String placeholder = "assets/images/placeholder.jpg";
//tailles des polices
  static const double font_size_extraSmall8 = 8;
  static const double font_size_extraSmall10 = 10.0;
  static const double font_size_small12 = 12.0;
  static const double font_size_default14 = 14.0;
  static const double font_size_large16 = 16.0;
  static const double font_size_large20 = 20.0;
  static const double font_size_extra_large18 = 18.0;
  static const double font_size_over_large24 = 24.0;

  static const Color pink = Color(0xFFf9429e);
  static const Color black = Color(0xFF000000);
  static const Color gray = Color(0xFFEBEBEB);
  static const Color red = Color(0xFFFF6C59);
  static const Color white = Color(0xFFFFFFFF);
  static const Color hGrey = Color(0xFF9F9F9F);
  static const Color scaffoldBackground = Color(0xffF4F7FC);
  Color overlay10 = black.withOpacity(0.1);

  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

// dimensions

  static const double padding_size_extra_small = 5.0;
  static const double padding_size_small = 10.0;
  static const double padding_size_default = 15.0;
  static const double padding_size_large = 20.0;
  static const double padding_size_extraLarge = 25.0;

  static const double radius_small = 5.0;
  static const double radius_default = 10.0;
  static const double radius_large = 15.0;
  static const double radius_extra_large = 20.0;

// Lottie

  static const String gif_load = "assets/gifs/load.gif";
  static const String lottie_load = "assets/lotties/load.json";
  static const String lottie_load_search =
      "assets/lotties/search_loader_pink.json";
  static const String lottie_location_load =
      "assets/lotties/location_load.json";
  static const String lottie_confiti_success =
      "assets/lotties/confiti_success.json";
  static const String lottie_empty_search = 'assets/lotties/search_empty.json';

  static const String lottie_new_request = "assets/lotties/ new_request.json";
//Svg
  static const String svg_search = "search.svg";
  static const String svg_home = "home.svg";

  BoxShadow shadowPrimary =
      BoxShadow(color: pink.withOpacity(0.3), blurRadius: 8);

  BoxShadow shadowSecondary =
      BoxShadow(color: black.withOpacity(0.3), blurRadius: 8);

  BoxShadow shadowNagivationBar = BoxShadow(
      color: black.withOpacity(0.3), offset: Offset(5, 0), blurRadius: 8);

  static const String song = "assets/music/notification.mp3";
  static const String lorem_ipsim =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent iaculis, libero eu scelerisque interdum, purus augue convallis tellus, ut';
}

class AppSizes {
  static const int splashScreenTitleFontSize = 48;
  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const app_bar_size = 56.0;
  static const app_bar_expanded_size = 180.0;
  static const tile_width = 148.0;
  static const tile_height = 276.0;
}
