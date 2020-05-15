import 'package:flutter/material.dart';

import 'promo_item.dart';

class PromoBar extends StatefulWidget {
  @override
  _PromoBarState createState() => _PromoBarState();
}

class _PromoBarState extends State<PromoBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: null,
      height: 300,
      child: PageView(
        children: [
          PromoItem()
        ],
      ),
    );
  }
}
