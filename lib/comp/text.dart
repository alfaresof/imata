import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text text(String text, double size, FontWeight weight, Color color,
        TextAlign textAlign) =>
    Text(text,
        textAlign: textAlign,
        style: GoogleFonts.inder(
            fontSize: size, fontWeight: weight, color: color));
