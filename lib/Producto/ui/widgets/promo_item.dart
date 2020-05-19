import 'package:flutter/material.dart';

class PromoItem extends StatelessWidget {

  final NetworkImage networkImage;

  PromoItem({
    this.networkImage
  });

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
            fit: screenSize.width>1500 ? BoxFit.fitHeight : BoxFit.fitWidth,
            image: networkImage
        ),
        Container(
          color: Colors.black.withOpacity(0),
        ),
      ],
    );
  }
}
