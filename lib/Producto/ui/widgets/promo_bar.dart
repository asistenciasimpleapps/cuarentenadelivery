import 'dart:async';

import 'package:flutter/material.dart';
import 'promo_item.dart';

class PromoBar extends StatefulWidget {
  @override
  _PromoBarState createState() => _PromoBarState();
}

class _PromoBarState extends State<PromoBar> {

  PageController _controller;
  NetworkImage page1, page2, page3;

  @override
  Widget build(BuildContext context) {

    _controller = new PageController();
    new Timer.periodic(Duration(seconds: 5), (timer) => cambiarPage());

    page1 = NetworkImage("https://cdn.pixabay.com/photo/2016/04/25/23/53/euro-1353420_960_720.jpg");
    page2 = NetworkImage("https://cdn.pixabay.com/photo/2020/05/16/20/30/dog-5179118_960_720.jpg");
    page3 = NetworkImage("https://cdn.pixabay.com/photo/2016/09/02/08/58/signs-1638668_960_720.jpg");

    return Container(
      width: null,
      height: MediaQuery.of(context).size.height*0.3,
      child: PageView(
        controller: _controller,
        children: [
          PromoItem(
            networkImage: page1,
          ),
          PromoItem(
            networkImage: page2,
          ),
          PromoItem(
            networkImage: page3,
          ),
        ],
      ),
    );
  }

  Timer cambiarPage(){
    if(_controller.page == 2){
      _controller.animateToPage(
          0,
          duration: Duration(
            seconds: 1
          ),
          curve: Curves.decelerate
      );
    }else{
      _controller.nextPage(
          duration: Duration(
              seconds: 1
          ),
          curve: Curves.decelerate
      );
    }

  }
}
