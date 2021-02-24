import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';



ThemeData theme  =ThemeData(

textTheme: TextTheme(
  headline5: GoogleFonts.handlee(
    fontSize: 70,

  ),
  headline4: GoogleFonts.indieFlower(
fontSize: 30,
  ),

  )
       
  );













class Theme{

ThemeData get theme =>ThemeData(

textTheme: TextTheme(
  headline5: TextStyle(
       fontSize: 30,
       color: Colors.blue,

  ),

)

);


}