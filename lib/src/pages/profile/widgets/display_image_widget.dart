import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final String imgPath;
  final VoidCallback onPressed;
  const DisplayImage({
    Key? key,
    required this.imgPath,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color=Color.fromRGBO(64, 105, 225, 1);
    return Center(
      child: Stack(
        children: [
          buildImage(color),
          Positioned(
              child:buildEditIcon(color),
            right: 4,
            top: 10,
          )
        ],
      ),
    );
  }

  Widget buildEditIcon(Color color)=>buildCircle(
      all: 8,
    child: Icon(
      Icons.edit,
      color: color,
      size: 20,
    )
  );

  Widget buildCircle({required Widget child,
    required double all})=>ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ),
    );

  Widget buildImage(Color color){
    final image=imgPath.contains('http://')
        ?NetworkImage(imgPath)
        :FileImage(File(imgPath));
    return CircleAvatar(
      radius: 75,
      backgroundColor: color,
      child: CircleAvatar(
        backgroundImage: image as ImageProvider,
        radius: 70,
      ),
    );
  }
}
