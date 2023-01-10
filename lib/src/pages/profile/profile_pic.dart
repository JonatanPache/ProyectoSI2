import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget{
  const ProfilePic({
    Key? key,
  }): super(key:key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 190,
      width: 190,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: CircleAvatar(
              foregroundColor: Colors.black87,
              radius: 5,
              child: CircleAvatar(
                radius: 100,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: SvgPicture.asset('assets/svg/user.svg'),
                  )
              ),
            )
          ),
          /*Positioned(
            right: 0,
            bottom: 0,
            child:SizedBox(
              height: 40,
              width: 40,
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.black87)
                ),
                hoverColor: Colors.white70,
                onPressed: (){},
                child: SvgPicture.asset("assets/svg/electricity.svg"),
              ),
            ),
          )*/
        ],
      ),
    );
  }
}