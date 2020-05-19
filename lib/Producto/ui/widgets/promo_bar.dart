import 'dart:async';

import 'package:flutter/material.dart';
import 'promo_item.dart';

class PromoBar extends StatefulWidget {
  @override
  _PromoBarState createState() => _PromoBarState();
}

class _PromoBarState extends State<PromoBar> {

  PageController _controller;
  List<NetworkImage> page = [
    NetworkImage("https://cdn.pixabay.com/photo/2016/04/25/23/53/euro-1353420_960_720.jpg"),
    NetworkImage("https://cdn.pixabay.com/photo/2020/05/16/20/30/dog-5179118_960_720.jpg"),
    NetworkImage("https://cdn.pixabay.com/photo/2016/09/02/08/58/signs-1638668_960_720.jpg")
  ];
  Timer _timer;

  @override
  Widget build(BuildContext context) {

    _controller = new PageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: 0.9
    );
    if(!(_timer?.isActive??false)){
      _timer = new Timer.periodic(Duration(seconds: 5), (timer) => cambiarPage());
    }

    return Container(
      width: null,
      height: MediaQuery.of(context).size.height*0.3,
      child: PageView.builder(
        itemCount: page.length,
        controller: _controller,
        itemBuilder: (context, index){
          return PromoItem(
            networkImage: page[index],
          );
        },
      ),
    );
  }

  void cambiarPage(){
    if(_controller?.page?.isFinite && _controller?.page >= 2){
      _controller?.animateToPage(
          0,
          duration: Duration(
            seconds: 1
          ),
          curve: Curves.ease
      );
    }else{
      _controller?.nextPage(
          duration: Duration(
              seconds: 1
          ),
          curve: Curves.decelerate
      );
    }

  }
}
