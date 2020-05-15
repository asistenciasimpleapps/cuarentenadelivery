import 'package:flutter/material.dart';

class PromoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 87, 51, 0.1),
            ),
            child: FadeInImage(
                placeholder: AssetImage("img/no-image.png"),
                image: NetworkImage("")
            ),
          )
        ],
      ),
    );
  }
}
