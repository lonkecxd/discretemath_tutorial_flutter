import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(
          fontFamily: 'ComicSnasMS',
          fontSize: 22.0,
        ),
        headline2: base.headline2.copyWith(
            fontSize: 20.0,
            color: Color.fromARGB(255, 22, 209, 233)
        ),
      bodyText1: base.bodyText1.copyWith(
        fontSize: 20.0
      ),
      bodyText2: base.bodyText2.copyWith(
          fontSize: 18.0
      ),
    );
  }

  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      primaryColor: Color(0xff303b4d),
      indicatorColor: Color(0xff63ffda),
      cardColor: Color.fromARGB(255, 48, 77, 108),
//      accentColor: Color(0xff445f7b),
//      canvasColor: Color(0xff445f7b)
  );
}
