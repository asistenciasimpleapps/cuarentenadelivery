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
    NetworkImage("https://cdn.pixabay.com/photo/2017/10/03/17/53/nature-2813487_960_720.jpg"),
    NetworkImage("https://cdn.pixabay.com/photo/2017/10/03/17/53/nature-2813487_960_720.jpg"),
    NetworkImage("https://cdn.pixabay.com/photo/2017/10/03/17/53/nature-2813487_960_720.jpg")
  ];
  Timer _timer;

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    _controller?.dispose();
    _controller = new PageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: screenSize.width>1500 ? 1500*0.9/screenSize.width : 0.9
    );
    if((_timer?.isActive??false)){
      _timer.cancel();
    }else{
      _timer = new Timer(Duration(seconds: 5), () => cambiarPage(1));
    }


    return Container(
      height: screenSize.width>1500 ? 450 : screenSize.width*3/10,
      child: PageView.builder(
        itemCount: page.length,
        controller: _controller,
        onPageChanged: (page){
          _timer.cancel();
          _timer = new Timer(Duration(seconds: 5), () => cambiarPage(page==2 ? 0 : page+1));
        },
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              _timer.cancel();
            },
            onHover: (hover){
              if(hover){
                _timer.cancel();
              }else{
                _timer = new Timer.periodic(Duration(seconds: 5), (timer) => cambiarPage(_controller?.page!=2 ? _controller.page+1 : 0));
              }
            },
            canRequestFocus: true,
            child: PromoItem(
              networkImage: page[index],
            ),
          );
        },
      ),
    );
  }

  void cambiarPage(int page) async {
    _controller?.animateToPage(
        page,
        duration: Duration(
            seconds: 1
        ),
        curve: Curves.ease
    );
  }
}
