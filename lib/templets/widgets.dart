import 'package:flutter/material.dart';

Container card({
 required Color backgroundColor,
 required String image,
 required String text,
}) {
  return Container(
    height: 160,
    width: 160,
    // margin:EdgeInsets.all(5),
    child: Card(
      shadowColor: Colors.cyan,
      color:backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(image),
            ),
            Text(text,style: TextStyle(
                fontSize: 22, color: Colors.black))
          ],
        ),
      ),
    ),
  );
}