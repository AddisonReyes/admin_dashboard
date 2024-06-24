import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'twitter-white-logo.png',
            height: 50,
            width: 50,
          ),
          const SizedBox(height: 20),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Happening Now',
              style: GoogleFonts.montserratAlternates(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
