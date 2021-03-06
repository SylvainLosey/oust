import 'package:flutter/material.dart';

import 'colors.dart';


ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'Poppins',
    textTheme: dense2018,
    primaryColor: primaryColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      // filled: true,
      // fillColor: Colors.white,
      border: OutlineInputBorder(),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
    // sliderTheme: SliderThemeData().copyWith(
    //   trackHeight: 8,
    //   activeTrackColor: Colors.grey[300],
    //   inactiveTrackColor: Colors.grey[300],
    //   activeTickMarkColor: Colors.grey,
    //   inactiveTickMarkColor: Colors.grey,
    //   thumbColor: Colors.grey[700],
    //   overlayColor: accentColor.withOpacity(0.3)
    // )
    
  );
}


/// The font weights, and letter spacings in this version match the
/// latest [Material Design specification](https://material.io/go/design-typography#typography-styles).
/// Size has been downsized by around 2 from original specification

const TextTheme dense2018 = TextTheme(
  display4  : TextStyle(debugLabel: 'dense display4 2018',  fontSize: 90.0, fontWeight: FontWeight.w100, textBaseline: TextBaseline.ideographic),
  display3  : TextStyle(debugLabel: 'dense display3 2018',  fontSize: 56.0, fontWeight: FontWeight.w100, textBaseline: TextBaseline.ideographic),
  display2  : TextStyle(debugLabel: 'dense display2 2018',  fontSize: 44.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic),
  display1  : TextStyle(debugLabel: 'dense display1 2018',  fontSize: 32.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic),
  headline  : TextStyle(debugLabel: 'dense headline 2018',  fontSize: 22.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic),
  title     : TextStyle(debugLabel: 'dense title 2018',     fontSize: 19.0, fontWeight: FontWeight.w500, textBaseline: TextBaseline.ideographic),
  subhead   : TextStyle(debugLabel: 'dense subhead 2018',   fontSize: 15.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic),
  body2     : TextStyle(debugLabel: 'dense body2 2018',     fontSize: 15.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic),
  body1     : TextStyle(debugLabel: 'dense body1 2018',     fontSize: 13.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic),
  caption   : TextStyle(debugLabel: 'dense caption 2018',   fontSize: 11.0, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic),
  button    : TextStyle(debugLabel: 'dense button 2018',    fontSize: 13.0, fontWeight: FontWeight.w500, textBaseline: TextBaseline.ideographic),
  subtitle  : TextStyle(debugLabel: 'dense subtitle 2018',  fontSize: 13.0, fontWeight: FontWeight.w500, textBaseline: TextBaseline.ideographic),
  overline  : TextStyle(debugLabel: 'dense overline 2018',  fontSize: 9.0,  fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic),
);
