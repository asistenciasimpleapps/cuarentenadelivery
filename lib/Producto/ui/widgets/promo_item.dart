import 'package:flutter/material.dart';

class PromoItem extends StatelessWidget {

  double width = 300;
  final NetworkImage networkImage;

  PromoItem({
    this.networkImage
  });

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.height*0.3;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage("img/no-image.png"),
              image: networkImage
          ),
          Container(
            color: Colors.black.withOpacity(0),
          ),
        ],
      ),
    );
  }
}
