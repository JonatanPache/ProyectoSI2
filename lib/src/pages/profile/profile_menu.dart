import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constant.dart';

class ProfileMenu extends StatelessWidget{
  const ProfileMenu({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }):super(key:key);

  final String text,icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:primaryTextColor.withOpacity(0.7)
        ),
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 30,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                    text,
                    style: GoogleFonts.openSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w400
                    ),
                  )
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          )),
    );

  }
}