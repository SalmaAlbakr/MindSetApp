import 'package:flutter/material.dart';

class MainButoon extends StatelessWidget {
  MainButoon({
    required this.onTap,
    required this.imageName,
    required this.appName,
    Key? key,
  }) : super(key: key);

  void Function()? onTap;
  String imageName;
  String appName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(imageName),
          ),
          Text(
            appName,
            style: const TextStyle(
              fontSize: 23,
              color: Color(0xff5C2681),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}