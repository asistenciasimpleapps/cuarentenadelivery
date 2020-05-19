import 'package:flutter/material.dart';

class PromoItem extends StatelessWidget {

  final NetworkImage networkImage;

  PromoItem({
    this.networkImage
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
              fit: BoxFit.fitWidth,
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
