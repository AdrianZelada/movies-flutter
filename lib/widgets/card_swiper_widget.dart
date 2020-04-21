import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class CardSwiperWidget extends StatelessWidget {

  final List<dynamic> movies;

  CardSwiperWidget({@required this.movies}) {}

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;    

    return Container(
      padding: EdgeInsets.only(top: 30.0, left: 30.0),
      
      child: Swiper(  
        itemBuilder: (BuildContext context,int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover),
          );
        },
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemCount: 4,      
        layout: SwiperLayout.STACK
      ),
    );
  }
}