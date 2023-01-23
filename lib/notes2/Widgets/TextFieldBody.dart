import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWriteNote extends StatelessWidget {
  
  final TextEditingController controller;

  const TextWriteNote({ required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.getFont('Inter'),
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Write a note...',
          contentPadding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}