import 'package:flutter/material.dart';
import 'package:next_poject/toss/home_screen.dart';

class BackgroundImage extends StatefulWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  State<BackgroundImage> createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
//String? selectedImage;
  List<String> backgroundImage = [
    "assets/T-web.gif",
    "assets/photo-1583339522870-0d9f28cef33f.jpg",
    "assets/optical-matter-machine-nanoscale-machines-convert-light-into-work.gif",
    "assets/load-icon-gif-28.jpg",
    "assets/jhkj.gif",
    "assets/dollar2.png",
    "assets/Butterfly-PNG-3.png",
    "assets/dollar.gif"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: GridView.builder(
          itemCount: backgroundImage.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    //selectedImage = backgroundImage[index];
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Toss(index: 0, inputList: [],selectedImage: backgroundImage[index] )));
                  },
                  child: Container(
                    color: Colors.brown,
                    child: Image.asset(backgroundImage[index]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
